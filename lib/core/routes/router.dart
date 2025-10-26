import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentations/provider/auth_state_provider.dart';
import '../layouts/splash.dart';
import 'go_router_refresh_listenable.dart';
import 'middleware.dart';
import 'page_routes.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: Splash.path,
    refreshListenable: GoRouterRefreshListenable(ref),
    routes: pageRoutes,
    redirect: (_, state) => middleware(authState: authState, state: state),
  );
}
