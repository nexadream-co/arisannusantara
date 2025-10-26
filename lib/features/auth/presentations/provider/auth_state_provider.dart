import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<UserEntity?> authState(Ref ref) {
  return FirebaseAuth.instance.authStateChanges().asyncMap((
    firebaseUser,
  ) async {
    if (firebaseUser == null) return null;

    // Reload user to ensure emailVerified is up-to-date
    await firebaseUser.reload();
    final updatedUser = FirebaseAuth.instance.currentUser;
    if (updatedUser == null) return null;

    return UserEntity(
      id: updatedUser.uid,
      name: updatedUser.displayName ?? '',
      email: updatedUser.email ?? '',
      photoUrl: updatedUser.photoURL,
      emailVerified: updatedUser.emailVerified,
      role: 'user',
    );
  });
}
