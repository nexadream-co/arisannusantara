import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../shared/widgets/title_widget.dart';
import '../providers/privacy_policy_providers.dart';

class PrivacyPolicyPage extends ConsumerStatefulWidget {
  static const String path = '/privacy-policy';
  const PrivacyPolicyPage({super.key});

  @override
  ConsumerState<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends ConsumerState<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(getPrivacyPolicyProvider);

    final paddingPage = context.spacing.xl;
    return provider.when(
      data: (result) {
        final privacy = result.resultValue ?? {};
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
                        subtitle:
                            "Terakhir diperbarui ${privacy['updatedAt']?.toString().toDateTime().toIdDate}",
                      ),
                      SizedBox(height: context.appSize.s40),
                      Text(
                        privacy['value'],
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
      },
      error: (_, __) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
