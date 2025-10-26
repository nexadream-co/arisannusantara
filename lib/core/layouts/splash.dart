import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';
import '../utils/loading_overlay.dart';

class Splash extends StatelessWidget {
  static const String path = '/splash';
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.accent,
      body: Center(child: LoadingIconAnimation(width: 80, height: 80)),
    );
  }
}
