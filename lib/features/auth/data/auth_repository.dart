import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../domain/entities/user_entity.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;

  /// Login using email and password
  Future<Result<String>> loginByEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan', statusCode: 404);
      }

      // Check if email is verified
      if (!user.emailVerified) {
        // await _auth.signOut();
        return const Result.failed(
          'Email belum diverifikasi. Silakan periksa email Anda untuk verifikasi.',
          statusCode: 403, // Forbidden
        );
      }

      final token = await user.getIdToken();
      if (token == null) {
        return const Result.failed('Token tidak ditemukan', statusCode: 500);
      }

      return const Result.success('Login berhasil');
    } on FirebaseAuthException catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.failed(e.message ?? 'Login gagal silahkan coba kembali');
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  /// Login using Google Sign-In
  Future<Result<String>> loginByGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize(); // required in v7 before usage

      const List<String> scopes = <String>['email', 'profile'];

      final googleUser = await googleSignIn.authenticate(scopeHint: scopes);

      final authorization = await googleUser.authorizationClient
          .authorizationForScopes(scopes);

      if (authorization == null) {
        return const Result.failed('Gagal mendapatkan mengakses akun google');
      }

      final idToken = googleUser.authentication.idToken;
      final accessToken = authorization.accessToken;

      final credential = GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: accessToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      final user = userCredential.user;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan', statusCode: 404);
      }

      // Check if email is verified
      if (!user.emailVerified) {
        // await _auth.signOut();
        return const Result.failed(
          'Email belum diverifikasi. Silakan periksa email Anda untuk verifikasi.',
          statusCode: 403, // Forbidden
        );
      }

      final token = await _auth.currentUser?.getIdToken();
      if (token == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      return Result.success(token);
    } on FirebaseAuthException catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.failed(e.message ?? 'Login gagal silahkan coba kembali');
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  /// Logout from Firebase
  Future<Result<String>> logout() async {
    try {
      final googleSignIn = GoogleSignIn.instance;

      // Important: ensure initialized before use
      await googleSignIn.initialize();

      // Disconnect user from Google (revoke tokens)
      await googleSignIn.disconnect();

      // Sign out from Firebase
      await _auth.signOut();
      return Result.success('Anda berhasil keluar');
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  /// Get current user data
  Future<Result<UserEntity>> getUser() async {
    try {
      final user = _auth.currentUser;
      if (user == null) return Result.failed('Anda belum login');

      return Result.success(
        UserEntity(
          id: user.uid,
          email: user.email ?? '',
          role: 'admin',
          // name: user.displayName,
          // photoUrl: user.photoURL,
        ),
      );
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
