import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_auth_exception.dart';
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
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Check if email is verified
      if (!user.emailVerified) {
        // await _auth.signOut();
        return const Result.failed(
          'Email belum diverifikasi. Silakan periksa email Anda untuk verifikasi',
        );
      }

      final token = await user.getIdToken();
      if (token == null) {
        return const Result.failed('Token tidak ditemukan');
      }

      return const Result.success('Login berhasil');
    } on FirebaseAuthException catch (e) {
      return Result.failed(getFirebaseAuthExceptionMessage(e));
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  /// Register using name, email, and password
  Future<Result<String>> registerUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      // Check password confirmation
      if (password != confirmPassword) {
        return const Result.failed('Konfirmasi kata sandi tidak cocok');
      }

      // Create user with email and password
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        return const Result.failed('Gagal membuat akun pengguna');
      }

      // Update display name
      await user.updateDisplayName(name);
      await user.reload();

      // Send email verification
      await user.sendEmailVerification();

      return const Result.success(
        'Registrasi berhasil. Silakan periksa email Anda untuk verifikasi',
      );
    } on FirebaseAuthException catch (e) {
      return Result.failed(getFirebaseAuthExceptionMessage(e));
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
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Check if email is verified
      if (!user.emailVerified) {
        // await _auth.signOut();
        return const Result.failed(
          'Email belum diverifikasi. Silakan periksa email Anda untuk verifikasi',
        );
      }

      final token = await _auth.currentUser?.getIdToken();
      if (token == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      return Result.success(token);
    } on FirebaseAuthException catch (e) {
      return Result.failed(getFirebaseAuthExceptionMessage(e));
    } catch (e, s) {
      if (e.toString().contains(
        'getCredentialAsync no provider dependencies found',
      )) {
        return const Result.failed(
          'Google Play Services pada perangkat Anda perlu diperbarui agar bisa login dengan Google',
        );
      }

      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      if (user.emailVerified) {
        return const Result.failed('Email sudah terverifikasi');
      }

      await user.sendEmailVerification();

      return const Result.success('Email verifikasi telah dikirim');
    } on FirebaseAuthException catch (e) {
      return Result.failed(getFirebaseAuthExceptionMessage(e));
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Result.success('Email reset password telah dikirim');
    } on FirebaseAuthException catch (e) {
      return Result.failed(getFirebaseAuthExceptionMessage(e));
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  /// Logout from Firebase
  Future<Result<String>> logout() async {
    try {
      /// Disconnect Google Sign-In only if the current user logged in with Google.
      /// Skips this step for email/password or other auth methods.
      final user = _auth.currentUser;
      final providers =
          user?.providerData.map((e) => e.providerId).toList() ?? [];

      if (providers.contains('google.com')) {
        final googleSignIn = GoogleSignIn.instance;
        await googleSignIn.disconnect();
      }

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
    } on FirebaseAuthException catch (e) {
      return Result.failed(getFirebaseAuthExceptionMessage(e));
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
