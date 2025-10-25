import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentations/provider/auth_state_provider.dart';
import 'go_router_refresh_stream.dart';
import 'middleware.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/splash',
    // refreshListenable: GoRouterRefreshStream(
    //   ref.watch(authStateProvider.stream),
    // ),
    routes: [
      // GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
    ],
    redirect: (_, state) => middleware(authState: authState, state: state),
  );
}
