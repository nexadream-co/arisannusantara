import 'package:firebase_auth/firebase_auth.dart';

String getFirebaseAuthExceptionMessage(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      throw Exception('Alamat email tidak valid.');
    case 'user-disabled':
      throw Exception('Akun pengguna telah dinonaktifkan.');
    case 'user-not-found':
      throw Exception('Pengguna dengan email ini tidak ditemukan.');
    case 'wrong-password':
      throw Exception('Kata sandi yang Anda masukkan salah.');
    case 'email-already-in-use':
      throw Exception('Email sudah digunakan oleh akun lain.');
    case 'weak-password':
      throw Exception('Kata sandi terlalu lemah.');
    case 'operation-not-allowed':
      throw Exception(
        'Operasi tidak diizinkan, silakan hubungi administrator.',
      );
    case 'missing-email':
      throw Exception('Silakan masukkan alamat email Anda.');
    case 'network-request-failed':
      throw Exception('Koneksi internet bermasalah. Silakan coba lagi.');
    case 'too-many-requests':
      throw Exception(
        'Terlalu banyak percobaan login. Silakan coba lagi nanti.',
      );
    case 'invalid-credential':
      throw Exception('Kredensial login tidak valid atau sudah kedaluwarsa.');
    case 'account-exists-with-different-credential':
      throw Exception(
        'Akun dengan email ini sudah ada menggunakan metode login lain.',
      );
    case 'invalid-verification-code':
      throw Exception('Kode verifikasi tidak valid.');
    case 'invalid-verification-id':
      throw Exception('ID verifikasi tidak valid.');
    case 'expired-action-code':
      throw Exception('Kode verifikasi sudah kedaluwarsa.');
    case 'invalid-action-code':
      throw Exception('Kode verifikasi tidak valid.');
    default:
      throw e;
  }
}
