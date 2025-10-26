import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/constants/app_user_role.dart';
import '../../features/auth/domain/entities/user_entity.dart';
import '../../features/auth/presentations/pages/login_page.dart';
import '../../features/auth/presentations/pages/verify_email_page.dart';
import '../layouts/splash.dart';
import '../layouts/superadmin_layout.dart';
import '../layouts/user_layout.dart';
import 'public_path.dart';

/// Handles all route redirection (middleware) logic based on authentication and user role.
///
/// [authState] - The AsyncValue (or similar) containing the current user data.
/// [state] - The GoRouterState of the current navigation.
String? middleware({
  required AsyncValue<UserEntity?> authState,
  required GoRouterState state,
}) {
  final user = authState.value;
  final inLoginPage = state.matchedLocation == LoginPage.path;
  final inEmailVerifyPage = state.matchedLocation == VerifyEmailPage.path;

  // While loading user state
  if (authState.isLoading) return Splash.path;

  // Not authenticated
  if (user == null) {
    return isPublicPage(state.matchedLocation) ? null : LoginPage.path;
  }

  // Email not verified
  if (!user.emailVerified) {
    // If already on login page, don't redirect again
    return inEmailVerifyPage ? null : VerifyEmailPage.path;
  }

  // Authenticated: handle redirect after login
  if (inLoginPage) {
    return user.role == AppUserRole.superadmin
        ? SuperadminLayout.path
        : UserLayout.path;
  }

  // Prevent cross-role access
  if (user.role == AppUserRole.user &&
      (state.matchedLocation == Splash.path ||
          state.matchedLocation == SuperadminLayout.path ||
          state.matchedLocation == LoginPage.path)) {
    return UserLayout.path;
  }

  if (user.role == AppUserRole.superadmin &&
      (state.matchedLocation == Splash.path ||
          state.matchedLocation == UserLayout.path ||
          state.matchedLocation == LoginPage.path)) {
    return SuperadminLayout.path;
  }

  return null;
}
