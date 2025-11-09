import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../config/enums/invitation_status.dart';
import '../../../config/enums/payment_status_enum.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../../../core/extensions/string_extensions.dart';
import '../../auth/domain/entities/user_entity.dart';
import '../../groups/data/group_repository.dart';
import '../../groups/domain/entities/group_entity.dart';
import '../../groups/domain/entities/member_entity.dart';
import '../domain/entities/invitation_entity.dart';

class InvitationRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<String>> createInvitation(String groupId) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final groupRef = _firestore.collection(DBCollections.groups).doc(groupId);
      final invitationRef = _firestore.collection(DBCollections.invitations);

      // ✅ Check if there's already a pending invitation
      final existingInvitation = await invitationRef
          .where('groupId', isEqualTo: groupId)
          .where('userId', isEqualTo: user.uid)
          .where('status', isEqualTo: InvitationStatus.pending.name)
          .limit(1)
          .get();

      if (existingInvitation.docs.isNotEmpty) {
        return const Result.failed(
          'Permintaan undangan sudah diajukan dan masih menunggu persetujuan',
        );
      }

      // Get group data
      final groupSnapshot = await groupRef.get();
      if (!groupSnapshot.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      final groupData = groupSnapshot.data()!;
      final ownerIds = List<String>.from(groupData['ownerIds'] ?? []);

      // Get current user data
      final userSnapshot = await _firestore
          .collection(DBCollections.users)
          .doc(user.uid)
          .get();
      if (!userSnapshot.exists) {
        return const Result.failed('Data pengguna tidak ditemukan');
      }

      final userData = userSnapshot.data()!;

      // Build invitation entity
      final invitation = InvitationEntity(
        groupId: groupId,
        userId: user.uid,
        status: InvitationStatus.pending.name,
        groupOwnerIds: ownerIds,
        group: GroupEntity.fromJson(groupData),
        user: UserEntity.fromJson(userData),
        createdAt: DateTime.now(),
      );

      // Convert to Firestore data
      final invitationJson = {
        'groupId': invitation.groupId,
        'userId': invitation.userId,
        'status': invitation.status,
        'groupOwnerIds': invitation.groupOwnerIds,
        'group': invitation.group?.toJson()?..remove('paymentAccounts'),
        'user': invitation.user?.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      };

      // Add document and update its ID
      final docRef = await invitationRef.add(invitationJson);
      await docRef.update({'id': docRef.id});

      return const Result.success('Permintaan undangan berhasil dibuat');
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> createInvitationByGroupCode(String code) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final invitationRef = _firestore.collection(DBCollections.invitations);
      final groupQuery = await _firestore
          .collection(DBCollections.groups)
          .where('code', isEqualTo: code)
          .limit(1)
          .get();

      if (groupQuery.docs.isEmpty) {
        return const Result.failed('Grup tidak ditemukan');
      }

      final groupDoc = groupQuery.docs.first;
      final groupData = groupDoc.data();
      final groupId = groupDoc.id;
      final ownerIds = List<String>.from(groupData['ownerIds'] ?? []);

      // ✅ Check if there's already a pending invitation for this group
      final existingInvitation = await invitationRef
          .where('groupId', isEqualTo: groupId)
          .where('userId', isEqualTo: user.uid)
          .where('status', isEqualTo: InvitationStatus.pending.name)
          .limit(1)
          .get();

      if (existingInvitation.docs.isNotEmpty) {
        return const Result.failed(
          'Permintaan undangan sudah diajukan dan masih menunggu persetujuan',
        );
      }

      // Get current user data
      final userSnapshot = await _firestore
          .collection(DBCollections.users)
          .doc(user.uid)
          .get();
      if (!userSnapshot.exists) {
        return const Result.failed('Data pengguna tidak ditemukan');
      }

      final userData = userSnapshot.data()!;

      // Build invitation entity
      final invitation = InvitationEntity(
        groupId: groupId,
        userId: user.uid,
        status: InvitationStatus.pending.name,
        groupOwnerIds: ownerIds,
        group: GroupEntity.fromJson(groupData),
        user: UserEntity.fromJson(userData),
        createdAt: DateTime.now(),
      );

      // Convert to Firestore data
      final invitationJson = {
        'groupId': invitation.groupId,
        'userId': invitation.userId,
        'status': invitation.status,
        'groupOwnerIds': invitation.groupOwnerIds,
        'group': invitation.group?.toJson()?..remove('paymentAccounts'),
        'user': invitation.user?.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      };

      // Add document and update its ID
      final docRef = await invitationRef.add(invitationJson);
      await docRef.update({'id': docRef.id});

      return const Result.success('Permintaan undangan berhasil dibuat');
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> updateInvitationStatus({
    required String invitationId,
    required String newStatus,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final invitationRef = _firestore
          .collection(DBCollections.invitations)
          .doc(invitationId);
      final invitationSnapshot = await invitationRef.get();

      if (!invitationSnapshot.exists) {
        return const Result.failed('Data undangan tidak ditemukan');
      }

      final invitationData = invitationSnapshot.data()!;
      final currentStatus = (invitationData['status'] as String? ?? '')
          .toInvitationStatus();

      // Avoid reprocessing already approved invitations
      if (currentStatus == InvitationStatus.approved) {
        return const Result.failed('Undangan sudah disetujui sebelumnya');
      }

      // If approved, create new member in the group
      if (newStatus == InvitationStatus.approved.name) {
        final groupId = invitationData['groupId'] as String?;
        final userMap = invitationData['user'] as Map<String, dynamic>?;

        if (groupId == null || userMap == null) {
          return const Result.failed('Data grup atau pengguna tidak valid');
        }

        final userEmail = userMap['email']?.toString();
        if (userEmail == null || userEmail.isEmpty) {
          return const Result.failed('Email pengguna tidak ditemukan');
        }

        final memberEntity = MemberEntity(
          groupId: groupId,
          isActive: true,
          hasReward: false,
          paymentStatus: PaymentStatusEnum.unpaid,
        );

        final result = await GroupRepository().createMember(
          member: memberEntity,
          userEmail: userEmail,
        );

        if (!result.isSuccess) {
          return Result.failed(result.errorMessage);
        }
      }

      // Update invitation status
      await invitationRef.update({
        'status': newStatus,
        'updatedAt': DateTime.now().toString(),
      });

      return const Result.success('Status undangan berhasil diperbarui');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<List<InvitationEntity>>> getInvitations({
    required String status,
    int limit = 10,
    String? lastId,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      Query<Map<String, dynamic>> query = _firestore.collection(
        DBCollections.invitations,
      );

      // Filter by status
      query = query.where('status', isEqualTo: status);

      query = query.where(
        Filter.or(
          Filter('userId', isEqualTo: currentUser.uid),
          Filter('groupOwnerIds', arrayContains: currentUser.uid),
        ),
      );

      // Order by createdAt for pagination
      query = query.orderBy('createdAt', descending: true).limit(limit);

      // If there's a last document id, start after it
      if (lastId != null && lastId.isNotEmpty) {
        final lastDoc = await _firestore
            .collection(DBCollections.invitations)
            .doc(lastId)
            .get();
        if (lastDoc.exists) {
          query = query.startAfterDocument(lastDoc);
        }
      }

      final snapshot = await query.get();

      if (snapshot.docs.isEmpty) {
        return const Result.success([]);
      }

      // Map to entity list
      final invitations = snapshot.docs.map((doc) {
        final data = doc.data();
        return InvitationEntity.fromJson({...data, 'id': doc.id});
      }).toList();

      return Result.success(invitations);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
