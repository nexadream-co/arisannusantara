import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../domain/entities/payment_account_entity.dart';

mixin PaymentAccountRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<String>> addPaymentAccountToGroup({
    required String groupId,
    required PaymentAccountEntity account,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final groupRef = _firestore.collection(DBCollections.groups).doc(groupId);

      // Check if the group exists
      final groupSnap = await groupRef.get();
      if (!groupSnap.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      // Create a new unique ID for the payment account
      final accountId = _firestore.collection('tmp').doc().id;

      // Prepare payment account data
      final newAccount = {
        'id': accountId,
        'accountName': account.accountName,
        'bankName': account.bankName,
        'bankNumber': account.bankNumber,
      };

      // Add the new account to the group's paymentAccounts array
      await groupRef.update({
        'paymentAccounts': FieldValue.arrayUnion([newAccount]),
      });

      return const Result.success("Akun pembayaran berhasil ditambahkan");
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> updatePaymentAccountInGroup({
    required String groupId,
    required PaymentAccountEntity account,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      if (account.id == null) {
        return const Result.failed('ID akun pembayaran tidak valid');
      }

      final groupRef = _firestore.collection(DBCollections.groups).doc(groupId);

      // Check if the group exists
      final groupSnap = await groupRef.get();
      if (!groupSnap.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      final data = groupSnap.data();
      final accounts = (data?['paymentAccounts'] as List<dynamic>?) ?? [];

      // Find index of account to update
      final index = accounts.indexWhere((a) => a['id'] == account.id);
      if (index == -1) {
        return const Result.failed('Akun pembayaran tidak ditemukan');
      }

      // Create updated account map
      final updatedAccount = {
        ...accounts[index],
        if (account.accountName != null) 'accountName': account.accountName,
        if (account.bankName != null) 'bankName': account.bankName,
        if (account.bankNumber != null) 'bankNumber': account.bankNumber,
      };

      // Replace old account with new one
      accounts[index] = updatedAccount;

      // Save updated list back to Firestore
      await groupRef.update({'paymentAccounts': accounts});

      return const Result.success("Akun pembayaran berhasil diperbarui");
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> deletePaymentAccountFromGroup({
    required String groupId,
    required String accountId,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final groupRef = _firestore.collection(DBCollections.groups).doc(groupId);

      // Check if the group exists
      final groupSnap = await groupRef.get();
      if (!groupSnap.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      final data = groupSnap.data();
      final accounts = (data?['paymentAccounts'] as List<dynamic>?) ?? [];

      // Find target account
      final index = accounts.indexWhere((a) => a['id'] == accountId);
      if (index == -1) {
        return const Result.failed('Akun pembayaran tidak ditemukan');
      }

      // Remove target account
      accounts.removeAt(index);

      // Update Firestore document
      await groupRef.update({'paymentAccounts': accounts});

      return const Result.success("Akun pembayaran berhasil dihapus");
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
