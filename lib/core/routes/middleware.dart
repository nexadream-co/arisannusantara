import 'package:go_router/go_router.dart';

/// Handles all route redirection (middleware) logic based on authentication and user role.
///
/// [authState] - The AsyncValue (or similar) containing the current user data.
/// [state] - The GoRouterState of the current navigation.
String? middleware({required dynamic authState, required GoRouterState state}) {
  final user = authState.valueOrNull;
  final isLoggingIn = state.matchedLocation == '/login';

  // While loading user state
  if (authState.isLoading) return '/splash';

  // Not authenticated
  if (user == null) {
    return isLoggingIn ? null : '/login';
  }

  // Authenticated: handle redirect after login
  if (isLoggingIn) {
    return user.role == 'superadmin' ? '/superadmin' : '/admin';
  }

  // Prevent cross-role access
  if (user.role == 'admin' && state.matchedLocation == '/superadmin') {
    return '/admin';
  }

  if (user.role == 'superadmin' && state.matchedLocation == '/admin') {
    return '/superadmin';
  }

  return null;
}
