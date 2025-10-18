import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/title_widget.dart';

class PrivacyPolicyPage extends StatefulWidget {
  static const String path = '/privacy-policy';
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    final paddingPage = context.spacing.xl;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(context.assets.textureBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(paddingPage),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(
                    title: "Kebijakan\nPrivasi",
                    subtitle: "Terakhir diperbarui 19 Oktober 2025",
                  ),
                  SizedBox(height: context.appSize.s40),
                  Text(
                    'Lorem ipsum dolor sit amet',
                    style: context.textStyles.subtitle,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: context.spacing.xl,
                right: context.spacing.xl,
                bottom: context.spacing.xl,
              ),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text('Kembali'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
