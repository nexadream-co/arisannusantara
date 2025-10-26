import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';
import 'core/routes/router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Arisan Nusantara',
      theme: AppTheme.light,
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
