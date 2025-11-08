import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../shared/widgets/title_widget.dart';
import '../providers/term_condition_providers.dart';

class TermConditionPage extends ConsumerStatefulWidget {
  static const String path = '/term-and-condition';
  const TermConditionPage({super.key});

  @override
  ConsumerState<TermConditionPage> createState() => _TermConditionPageState();
}

class _TermConditionPageState extends ConsumerState<TermConditionPage> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(getTermConditionProvider);

    final paddingPage = context.spacing.xl;
    return provider.when(
      error: (_, __) => const SizedBox(),
      loading: () => const SizedBox(),
      data: (result) {
        final term = result.resultValue ?? {};
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
                        title: "Syarat\ndan Ketentuan",
                        subtitle:
                            "Terakhir diperbarui ${term['updatedAt']?.toString().toDateTime().toIdDate}",
                      ),
                      SizedBox(height: context.appSize.s40),
                      Text(term['value'], style: context.textStyles.subtitle),
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
    );
  }
}
