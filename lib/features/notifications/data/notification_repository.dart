import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../../../core/utils/send_push_notification.dart';
import '../domain/entities/notification_entity.dart';

class NotificationRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<List<NotificationEntity>>> getNotifications({
    String? search,
    int limit = 10,
    String? lastId,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      Query<Map<String, dynamic>> query = _firestore.collection(
        DBCollections.notifications,
      );

      // Filter notifications by user
      query = query.where('userId', isEqualTo: currentUser.uid);

      // Optional search filter
      if (search != null && search.isNotEmpty) {
        query = query.where('searchIndex', arrayContains: search);
      }

      // Order by createdAt for pagination
      query = query.orderBy('createdAt', descending: true).limit(limit);

      // Pagination
      if (lastId != null && lastId.isNotEmpty) {
        final lastDoc = await _firestore
            .collection(DBCollections.notifications)
            .doc(lastId)
            .get();
        if (lastDoc.exists) {
          query = query.startAfterDocument(lastDoc);
        }
      }

      final snapshot = await query.get();

      if (snapshot.docs.isEmpty) {
        return const Result.success([]);
      }

      final notifications = snapshot.docs.map((doc) {
        final data = doc.data();
        return NotificationEntity.fromJson({...data, 'id': doc.id});
      }).toList();

      return Result.success(notifications);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> markAllAsRead() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Get all unread notifications (where readAt == null)
      final querySnapshot = await _firestore
          .collection(DBCollections.notifications)
          .where('userId', isEqualTo: currentUser.uid)
          .where('readAt', isNull: true)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return const Result.failed('Tidak ada notifikasi yang belum dibaca');
      }

      final batch = _firestore.batch();

      for (final doc in querySnapshot.docs) {
        batch.update(doc.reference, {
          'readAt': DateTime.now().toString(),
          'updatedAt': DateTime.now().toString(),
        });
      }

      await batch.commit();

      return const Result.success(
        'Semua notifikasi telah ditandai sebagai dibaca',
      );
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<int>> getUnreadCount() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final snapshot = await _firestore
          .collection(DBCollections.notifications)
          .where('userId', isEqualTo: currentUser.uid)
          .where('readAt', isNull: true)
          .get();

      final count = snapshot.size;

      return Result.success(count);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<bool>> createNotifications({
    required List<String> userIds,
    required NotificationEntity notification,
    bool withFCM = true,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // --- 1. Validate ---
      if (userIds.isEmpty) {
        return const Result.failed("Pengguna tidak ditemukan");
      }

      final batch = _firestore.batch();
      final usersRef = _firestore.collection(DBCollections.users);
      final notifRef = _firestore.collection(DBCollections.notifications);

      // --- 2. Firestore 'whereIn' max allowed = 10 ---
      const chunkSize = 10;
      final chunks = <List<String>>[];

      for (int i = 0; i < userIds.length; i += chunkSize) {
        chunks.add(
          userIds.sublist(
            i,
            (i + chunkSize > userIds.length) ? userIds.length : i + chunkSize,
          ),
        );
      }

      // --- 3. Collect device tokens (for FCM) ---
      final List<String> allDeviceTokens = [];

      for (final chunk in chunks) {
        final userSnapshot = await usersRef
            .where(FieldPath.documentId, whereIn: chunk)
            .get();

        for (final doc in userSnapshot.docs) {
          final data = doc.data();

          // Create notification for this user
          final newDoc = notifRef.doc();
          final notifData = {
            ...notification.toJson(),
            "id": newDoc.id,
            "userId": doc.id,
            "readAt": null,
            "createdBy": {
              "id": currentUser.uid,
              "name": currentUser.displayName,
              "email": currentUser.email,
            },
            "createdAt": DateTime.now().toString(),
          };

          batch.set(newDoc, notifData);

          // Collect device token
          final token = data["deviceToken"];
          if (token != null && token.toString().isNotEmpty) {
            allDeviceTokens.add(token);
          }
        }
      }

      // --- 4. Commit all notifications
      await batch.commit();

      // --- 5. Optional FCM Push ---
      if (withFCM && allDeviceTokens.isNotEmpty) {
        FirebasePushService().sendPushToMultipleDevices(
          deviceTokens: allDeviceTokens,
          title: notification.title ?? '',
          body: notification.description ?? '',
        );
      }

      return const Result.success(true);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
