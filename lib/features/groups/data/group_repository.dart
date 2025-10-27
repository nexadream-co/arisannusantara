import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../domain/entities/group_entity.dart';
import 'history_repository.dart';
import 'member_repository.dart';
import 'payment_repository.dart';

class GroupRepository
    with
        GroupDetailRepository,
        HistoryRepository,
        MemberRepository,
        PaymentRepository {
  GroupRepository._();
}

mixin GroupDetailRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<String>> createGroup(GroupEntity group) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final groupId = _firestore.collection(DBCollections.groups).doc().id;

      // Generate a unique random 5-character code
      const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
      final random = Random();
      String code;
      bool isUnique = false;

      do {
        code = List.generate(
          5,
          (index) => chars[random.nextInt(chars.length)],
        ).join();

        final query = await _firestore
            .collection(DBCollections.groups)
            .where('code', isEqualTo: code)
            .limit(1)
            .get();

        isUnique = query.docs.isEmpty;
      } while (!isUnique);

      final now = DateTime.now().toString();

      final groupData = {
        'id': groupId,
        'name': group.name,
        'description': group.description,
        'code': code,
        'periods_date': group.periodsDate,
        'dues': group.dues,
        'target': group.target,
        'owners': [user.uid], // current user as owner
        'payment_accounts': group.paymentAccounts
            ?.map(
              (e) => {
                'account_name': e.accountName,
                'bank_name': e.bankName,
                'bank_number': e.bankNumber,
                'created_at': now,
                'updated_at': now,
              },
            )
            .toList(),
        'created_at': now,
        'updated_at': now,
      };

      await _firestore
          .collection(DBCollections.groups)
          .doc(groupId)
          .set(groupData);

      return Result.success(groupId);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
