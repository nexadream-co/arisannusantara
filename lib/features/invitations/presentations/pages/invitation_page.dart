import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';

class InvitationPage extends StatefulWidget {
  static const String path = '/invitations';
  const InvitationPage({super.key});

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {
  @override
  Widget build(BuildContext context) {
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
                              'Undangan',
                              maxLines: 1,
                              style: context.textStyles.header,
                            ),
                            Text(
                              'Semua undangan peserta',
                              maxLines: 1,
                              style: context.textStyles.body,
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outlined,
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: context.spacing.lg),
                height: context.appSize.s32,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: context.spacing.lg),
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: context.spacing.sm),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.md,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.secondary,
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                      ),
                      child: Text(
                        'Menunggu',
                        style: context.textStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: context.spacing.sm),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.md,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: context.colors.secondary),
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                      ),
                      child: Text(
                        'Disetujui',
                        style: context.textStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.secondary,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: context.spacing.sm),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.md,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: context.colors.secondary),
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                      ),
                      child: Text(
                        'Ditolak',
                        style: context.textStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.secondary,
                        ),
                      ),
                    ),
                  ],
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
                    padding: EdgeInsets.only(bottom: context.spacing.md),
                    margin: EdgeInsets.only(bottom: context.spacing.md),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: context.colors.divider),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [context.shadow.small],
                              ),
                              child: CircleAvatar(
                                backgroundColor: context.colors.background,
                                child: Text(
                                  'AS',
                                  style: context.textStyles.body.copyWith(
                                    color: context.colors.primary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: context.spacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ardi Sanjaya',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context.colors.primary,
                                    ),
                                  ),
                                  SizedBox(height: context.spacing.xs),
                                  Text(
                                    'ardisanjaya@gmail.com',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text('Tolak'),
                            ),
                            SizedBox(width: context.spacing.sm),
                            FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text('Terima'),
                            ),
                          ],
                        ),
                        SizedBox(height: context.appSize.s16),
                        Padding(
                          padding: EdgeInsets.only(
                            left: context.spacing.sm,
                            right: context.spacing.sm,
                          ),
                          child: Row(
                            spacing: context.spacing.xs,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Arisan Ceria',
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyles.bodySmall
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Kode Grup',
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyles.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '12 Oktober 2025',
                                overflow: TextOverflow.ellipsis,
                                style: context.textStyles.bodySmall,
                              ),
                            ],
                          ),
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
