import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<UserEntity?> authState(Ref ref) {
  return FirebaseAuth.instance.authStateChanges().map((firebaseUser) {
    if (firebaseUser == null) return null;

    return UserEntity(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      emailVerified: firebaseUser.emailVerified,
      role: 'admin',
    );
  });
}
