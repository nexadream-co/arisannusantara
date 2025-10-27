import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../config/constants/app_user_role.dart';
import '../../../../config/database/db_collection.dart';
import '../../domain/entities/user_entity.dart';

part 'auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<UserEntity?> authState(Ref ref) {
  final firestore = FirebaseFirestore.instance;

  return FirebaseAuth.instance.authStateChanges().asyncMap((
    firebaseUser,
  ) async {
    if (firebaseUser == null) return null;

    // Reload to make sure latest verification and display name
    await firebaseUser.reload();
    final updatedUser = FirebaseAuth.instance.currentUser;
    if (updatedUser == null) return null;

    // Fetch Firestore user document
    final userDoc = await firestore
        .collection(DBCollections.users)
        .doc(updatedUser.uid)
        .get();

    if (userDoc.exists && userDoc.data() != null) {
      final data = userDoc.data()!;
      return UserEntity(
        id: updatedUser.uid,
        name: data['name'] ?? updatedUser.displayName ?? '',
        email: data['email'] ?? updatedUser.email ?? '',
        photoUrl: data['photo_url'] ?? updatedUser.photoURL,
        emailVerified: updatedUser.emailVerified,
        role: data['role'] ?? AppUserRole.user,
      );
    } else {
      // Fallback to Firebase Auth data if Firestore record missing
      return UserEntity(
        id: updatedUser.uid,
        name: updatedUser.displayName ?? '',
        email: updatedUser.email ?? '',
        photoUrl: updatedUser.photoURL,
        emailVerified: updatedUser.emailVerified,
        role: AppUserRole.user, // default role if not in Firestore
      );
    }
  });
}
