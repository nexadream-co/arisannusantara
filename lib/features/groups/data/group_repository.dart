import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../config/enums/group_filter.dart';
import '../../../core/app/result.dart';
import '../../../core/errors/exception.dart';
import '../../../core/errors/firebase_exception.dart';
import '../../../core/utils/generate_search_index.dart';
import '../../../core/utils/helpers.dart';
import '../../auth/domain/entities/user_entity.dart';
import '../domain/entities/group_entity.dart';
import '../domain/entities/payment_account_entity.dart';
import 'history_repository.dart';
import 'member_repository.dart';
import 'payment_account_repository.dart';

class GroupRepository
    with
        GroupDetailRepository,
        HistoryRepository,
        MemberRepository,
        PaymentAccountRepository {
  GroupRepository();
}

mixin GroupDetailRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<List<GroupEntity>>> getGroups({
    String? search,
    GroupFilter filter = GroupFilter.all,
    String? lastId,
    int limit = 10,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      Query<Map<String, dynamic>> query = _firestore.collection(
        DBCollections.groups,
      );

      // Apply membership filter based on enum
      switch (filter) {
        case GroupFilter.joined:
          // query = query.where('member_ids', arrayContains: user.uid);
          query = query.where(
            Filter.or(
              Filter('memberIds', arrayContains: user.uid),
              Filter('ownerIds', arrayContains: user.uid),
            ),
          );
          break;
        case GroupFilter.owned:
          query = query.where('ownerIds', arrayContains: user.uid);
          break;
        case GroupFilter.invited:
          query = query.where('invitedUserIds', arrayContains: user.uid);
          break;
        case GroupFilter.all:
          // no filter applied
          break;
      }

      // Apply search filter
      if (search != null && search.isNotEmpty) {
        final lower = search.toLowerCase();
        query = query.where('searchIndex', arrayContains: lower);
      }

      // Order & pagination
      query = query.orderBy('createdAt', descending: true).limit(limit);

      // Apply pagination with lastId
      if (lastId != null && lastId.isNotEmpty) {
        final lastDoc = await _firestore
            .collection(DBCollections.groups)
            .doc(lastId)
            .get();

        if (lastDoc.exists) {
          query = query.startAfterDocument(lastDoc);
        }
      }

      final snapshot = await query.get();

      final groups = snapshot.docs.map((doc) {
        final data = doc.data();

        final ownerIds =
            (data['ownerIds'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [];

        final memberIds =
            (data['memberIds'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [];

        final isOwned = ownerIds.contains(user.uid);
        final isJoined = memberIds.contains(user.uid);

        return GroupEntity(
          id: doc.id,
          name: data['name'] as String?,
          description: data['description'] as String?,
          code: data['code'] as String?,
          periodsDate: parseFirestoreDate(data['periodsDate']),
          dues: (data['dues'] as num?)?.toDouble(),
          target: (data['target'] as num?)?.toDouble(),
          isOwned: isOwned,
          isJoined: isJoined,
        );
      }).toList();

      return Result.success(groups);
    } on FirebaseException catch (e, s) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      handleException(e, stackTrace: s);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

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

      final now = FieldValue.serverTimestamp();

      final groupData = {
        'id': groupId,
        'name': group.name,
        'searchIndex': generateSearchIndex([group.name, code]),
        'description': group.description,
        'code': code,
        'periodsDate': group.periodsDate?.toString(),
        'periodsType': group.periodsType,
        'reward': group.reward,
        'dues': group.dues,
        'maxWinner': group.maxWinner,
        'target': group.target,
        'createdBy': user.uid,
        'ownerIds': [user.uid], // current user as owner
        'paymentAccounts': group.paymentAccounts?.map((e) {
          final accountId = _firestore.collection('tmp').doc().id;
          return {
            'id': accountId,
            'accountName': e.accountName,
            'bankName': e.bankName,
            'bankNumber': e.bankNumber,
          };
        }).toList(),
        'adminFee': group.adminFee,
        'createdAt': now,
        'updatedAt': now,
      };

      await _firestore
          .collection(DBCollections.groups)
          .doc(groupId)
          .set(groupData);

      return Result.success("Berhasil membuat grup baru");
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> updateGroup(GroupEntity group) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      if (group.id == null || group.id!.isEmpty) {
        return const Result.failed('ID grup tidak valid');
      }

      final docRef = _firestore.collection(DBCollections.groups).doc(group.id);

      final now = FieldValue.serverTimestamp();

      final updateData = {
        'name': group.name,
        'searchIndex': generateSearchIndex([group.name, group.code]),
        'description': group.description,
        'dues': group.dues,
        'target': group.target,
        'periodsDate': group.periodsDate?.toString(),
        'periodsType': group.periodsType,
        'reward': group.reward,
        'maxWinner': group.maxWinner,
        'adminFee': group.adminFee,
        'updatedAt': now,
      };

      await docRef.update(updateData);

      return const Result.success('Grup berhasil diperbarui');
    } on FirebaseException catch (e) {
      return Result.failed(getFirebaseFirestoreExceptionMessage(e));
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> deleteGroup(String groupId) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final groupRef = _firestore.collection(DBCollections.groups).doc(groupId);

      // Check if group exists
      final groupSnap = await groupRef.get();
      if (!groupSnap.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      // Start a batch operation
      final batch = _firestore.batch();

      // Delete all members with this group_id
      final membersQuery = await _firestore
          .collection(DBCollections.members)
          .where('groupId', isEqualTo: groupId)
          .get();

      for (final doc in membersQuery.docs) {
        batch.delete(doc.reference);
      }

      // Delete all histories with this group_id
      final historiesQuery = await _firestore
          .collection(DBCollections.histories)
          .where('groupId', isEqualTo: groupId)
          .get();

      for (final doc in historiesQuery.docs) {
        batch.delete(doc.reference);
      }

      // Delete the group document itself
      batch.delete(groupRef);

      await batch.commit();

      return const Result.success("Grup berhasil dihapus");
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<List<UserEntity>>> getGroupOwners(String groupId) async {
    try {
      // Get group document
      final groupDoc = await _firestore
          .collection(DBCollections.groups)
          .doc(groupId)
          .get();

      if (!groupDoc.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      final data = groupDoc.data();
      final ownerIds =
          (data?['ownerIds'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [];

      if (ownerIds.isEmpty) {
        return const Result.success([]); // no owners
      }

      // Firestore only allows `whereIn` with up to 10 elements
      final chunks = <List<String>>[];
      for (var i = 0; i < ownerIds.length; i += 10) {
        chunks.add(
          ownerIds.sublist(
            i,
            i + 10 > ownerIds.length ? ownerIds.length : i + 10,
          ),
        );
      }

      final List<UserEntity> owners = [];

      for (final chunk in chunks) {
        final usersSnapshot = await _firestore
            .collection(DBCollections.users)
            .where(FieldPath.documentId, whereIn: chunk)
            .get();

        final chunkOwners = usersSnapshot.docs.map((doc) {
          final userData = doc.data();
          return UserEntity(
            id: doc.id,
            name: userData['name'] as String?,
            email: userData['email'] as String? ?? '',
            photoUrl: userData['photoUrl'] as String?,
            role: userData['role'] as String?,
          );
        }).toList();

        owners.addAll(chunkOwners);
      }

      return Result.success(owners);
    } on FirebaseException catch (e, s) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      handleException(e, stackTrace: s);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<GroupEntity>> getGroupDetail(String groupId) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final groupRef = _firestore.collection(DBCollections.groups).doc(groupId);
      final groupSnap = await groupRef.get();

      if (!groupSnap.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      final data = groupSnap.data()!;
      final group = GroupEntity(
        id: groupSnap.id,
        name: data['name'] as String?,
        description: data['description'] as String?,
        code: data['code'] as String?,
        reward: data['reward'] as String?,
        periodsType: data['periodsType'] as String?,
        periodsDate: parseFirestoreDate(data['periodsDate']),
        owners: data['ownerIds']?.cast<String>() ?? [],
        dues: (data['dues'] as num?)?.toDouble(),
        maxWinner: data['maxWinner'] as int?,
        adminFee: (data['adminFee'] as num?)?.toDouble(),
        target: (data['target'] as num?)?.toDouble(),
        paymentAccounts: (data['paymentAccounts'] as List<dynamic>?)
            ?.map(
              (item) => PaymentAccountEntity(
                id: item['id'] as String?,
                accountName: item['accountName'] as String?,
                bankName: item['bankName'] as String?,
                bankNumber: item['bankNumber'] as String?,
                createdAt: parseFirestoreDate(item['createdAt']),
                updatedAt: parseFirestoreDate(item['updatedAt']),
              ),
            )
            .toList(),
        createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      );

      return Result.success(group);
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> addGroupOwners(
    String groupId,
    List<String> userIds,
  ) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final groupRef = _firestore.collection(DBCollections.groups).doc(groupId);
      final groupSnap = await groupRef.get();

      if (!groupSnap.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      final data = groupSnap.data()!;
      final existingOwnerIds =
          (data['ownerIds'] as List<dynamic>?)?.cast<String>() ?? [];

      // Combine and remove duplicates
      final updatedOwnerIds = {...existingOwnerIds, ...userIds}.toList();

      await groupRef.update({'ownerIds': updatedOwnerIds});

      return const Result.success('Pemilik grup berhasil diperbarui');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }

  Future<Result<String>> removeGroupOwner(String groupId, String userId) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      final groupRef = _firestore.collection(DBCollections.groups).doc(groupId);
      final groupSnap = await groupRef.get();

      if (!groupSnap.exists) {
        return const Result.failed('Grup tidak ditemukan');
      }

      final data = groupSnap.data()!;
      final existingOwnerIds =
          (data['ownerIds'] as List<dynamic>?)?.cast<String>() ?? [];

      if (!existingOwnerIds.contains(userId)) {
        return const Result.failed('Pemilik tidak ditemukan dalam grup');
      }

      // Remove the specific owner
      existingOwnerIds.remove(userId);

      await groupRef.update({'ownerIds': existingOwnerIds});

      return const Result.success('Pemilik berhasil dihapus dari grup');
    } on FirebaseException catch (e) {
      final message = getFirebaseFirestoreExceptionMessage(e);
      return Result.failed(message);
    } catch (e, s) {
      handleException(e, stackTrace: s);
      return Result.systemError();
    }
  }
}
