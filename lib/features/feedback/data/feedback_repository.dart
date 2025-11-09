import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../config/enums/feedback_status_enum.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../../../core/utils/generate_search_index.dart';
import '../domain/entities/feedback_entity.dart';

class FeedbackRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<List<FeedbackEntity>>> getFeedbacks({
    String? search,
    FeedbackStatusEnum? status, // process, done, ignored
    int limit = 10,
    String? lastId,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      Query<Map<String, dynamic>> query = _firestore.collection(
        DBCollections.feedback,
      );

      // Optional status filter
      if (status != null) {
        query = query.where('status', isEqualTo: status.name);
      }

      // Optional search filter
      if (search != null && search.isNotEmpty) {
        query = query.where('searchIndex', arrayContains: search);
      }

      // Order by createdAt for pagination
      query = query.orderBy('createdAt', descending: true).limit(limit);

      // Pagination using last document
      if (lastId != null && lastId.isNotEmpty) {
        final lastDoc = await _firestore
            .collection(DBCollections.feedback)
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

      final feedbacks = snapshot.docs.map((doc) {
        final data = doc.data();
        return FeedbackEntity.fromJson({...data, 'id': doc.id});
      }).toList();

      return Result.success(feedbacks);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> createFeedback({
    required String title,
    required String feedback,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final userData = {
        'id': currentUser.uid,
        'email': currentUser.email,
        'name': currentUser.displayName,
        'photoUrl': currentUser.photoURL,
      };

      final feedbackData = {
        'userId': currentUser.uid,
        'email': currentUser.email,
        'searchIndex': generateSearchIndex([currentUser.email, title]),
        'user': userData,
        'title': title,
        'feedback': feedback,
        'status': FeedbackStatusEnum.process.name,
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      };

      await _firestore.collection(DBCollections.feedback).add(feedbackData);

      return Result.success('Feedback berhasil dikirim');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> updateStatusFeedback({
    required String feedbackId,
    required FeedbackStatusEnum newStatus,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final feedbackRef = _firestore
          .collection(DBCollections.feedback)
          .doc(feedbackId);

      await feedbackRef.update({
        'status': newStatus.name,
        'updatedAt': DateTime.now().toString(),
      });

      return const Result.success('Status feedback berhasil diperbarui');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> deleteFeedback({required String feedbackId}) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final feedbackRef = _firestore
          .collection(DBCollections.feedback)
          .doc(feedbackId);
      final feedbackDoc = await feedbackRef.get();

      if (!feedbackDoc.exists) {
        return const Result.failed('Feedback tidak ditemukan');
      }

      // Optional: Ensure only the owner can delete their feedback
      final feedbackData = feedbackDoc.data();
      if (feedbackData?['userId'] != currentUser.uid) {
        return const Result.failed(
          'Anda tidak memiliki izin untuk menghapus feedback ini',
        );
      }

      await feedbackRef.delete();

      return const Result.success('Feedback berhasil dihapus');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
