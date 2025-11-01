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
    case 'requires-recent-login':
      return 'Silakan login ulang untuk memperbarui kata sandi';
    default:
      throw e;
  }
}

String getFirebaseFirestoreExceptionMessage(FirebaseException e) {
  switch (e.code) {
    case 'cancelled':
      return 'Operasi dibatalkan. Silakan coba lagi.';
    case 'unknown':
      return 'Terjadi kesalahan yang tidak diketahui.';
    case 'invalid-argument':
      return 'Argumen yang diberikan tidak valid.';
    case 'deadline-exceeded':
      return 'Permintaan memakan waktu terlalu lama, silakan coba lagi.';
    case 'not-found':
      return 'Data yang diminta tidak ditemukan.';
    case 'already-exists':
      return 'Data sudah ada di database.';
    case 'permission-denied':
      return 'Anda tidak memiliki izin untuk melakukan tindakan ini.';
    case 'resource-exhausted':
      return 'Sumber daya Firebase sudah mencapai batas, coba lagi nanti.';
    case 'failed-precondition':
      return 'Kondisi tidak terpenuhi untuk operasi ini.';
    case 'aborted':
      return 'Operasi dibatalkan karena konflik.';
    case 'out-of-range':
      return 'Nilai di luar jangkauan yang diizinkan.';
    case 'unimplemented':
      return 'Operasi ini tidak didukung.';
    case 'internal':
      return 'Terjadi kesalahan internal di server.';
    case 'unavailable':
      return 'Layanan tidak tersedia. Periksa koneksi internet Anda.';
    case 'data-loss':
      return 'Data hilang atau rusak.';
    case 'unauthenticated':
      return 'Sesi Anda telah berakhir, silakan login kembali.';
    default:
      throw e;
  }
}
