import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../domain/entities/member_entity.dart';

mixin HistoryRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<List<Map<String, dynamic>>>> getHistories(
    String groupId,
  ) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final historiesRef = _firestore.collection(DBCollections.histories);

      // Get histories for specific group ordered by date descending
      final querySnap = await historiesRef
          .where('group_id', isEqualTo: groupId)
          .orderBy('date', descending: true)
          .get();

      if (querySnap.docs.isEmpty) {
        return const Result.success([]);
      }

      final histories = querySnap.docs.map((doc) {
        final data = doc.data();

        return {
          'id': data['id'],
          'group_id': data['group_id'],
          'date': data['date'],
          'notes': data['notes'],
          'amount': data['amount'],
          'reward': data['reward'],
          'group': data['group'],
          'members': List<Map<String, dynamic>>.from(data['members'] ?? []),
          'winner_ids': List<String>.from(data['winner_ids'] ?? []),
          'winners': List<Map<String, dynamic>>.from(data['winners'] ?? []),
          'created_at': data['created_at'],
        };
      }).toList();

      return Result.success(histories);
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
      final winnerList = winners.map((w) => w.toJson()).toList();
      final winnerIds = winners.map((w) => w.user?.id as String).toList();

      // Step 3: Get all members for this group
      final membersSnap = await groupRef
          .collection(DBCollections.members)
          .get();

      final members = membersSnap.docs.map((m) => m.data()).toList();

      // Count only active members
      final activeMembers = members.where((m) => m['is_active'] == true).length;

      // Step 4: Calculate total amount and reward
      final dues = (groupData['dues'] ?? 0) as num;
      final totalAmount = activeMembers * dues;
      final reward = groupData['reward'];
      final notes = groupData['note'];

      // Step 5: Create new history document
      final historyRef = _firestore.collection(DBCollections.histories).doc();

      final now = FieldValue.serverTimestamp();

      final historyData = {
        'id': historyRef.id,
        'group_id': groupId,
        'group': groupData,
        'members': members,
        'winners': winnerList,
        'winner_ids': winnerIds,
        'date': now,
        'notes': notes,
        'amount': totalAmount,
        'reward': reward,
        'created_at': now,
      };

      await historyRef.set(historyData);

      // Step 6: Update members collection
      final batch = _firestore.batch();

      for (final doc in membersSnap.docs) {
        final memberRef = doc.reference;
        final userId = doc.data()['user']['id'];
        final isWinner = winnerIds.contains(userId);

        batch.update(memberRef, {'paid_at': null, 'has_reward': isWinner});
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
