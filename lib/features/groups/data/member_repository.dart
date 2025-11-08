import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../config/enums/payment_status_enum.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../../../core/extensions/string_extensions.dart';
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
          .where('groupId', isEqualTo: groupId)
          .orderBy('createdAt', descending: true);

      // Apply optional filters if provided
      if (isActive != null) {
        memberQuery = memberQuery.where('isActive', isEqualTo: isActive);
      }

      if (skip != null) {
        memberQuery = memberQuery.where('skip', isEqualTo: skip);
      }

      if (hasReward != null) {
        memberQuery = memberQuery.where('hasReward', isEqualTo: hasReward);
      }

      // Add search filter if query provided
      if (query != null && query.isNotEmpty) {
        memberQuery = memberQuery.where(
          'searchIndex',
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
          email: data['email'] as String?,
          groupId: data['groupId'] as String?,
          paymentStatus: data['paymentStatus']
              ?.toString()
              .toPaymentStatusEnum(),
          isActive: data['isActive'] as bool?,
          hasReward: data['hasReward'] as bool?,
          paidAt: (data['paidAt'] as Timestamp?)?.toDate(),
          createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
          updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
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

      // Save member data
      final data = {
        'id': memberRef.id,
        'email': userData['email'],
        'groupId': member.groupId,
        'paymentStatus': member.paymentStatus?.name,
        'isActive': member.isActive ?? true,
        'hasReward': member.hasReward ?? false,
        'paidAt': member.paidAt,
        'createdAt': now,
        'updatedAt': now,
        'user': {'id': userDoc.id, 'name': userName, 'email': userEmailLower},
        'searchIndex': searchIndex,
      };

      await memberRef.set(data);

      // Add member ID to group member_ids list
      final groupRef = _firestore
          .collection(DBCollections.groups)
          .doc(member.groupId);

      await groupRef.update({
        'memberIds': FieldValue.arrayUnion([userDoc.id]),
        'updatedAt': now,
      });

      return const Result.success('Anggota berhasil ditambahkan');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return const Result.failed('Terjadi kesalahan saat menambahkan anggota');
    }
  }

  Future<Result<num>> getTotalGroupPaidAmount({required String groupId}) async {
    try {
      // Get current user
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Fetch the group document to get total dues
      final groupDoc = await _firestore
          .collection(DBCollections.groups)
          .doc(groupId)
          .get();

      if (!groupDoc.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      final groupData = groupDoc.data()!;
      final num totalDues = (groupData['dues'] ?? 0) as num;

      // Fetch members who have paid
      final membersQuery = await _firestore
          .collection(DBCollections.members)
          .where('groupId', isEqualTo: groupId)
          .where('paymentStatus', isEqualTo: PaymentStatusEnum.paid)
          .get();

      final int totalPaidMembers = membersQuery.docs.length;

      // Calculate total paid amount
      final num totalPaidAmount = totalDues * totalPaidMembers;

      return Result.success(totalPaidAmount);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return const Result.failed(
        'Terjadi kesalahan saat menghitung total pembayaran',
      );
    }
  }

  Future<Result<int>> getTotalPaidMembers({required String groupId}) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Query members with status_payment = 'paid'
      final snapshot = await _firestore
          .collection(DBCollections.members)
          .where('groupId', isEqualTo: groupId)
          .where('paymentStatus', isEqualTo: PaymentStatusEnum.paid.name)
          .get();

      final int totalPaidMembers = snapshot.docs.length;

      return Result.success(totalPaidMembers);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return const Result.failed(
        'Terjadi kesalahan saat mengambil total anggota yang sudah membayar',
      );
    }
  }

  Future<Result<String>> updateMember(MemberEntity member) async {
    try {
      final memberRef = _firestore
          .collection(DBCollections.members)
          .doc(member.id);

      // Check if member exists
      final memberSnap = await memberRef.get();
      if (!memberSnap.exists) {
        return const Result.failed('Peserta tidak ditemukan');
      }

      // Fetch latest user data from Firestore
      final userEmail = member.email;
      if (userEmail == null || userEmail.isEmpty) {
        return const Result.failed('Email pengguna diperlukan');
      }

      final userQuery = await _firestore
          .collection(DBCollections.users)
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
        'user': userObject,
        'paymentStatus': member.paymentStatus?.name,
        'isActive': member.isActive,
        'hasReward': member.hasReward ?? false,
        'updatedAt': now,
        'searchIndex': searchIndex,
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
      final memberRef = _firestore
          .collection(DBCollections.members)
          .doc(memberId);

      // Check if member document exists
      final memberSnap = await memberRef.get();
      if (!memberSnap.exists) {
        return const Result.failed('Peserta tidak ditemukan');
      }

      final memberData = memberSnap.data();
      final groupId = memberData?['groupId'];

      if (groupId == null || groupId.isEmpty) {
        return const Result.failed('ID grup tidak ditemukan pada member');
      }

      // Reference to group document
      final groupRef = _firestore.collection(DBCollections.groups).doc(groupId);

      // Delete the member document
      await memberRef.delete();

      // Remove the member ID from group’s memberIds list
      await groupRef.update({
        'memberIds': FieldValue.arrayRemove([memberData?['user']['id']]),
      });

      return const Result.success(
        'Member berhasil dihapus dan data grup diperbarui',
      );
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
      final memberRef = _firestore
          .collection(DBCollections.members)
          .doc(memberId);

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
        groupId: data['groupId'],
        paymentStatus: data['paymentStatus']?.toString().toPaymentStatusEnum(),
        isActive: data['isActive'],
        hasReward: data['hasReward'],
        paidAt: (data['paidAt'] as Timestamp?)?.toDate(),
        createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
        updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
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
        'Terjadi kesalahan saat mengambil detail anggota/peserta',
      );
    }
  }
}
