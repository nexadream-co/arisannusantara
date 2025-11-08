import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../shared/widgets/title_widget.dart';
import '../providers/faq_providers.dart';

class FaqPage extends ConsumerStatefulWidget {
  static const String path = '/faq';
  const FaqPage({super.key});

  @override
  ConsumerState<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends ConsumerState<FaqPage> {
  final _debouncer = Debouncer(milliseconds: 400);
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide.none,
    );

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
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(paddingPage),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(
                    title: "FAQ",
                    subtitle: "Pertanyaan yang sering\nditanyakan",
                  ),
                  SizedBox(height: context.appSize.s40),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: context.spacing.lg),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            context.radius.medium,
                          ),
                          boxShadow: [context.shadow.small],
                        ),
                        child: TextFormField(
                          controller: _searchController,
                          onChanged: (value) {
                            _debouncer.run(() {
                              ref.invalidate(getFaqProvider(value));
                              setState(() {});
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Cari pertanyaan...",
                            hintStyle: context.textStyles.subtitle,
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: border,
                            focusedBorder: border,
                            border: border,
                            suffixIcon: Icon(
                              Icons.search,
                              color: context.colors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          final provider = ref.watch(
                            getFaqProvider(_searchController.text),
                          );
                          return provider.when(
                            error: (_, __) => const SizedBox(),
                            loading: () => const SizedBox(),
                            data: (result) {
                              final faqs = result.resultValue ?? [];
                              return Column(
                                children: [
                                  if (faqs.isEmpty)
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: context.spacing.md,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: context.spacing.sm,
                                        horizontal: context.spacing.md,
                                      ),
                                      decoration: BoxDecoration(
                                        color: context.colors.accent,
                                        borderRadius: BorderRadius.circular(
                                          context.radius.medium,
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.info_outline),
                                          SizedBox(width: context.spacing.sm),
                                          Expanded(
                                            child: Text(
                                              'Pertanyaan tidak ditemukan',
                                              style: context.textStyles.body,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  for (final faq in faqs)
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: context.spacing.md,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          context.radius.medium,
                                        ),
                                        boxShadow: [context.shadow.small],
                                      ),
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.symmetric(
                                          horizontal: context.spacing.md,
                                        ),
                                        title: Text(
                                          faq.title ?? '',
                                          style: context.textStyles.body
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        childrenPadding: EdgeInsets.all(
                                          context.spacing.md,
                                        ),
                                        backgroundColor: Colors.white,
                                        collapsedBackgroundColor: Colors.white,
                                        collapsedShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            context.radius.medium,
                                          ),
                                        ),

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            context.radius.medium,
                                          ),
                                        ),

                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                    bottom: Radius.circular(
                                                      context.radius.medium,
                                                    ),
                                                  ),
                                            ),
                                            child: Text(
                                              faq.description ?? '',
                                              textAlign: TextAlign.start,
                                              style: context.textStyles.body
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        context.colors.primary,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
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
