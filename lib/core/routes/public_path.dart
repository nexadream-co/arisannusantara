import '../../features/auth/presentations/pages/forgot_password_page.dart';
import '../../features/auth/presentations/pages/login_page.dart';
import '../../features/auth/presentations/pages/register_page.dart';
import '../../features/term_conditions/presentations/pages/term_condition_page.dart';

/// A set of route paths that can be accessed without user authentication.
///
/// These pages are publicly accessible and do not require the user
/// to be logged in. Typically includes entry points such as login,
/// registration, password recovery, and informational pages.
///
/// The `isPublicPage` helper function checks whether a given route path
/// belongs to this public list. It is often used inside routing middleware
/// or redirect logic to prevent unnecessary redirects for unauthenticated users.
///
/// Example usage:
/// ```dart
/// if (user == null && !isPublicPage(state.matchedLocation)) {
///   return LoginPage.path;
/// }
/// ```
const publicPaths = {
  LoginPage.path,
  RegisterPage.path,
  ForgotPasswordPage.path,
  TermConditionPage.path,
};

bool isPublicPage(String path) => publicPaths.contains(path);
