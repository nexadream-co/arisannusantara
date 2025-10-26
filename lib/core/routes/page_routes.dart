import 'package:go_router/go_router.dart';

import '../../core/layouts/splash.dart';
import '../../core/layouts/superadmin_layout.dart';
import '../../core/layouts/user_layout.dart';
import '../../features/auth/presentations/pages/forgot_password_page.dart';
import '../../features/auth/presentations/pages/login_page.dart';
import '../../features/auth/presentations/pages/register_page.dart';
import '../../features/auth/presentations/pages/verify_email_page.dart';
import '../../features/faq/presentations/pages/faq_page.dart';
import '../../features/groups/presentations/pages/group_choose_winner_page.dart';
import '../../features/groups/presentations/pages/group_create_page.dart';
import '../../features/groups/presentations/pages/group_history_detail_page.dart';
import '../../features/groups/presentations/pages/group_manager_create_page.dart';
import '../../features/groups/presentations/pages/group_page.dart';
import '../../features/groups/presentations/pages/group_shuffle_winner_page.dart';
import '../../features/groups/presentations/pages/search_group_page.dart';
import '../../features/home/presentations/pages/home_page.dart';
import '../../features/privacy_policy/presentations/pages/privacy_policy_page.dart';
import '../../features/profile/presentations/pages/change_password_page.dart';
import '../../features/profile/presentations/pages/profile_edit_page.dart';
import '../../features/term_conditions/presentations/pages/term_condition_page.dart';

final pageRoutes = [
  GoRoute(path: Splash.path, builder: (context, state) => Splash()),
  GoRoute(path: UserLayout.path, builder: (context, state) => UserLayout()),
  GoRoute(
    path: SuperadminLayout.path,
    builder: (context, state) => SuperadminLayout(),
  ),
  GoRoute(path: HomePage.path, builder: (context, state) => HomePage()),
  GoRoute(
    path: VerifyEmailPage.path,
    builder: (context, state) => VerifyEmailPage(),
  ),
  GoRoute(path: LoginPage.path, builder: (context, state) => LoginPage()),
  GoRoute(path: RegisterPage.path, builder: (context, state) => RegisterPage()),
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
  GoRoute(
    path: ProfileEditPage.path,
    builder: (context, state) => ProfileEditPage(),
  ),
  GoRoute(
    path: ChangePasswordPage.path,
    builder: (context, state) => ChangePasswordPage(),
  ),
  GoRoute(path: GroupPage.path, builder: (context, state) => GroupPage()),
  GoRoute(
    path: SearchGroupPage.path,
    builder: (context, state) => SearchGroupPage(),
  ),
  GoRoute(
    path: GroupHistoryDetailPage.path,
    builder: (context, state) => GroupHistoryDetailPage(),
  ),
  GoRoute(
    path: GroupManagerCreatePage.path,
    builder: (context, state) => GroupManagerCreatePage(),
  ),
  GoRoute(
    path: GroupCreatePage.path,
    builder: (context, state) => GroupCreatePage(),
  ),
  GoRoute(
    path: GroupShuffleWinnerPage.path,
    builder: (context, state) => GroupShuffleWinnerPage(),
  ),
  GoRoute(
    path: GroupChooseWinnerPage.path,
    builder: (context, state) => GroupChooseWinnerPage(),
  ),
];
