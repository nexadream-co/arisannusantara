import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/title_widget.dart';

class FaqPage extends StatefulWidget {
  static const String path = '/faq';
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
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
                        margin: EdgeInsets.only(bottom: context.spacing.sm),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            context.radius.medium,
                          ),
                          boxShadow: [context.shadow.small],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Cari pertanyaan...",
                            hintStyle: context.textStyles.subtitle,
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: border,
                            focusedBorder: border,
                            border: border,
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      for (int i = 0; i < 5; i++)
                        Container(
                          margin: EdgeInsets.only(bottom: context.spacing.sm),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              context.radius.medium,
                            ),
                            boxShadow: [context.shadow.small],
                          ),
                          child: ExpansionTile(
                            title: Text(
                              'Apakah aplikasi ini gratis?',
                              style: context.textStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            childrenPadding: EdgeInsets.all(context.spacing.md),
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
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(
                                      context.radius.medium,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Lorem ipsum dolor",
                                  textAlign: TextAlign.start,
                                  style: context.textStyles.body.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.colors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
