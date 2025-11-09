import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../config/enums/payment_status_enum.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../domain/entities/history_entity.dart';
import '../domain/entities/member_entity.dart';

mixin HistoryRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<List<HistoryEntity>>> getHistories(String groupId) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final historiesRef = _firestore.collection(DBCollections.histories);

      // Get histories for specific group ordered by date descending
      final querySnap = await historiesRef
          .where('groupId', isEqualTo: groupId)
          .orderBy('date', descending: true)
          .get();

      if (querySnap.docs.isEmpty) {
        return const Result.success([]);
      }

      final histories = querySnap.docs.map((doc) {
        final data = doc.data();

        return HistoryEntity.fromJson(data);
      }).toList();

      return Result.success(histories.toList());
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> createHistory({
    required String groupId,
    required List<MemberEntity> winners,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final groupRef = _firestore.collection(DBCollections.groups).doc(groupId);
      final membersRef = _firestore.collection(DBCollections.members);

      // Step 1: Get group data
      final groupSnap = await groupRef.get();
      if (!groupSnap.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      final groupData = groupSnap.data();
      if (groupData == null) {
        return const Result.failed('Data grup tidak valid');
      }

      // Step 2: Prepare winner data
      final winnerList = winners
          .map((w) => w.toJson()..['user'] = w.user?.toJson())
          .toList();
      final winnerIds = winners
          .map((w) => w.user?.id)
          .whereType<String>()
          .toList();

      // Step 3: Get all members for this group (from main members collection)
      final membersSnap = await membersRef
          .where('groupId', isEqualTo: groupId)
          .get();

      final members = membersSnap.docs.map((m) => m.data()).toList();

      // Count only active members
      final activeMembers = members
          .where(
            (m) =>
                m['isActive'] == true &&
                m['paymentStatus'] == PaymentStatusEnum.paid.name,
          )
          .length;

      // Step 4: Calculate total amount and reward
      final dues = (groupData['dues'] ?? 0) as num;
      final totalAmount = activeMembers * dues;
      final reward = groupData['reward'];
      final notes = groupData['note'];

      // Step 5: Create new history document
      final historyRef = _firestore.collection(DBCollections.histories).doc();

      final now = DateTime.now().toIso8601String();

      final historyData = {
        'id': historyRef.id,
        'groupId': groupId,
        'group': groupData,
        'members': members,
        'winners': winnerList,
        'winnerIds': winnerIds,
        'date': now,
        'notes': notes,
        'amount': totalAmount,
        'reward': reward,
        'createdAt': now,
      };

      await historyRef.set(historyData);

      // Step 6: Update members collection (reset payment status, mark winners)
      final batch = _firestore.batch();

      for (final doc in membersSnap.docs) {
        final memberRef = doc.reference;
        final memberData = doc.data();
        final userId = memberData['user']?['id'];
        final isWinner = winnerIds.contains(userId);

        batch.update(memberRef, {
          'paymentStatus': PaymentStatusEnum.unpaid.name,
          'hasReward': isWinner,
        });
      }

      await batch.commit();

      return const Result.success('Riwayat baru berhasil dibuat');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
