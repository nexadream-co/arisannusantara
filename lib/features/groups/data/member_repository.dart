import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../../../core/utils/generate_search_index.dart';
import '../../auth/domain/entities/user_entity.dart';
import '../domain/entities/member_entity.dart';

mixin MemberRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<List<MemberEntity>>> getMembers({
    required String groupId,
    String? query,
    bool? isActive,
    bool? skip,
    bool? hasReward,
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

      // Apply optional filters if provided
      if (isActive != null) {
        memberQuery = memberQuery.where('is_active', isEqualTo: isActive);
      }

      if (skip != null) {
        memberQuery = memberQuery.where('skip', isEqualTo: skip);
      }

      if (hasReward != null) {
        memberQuery = memberQuery.where('has_reward', isEqualTo: hasReward);
      }

      // Add search filter if query provided
      if (query != null && query.isNotEmpty) {
        memberQuery = memberQuery.where(
          'search_index',
          arrayContains: query.toLowerCase(),
        );
      }

      // Execute query
      final snapshot = await memberQuery.get();

      // Map documents to MemberEntity list
      final members = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final userData = data['user'] as Map<String, dynamic>?;

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
          user: userData != null
              ? UserEntity(
                  id: userData['id'],
                  name: userData['name'],
                  email: userData['email'],
                )
              : null,
        );
      }).toList();

      return Result.success(members);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.failed('Terjadi kesalahan saat mengambil data member');
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

  Future<Result<String>> updateMember(MemberEntity member) async {
    try {
      final memberRef = _firestore.collection('members').doc(member.id);

      // Check if member exists
      final memberSnap = await memberRef.get();
      if (!memberSnap.exists) {
        return const Result.failed('Member tidak ditemukan');
      }

      // Fetch latest user data from Firestore
      final userEmail = member.user?.email;
      if (userEmail == null || userEmail.isEmpty) {
        return const Result.failed('Email pengguna diperlukan');
      }

      final userQuery = await _firestore
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .limit(1)
          .get();

      if (userQuery.docs.isEmpty) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final userDoc = userQuery.docs.first;
      final userData = userDoc.data();

      // Build simplified user object
      final userObject = {
        'id': userDoc.id,
        'name': userData['name'],
        'email': userData['email'],
      };

      // Generate search index from name & email
      final searchIndex = generateSearchIndex([
        userData['name'] ?? '',
        userData['email'] ?? '',
      ]);

      // Prepare updated data
      final now = DateTime.now();
      final data = {
        'group_id': member.groupId,
        'user': userObject,
        'status_payment': member.statusPayment,
        'is_active': member.isActive,
        'skip': member.skip,
        'has_reward': member.hasReward,
        'paid_at': member.paidAt,
        'updated_at': now,
        'search_index': searchIndex,
      };

      // Update Firestore document
      await memberRef.update(data);

      return const Result.success('Data member berhasil diperbarui');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return const Result.failed('Terjadi kesalahan saat memperbarui member');
    }
  }

  Future<Result<String>> deleteMember(String memberId) async {
    try {
      final memberRef = _firestore.collection('members').doc(memberId);

      // Check if member document exists
      final memberSnap = await memberRef.get();
      if (!memberSnap.exists) {
        return const Result.failed('Member tidak ditemukan');
      }

      // Delete the document
      await memberRef.delete();

      return const Result.success('Member berhasil dihapus');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return const Result.failed('Terjadi kesalahan saat menghapus member');
    }
  }

  Future<Result<MemberEntity>> getMemberDetail(String memberId) async {
    try {
      final memberRef = _firestore.collection('members').doc(memberId);

      // Get member document
      final memberSnap = await memberRef.get();
      if (!memberSnap.exists) {
        return const Result.failed('Member tidak ditemukan');
      }

      final data = memberSnap.data()!;

      // Parse user object
      final userData = data['user'] as Map<String, dynamic>?;

      // Create MemberEntity from Firestore data
      final member = MemberEntity(
        id: data['id'],
        groupId: data['group_id'],
        statusPayment: data['status_payment'],
        isActive: data['is_active'],
        skip: data['skip'],
        hasReward: data['has_reward'],
        paidAt: (data['paid_at'] as Timestamp?)?.toDate(),
        createdAt: (data['created_at'] as Timestamp?)?.toDate(),
        updatedAt: (data['updated_at'] as Timestamp?)?.toDate(),
        user: userData != null
            ? UserEntity(
                id: userData['id'],
                name: userData['name'],
                email: userData['email'],
              )
            : null,
      );

      return Result.success(member);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return const Result.failed(
        'Terjadi kesalahan saat mengambil detail member',
      );
    }
  }
}
