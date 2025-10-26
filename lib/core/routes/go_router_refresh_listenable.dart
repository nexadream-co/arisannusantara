import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../features/auth/domain/entities/user_entity.dart';
import '../../features/auth/presentations/provider/auth_state_provider.dart';

/// A [ChangeNotifier] that bridges Riverpod's [authProvider] with GoRouter.
///
/// This class listens to changes in [authProvider] and notifies GoRouter
/// whenever the authentication state changes.
/// It is passed to refreshListenable so that GoRouter will reevaluate
/// its redirection logic when authentication updates occur.
///
/// Without this, GoRouter would not automatically react to provider changes.
class GoRouterRefreshListenable extends ChangeNotifier {
  GoRouterRefreshListenable(Ref ref) {
    ref.listen<AsyncValue<UserEntity?>>(
      authStateProvider,
      (_, __) => notifyListeners(),
    );
  }
}
