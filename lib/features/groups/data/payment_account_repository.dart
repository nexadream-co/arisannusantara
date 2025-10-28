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

      // Create a new document reference for the payment account
      final accountRef = groupRef
          .collection(DBCollections.paymentAccounts)
          .doc();

      final now = FieldValue.serverTimestamp();

      // Prepare data manually so we can use server timestamp
      final data = {
        'id': accountRef.id,
        'account_name': account.accountName,
        'bank_name': account.bankName,
        'bank_number': account.bankNumber,
        'created_at': now,
        'updated_at': now,
      };

      // Save to Firestore
      await accountRef.set(data);

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

      final accountRef = _firestore
          .collection(DBCollections.groups)
          .doc(groupId)
          .collection(DBCollections.paymentAccounts)
          .doc(account.id);

      // Check if the document exists
      final accountSnap = await accountRef.get();
      if (!accountSnap.exists) {
        return const Result.failed('Akun pembayaran tidak ditemukan');
      }

      // Update fields and set updatedAt using server time
      await accountRef.update({
        if (account.accountName != null) 'account_name': account.accountName,
        if (account.bankName != null) 'bank_name': account.bankName,
        if (account.bankNumber != null) 'bank_number': account.bankNumber,
        'updated_at': FieldValue.serverTimestamp(),
      });

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

      final accountRef = _firestore
          .collection(DBCollections.groups)
          .doc(groupId)
          .collection(DBCollections.paymentAccounts)
          .doc(accountId);

      // Check if the payment account exists
      final accountSnap = await accountRef.get();
      if (!accountSnap.exists) {
        return const Result.failed('Akun pembayaran tidak ditemukan');
      }

      // Delete the document
      await accountRef.delete();

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
