import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/title_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(context.assets.textureBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.spacing.md),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: context.screen.height,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset(context.assets.logoFull, height: 80),
                      ),
                      TitleWidget(
                        title: "Login",
                        subtitle: "Mulai kelola arisanmu!",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
