import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../../../core/utils/generate_search_index.dart';
import '../domain/entities/member_entity.dart';

mixin MemberRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  /// Fetch list of members by [groupId].
  /// You can optionally search by [query] that matches `search_index` array.
  Future<Result<List<MemberEntity>>> getMembers({
    required String groupId,
    String? query,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Reference to main members collection
      Query memberQuery = _firestore
          .collection(DBCollections.members)
          .where('group_id', isEqualTo: groupId)
          .orderBy('created_at', descending: true);

      // Add search filter if query provided
      if (query != null && query.isNotEmpty) {
        memberQuery = memberQuery.where(
          'search_index',
          arrayContains: query.toLowerCase(),
        );
      }

      final snapshot = await memberQuery.get();

      final members = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return MemberEntity(
          id: doc.id,
          groupId: data['group_id'] as String?,
          statusPayment: data['status_payment'] as String?,
          isActive: data['is_active'] as bool?,
          skip: data['skip'] as bool?,
          hasReward: data['has_reward'] as bool?,
          paidAt: (data['paid_at'] as Timestamp?)?.toDate(),
          createdAt: (data['created_at'] as Timestamp?)?.toDate(),
          updatedAt: (data['updated_at'] as Timestamp?)?.toDate(),
          group: null,
          user: null,
        );
      }).toList();

      return Result.success(members);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> createMember({
    required MemberEntity member,
    required String userEmail,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Validate group ID
      if (member.groupId == null || member.groupId!.isEmpty) {
        return const Result.failed('ID grup tidak valid');
      }

      // Search user by email
      final userQuery = await _firestore
          .collection(DBCollections.users)
          .where('email', isEqualTo: userEmail)
          .limit(1)
          .get();

      if (userQuery.docs.isEmpty) {
        return const Result.failed(
          'Pengguna dengan email tersebut tidak ditemukan',
        );
      }

      final userDoc = userQuery.docs.first;
      final userData = userDoc.data();
      final userName = (userData['name'] ?? '') as String;
      final userEmailLower = (userData['email'] ?? '').toString().toLowerCase();

      // Generate search index from user name + email
      final searchIndex = generateSearchIndex([userName, userEmailLower]);

      final memberRef = _firestore.collection(DBCollections.members).doc();
      final now = FieldValue.serverTimestamp();

      // Save user as embedded object
      final data = {
        'id': memberRef.id,
        'group_id': member.groupId,
        'status_payment': member.statusPayment,
        'is_active': member.isActive ?? true,
        'skip': member.skip ?? false,
        'has_reward': member.hasReward ?? false,
        'paid_at': member.paidAt,
        'created_at': now,
        'updated_at': now,
        'user': {'id': userDoc.id, 'name': userName, 'email': userEmailLower},
        'search_index': searchIndex,
      };

      await memberRef.set(data);

      return const Result.success('Anggota berhasil ditambahkan');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
