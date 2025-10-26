import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';

class Splash extends StatelessWidget {
  static const String path = '/splash';
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: context.colors.accent);
  }
}
