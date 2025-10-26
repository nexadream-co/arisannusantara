import 'package:firebase_auth/firebase_auth.dart';

String getFirebaseAuthExceptionMessage(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-email':
      return 'Alamat email tidak valid.';
    case 'user-disabled':
      return 'Akun pengguna telah dinonaktifkan.';
    case 'user-not-found':
      return 'Pengguna dengan email ini tidak ditemukan.';
    case 'wrong-password':
      return 'Kata sandi yang Anda masukkan salah.';
    case 'email-already-in-use':
      return 'Email sudah digunakan oleh akun lain.';
    case 'weak-password':
      return 'Kata sandi terlalu lemah.';
    case 'operation-not-allowed':
      return 'Operasi tidak diizinkan, silakan hubungi administrator.';
    case 'missing-email':
      return 'Silakan masukkan alamat email Anda.';
    case 'network-request-failed':
      return 'Koneksi internet bermasalah. Silakan coba lagi.';
    case 'too-many-requests':
      return 'Terlalu banyak percobaan login. Silakan coba lagi nanti.';
    case 'invalid-credential':
      return 'Email atau password anda tidak valid atau sudah kedaluwarsa.';
    case 'account-exists-with-different-credential':
      return 'Akun dengan email ini sudah ada menggunakan metode login lain.';
    case 'invalid-verification-code':
      return 'Kode verifikasi tidak valid.';
    case 'invalid-verification-id':
      return 'ID verifikasi tidak valid.';
    case 'expired-action-code':
      return 'Kode verifikasi sudah kedaluwarsa.';
    case 'invalid-action-code':
      return 'Kode verifikasi tidak valid.';
    default:
      throw e;
  }
}
