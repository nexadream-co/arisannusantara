import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../../profile/domain/entities/faq_entity.dart';

class FaqRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<List<FaqEntity>>> getFaqs() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final querySnapshot = await _firestore
          .collection(DBCollections.faqs)
          .orderBy('created_at', descending: true)
          .get();

      final faqs = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return FaqEntity(
          id: doc.id,
          title: data['title'] as String?,
          description: data['description'] as String?,
          createdAt: (data['created_at'] as Timestamp?)?.toDate(),
          updatedAt: (data['updated_at'] as Timestamp?)?.toDate(),
        );
      }).toList();

      return Result.success(faqs);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
