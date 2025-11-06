import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../../auth/domain/entities/user_entity.dart';

class UserRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<List<UserEntity>>> getUsers({
    String? search,
    String? lastId,
    int limit = 10,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      Query<Map<String, dynamic>> query = _firestore.collection(
        DBCollections.users,
      );

      // Search filter
      if (search != null && search.isNotEmpty) {
        final lower = search.toLowerCase();
        query = query.where('searchIndex', arrayContains: lower);
      }

      // Order and limit
      query = query.orderBy('createdAt', descending: true).limit(limit);

      // Pagination using lastId as cursor
      if (lastId != null && lastId.isNotEmpty) {
        final lastDoc = await _firestore
            .collection(DBCollections.users)
            .doc(lastId)
            .get();

        if (lastDoc.exists) {
          query = query.startAfterDocument(lastDoc);
        }
      }

      final snapshot = await query.get();

      final users = snapshot.docs.map((doc) {
        final data = doc.data();
        return UserEntity(
          id: doc.id,
          name: data['name'] as String?,
          email: data['email'] as String?,
          phoneNumber: data['phone'] as String?,
          emailVerified: data['emailVerified'] as bool? ?? false,
        );
      }).toList();

      return Result.success(users);
    } on FirebaseException catch (e, s) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      handleException(e, stackTrace: s);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> createUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    String role = 'user', // default role
    String? phoneNumber,
    String? photoUrl,
  }) async {
    try {
      // Validate password confirmation
      if (password != confirmPassword) {
        return const Result.failed('Konfirmasi password tidak cocok');
      }

      // Create user in Firebase Authentication
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        return const Result.failed('Gagal membuat akun pengguna');
      }

      // Send email verification
      await user.sendEmailVerification();

      // Create user data in Firestore
      final userData = {
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
        'phoneNumber': phoneNumber,
        'role': role,
        'emailVerified': false,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection(DBCollections.users)
          .doc(user.uid)
          .set(userData);

      return const Result.success(
        'Akun berhasil dibuat dan email verifikasi telah dikirim',
      );
    } on FirebaseAuthException catch (e, s) {
      final message = getFirebaseAuthExceptionMessage(e);
      handleException(e, stackTrace: s);
      return Result.failed(message);
    } on FirebaseException catch (e, s) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      handleException(e, stackTrace: s);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> updateUser({
    required String userId,
    String? name,
    String? photoUrl,
    String? phoneNumber,
    String? role,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final userRef = _firestore.collection(DBCollections.users).doc(userId);

      final updates = <String, dynamic>{
        if (name != null) 'name': name,
        if (photoUrl != null) 'photoUrl': photoUrl,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (role != null) 'role': role,
        'updatedAt': FieldValue.serverTimestamp(),
      };

      if (updates.isEmpty) {
        return const Result.failed('Tidak ada data yang diubah');
      }

      await userRef.update(updates);

      return const Result.success('Data pengguna berhasil diperbarui');
    } on FirebaseException catch (e, s) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      handleException(e, stackTrace: s);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> deleteUser({required String userId}) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Delete user document from Firestore
      final userRef = _firestore.collection(DBCollections.users).doc(userId);
      await userRef.delete();

      // Delete user from Firebase Authentication
      // Only possible if deleting own account (Firebase restriction)
      if (currentUser.uid == userId) {
        await currentUser.delete();
      }

      return const Result.success('Pengguna berhasil dihapus');
    } on FirebaseAuthException catch (e, s) {
      final message = getFirebaseAuthExceptionMessage(e);
      handleException(e, stackTrace: s);
      return Result.failed(message);
    } on FirebaseException catch (e, s) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      handleException(e, stackTrace: s);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
