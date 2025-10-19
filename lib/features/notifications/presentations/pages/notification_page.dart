import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';

class NotificationPage extends StatefulWidget {
  static const String path = '/notifications';
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide.none,
    );

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(context.assets.textureBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                bottom: false,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: context.spacing.lg),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Notifikasi',
                              maxLines: 1,
                              style: context.textStyles.header,
                            ),
                            Text(
                              'Semua notifikasi anda',
                              maxLines: 1,
                              style: context.textStyles.body,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: context.spacing.lg),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.md,
                        vertical: context.spacing.sm,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.secondary,
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                      ),
                      child: Text(
                        'Tandai Dibaca',
                        style: context.textStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(context.spacing.lg),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.radius.medium),
                  boxShadow: [context.shadow.small],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Cari notifikasi...",
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

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  left: context.spacing.lg,
                  right: context.spacing.lg,
                  bottom: context.spacing.lg,
                ),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(context.spacing.md),
                    margin: EdgeInsets.only(bottom: context.spacing.md),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [context.shadow.medium],
                      borderRadius: BorderRadius.circular(
                        context.radius.medium,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: context.colors.secondary,
                            ),
                            SizedBox(width: context.spacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Lorem ipsum dolor sit amet',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context.colors.primary,
                                    ),
                                  ),
                                  SizedBox(height: context.spacing.xs),
                                  Text(
                                    'Dolor lorem ipsum sit',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.body,
                                  ),
                                  SizedBox(height: context.spacing.md),
                                  Text(
                                    '20 Oktober 2025',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.body,
                                  ),
                                ],
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.spacing.lg,
                                ),
                                child: Text(
                                  'Detail',
                                  style: context.textStyles.bodySmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
