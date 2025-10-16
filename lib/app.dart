import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';
import 'features/auth/presentations/pages/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: const LoginPage(),
    );
  }
}
