import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../domain/entities/notification_entity.dart';

class NotificationRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<List<NotificationEntity>>> getNotifications({
    List<String>? search,
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
      query = query.where('user_id', isEqualTo: currentUser.uid);

      // Optional search filter
      if (search != null && search.isNotEmpty) {
        query = query.where('search_index', arrayContains: search);
      }

      // Order by createdAt for pagination
      query = query.orderBy('created_at', descending: true).limit(limit);

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
        return const Result.failed('Tidak ada notifikasi ditemukan');
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

      final querySnapshot = await _firestore
          .collection(DBCollections.notifications)
          .where('userId', isEqualTo: currentUser.uid)
          .where('isRead', isEqualTo: false)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return const Result.failed('Tidak ada notifikasi yang belum dibaca');
      }

      final batch = _firestore.batch();

      for (final doc in querySnapshot.docs) {
        batch.update(doc.reference, {
          'isRead': true,
          'updatedAt': FieldValue.serverTimestamp(),
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
}
