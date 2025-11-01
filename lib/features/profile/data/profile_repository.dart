import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../domain/entities/faq_entity.dart';

class ProfileRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<String>> editProfile({
    required String name,
    required String phoneNumber,
    required String gender, // male / female
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Update user profile in Firebase Auth
      await currentUser.updateDisplayName(name);

      // Update user data in Firestore
      final userRef = _firestore
          .collection(DBCollections.users)
          .doc(currentUser.uid);

      await userRef.update({
        'name': name,
        'phone_number': phoneNumber,
        'gender': gender,
        'updated_at': FieldValue.serverTimestamp(),
      });

      return const Result.success('Profil berhasil diperbarui');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> updatePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null || currentUser.email == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      if (newPassword != confirmPassword) {
        return const Result.failed('Konfirmasi kata sandi tidak cocok');
      }

      // Reauthenticate user before password change
      final cred = EmailAuthProvider.credential(
        email: currentUser.email!,
        password: currentPassword,
      );

      await currentUser.reauthenticateWithCredential(cred);

      // Update password in Firebase Auth
      await currentUser.updatePassword(newPassword);

      return const Result.success('Kata sandi berhasil diperbarui');
    } on FirebaseAuthException catch (e) {
      return Result.failed(getFirebaseAuthExceptionMessage(e));
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> deleteAccount({required String password}) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null || currentUser.email == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Reauthenticate user before deleting
      final cred = EmailAuthProvider.credential(
        email: currentUser.email!,
        password: password,
      );
      await currentUser.reauthenticateWithCredential(cred);

      // Delete user data in Firestore
      final userRef = _firestore
          .collection(DBCollections.users)
          .doc(currentUser.uid);
      await userRef.delete();

      // Delete account from Firebase Auth
      await currentUser.delete();

      return const Result.success('Akun berhasil dihapus');
    } on FirebaseAuthException catch (e) {
      return Result.failed(getFirebaseAuthExceptionMessage(e));
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

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

  Future<Result<Map<String, dynamic>>> getTermAndCondition() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Reference to settings collection
      final settingRef = _firestore
          .collection('settings')
          .where('key', isEqualTo: 'term_condition')
          .limit(1);

      final querySnapshot = await settingRef.get();

      if (querySnapshot.docs.isEmpty) {
        return const Result.failed('Syarat dan Ketentuan tidak ditemukan');
      }

      final doc = querySnapshot.docs.first;
      final data = doc.data();

      return Result.success({
        'key': data['key'],
        'value': data['value'], // already a JSON (Map<String, dynamic>)
        'updated_at': data['updated_at'],
      });
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  Future<Result<Map<String, dynamic>>> getPrivacyPolicy() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Reference to settings collection
      final settingRef = _firestore
          .collection('settings')
          .where('key', isEqualTo: 'privacy_policy')
          .limit(1);

      final querySnapshot = await settingRef.get();

      if (querySnapshot.docs.isEmpty) {
        return const Result.failed('Kebijakan Privasi tidak ditemukan');
      }

      final doc = querySnapshot.docs.first;
      final data = doc.data();

      return Result.success({
        'key': data['key'],
        'value': data['value'], // already a Map<String, dynamic>
        'updated_at': data['updated_at'],
      });
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
