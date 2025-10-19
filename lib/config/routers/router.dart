import 'package:go_router/go_router.dart';

import '../../core/layouts/user_layout.dart';
import '../../features/auth/presentations/pages/forgot_password_page.dart';
import '../../features/auth/presentations/pages/login_page.dart';
import '../../features/auth/presentations/pages/register_page.dart';
import '../../features/faq/presentations/pages/faq_page.dart';
import '../../features/home/presentations/pages/home_page.dart';
import '../../features/privacy_policy/presentations/pages/privacy_policy_page.dart';
import '../../features/term_conditions/presentations/pages/term_condition_page.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: LoginPage.path,
  routes: [
    GoRoute(path: UserLayout.path, builder: (context, state) => UserLayout()),
    GoRoute(path: HomePage.path, builder: (context, state) => HomePage()),
    GoRoute(path: LoginPage.path, builder: (context, state) => LoginPage()),
    GoRoute(
      path: RegisterPage.path,
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: ForgotPasswordPage.path,
      builder: (context, state) => ForgotPasswordPage(),
    ),
    GoRoute(
      path: TermConditionPage.path,
      builder: (context, state) => TermConditionPage(),
    ),
    GoRoute(
      path: PrivacyPolicyPage.path,
      builder: (context, state) => PrivacyPolicyPage(),
    ),
    GoRoute(path: FaqPage.path, builder: (context, state) => FaqPage()),
  ],
);
