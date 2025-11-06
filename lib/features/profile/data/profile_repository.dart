import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';

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
        'phoneNumber': phoneNumber,
        'gender': gender,
        'updatedAt': FieldValue.serverTimestamp(),
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
}
