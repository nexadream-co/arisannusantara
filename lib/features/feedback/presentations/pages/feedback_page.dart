import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/app_modal_bottom_sheet.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: context.spacing.md),
                padding: EdgeInsets.all(context.spacing.lg),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(context.assets.textureBg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Feedback',
                        maxLines: 1,
                        style: context.textStyles.header,
                      ),
                      Text(
                        'Semua feedback yang diberikan pengguna',
                        maxLines: 1,
                        style: context.textStyles.body,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: context.spacing.lg),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Cari feedback...",
                    hintStyle: context.textStyles.subtitle,
                    fillColor: context.colors.surface,
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
              Container(
                margin: EdgeInsets.only(
                  bottom: context.spacing.lg,
                  top: context.spacing.md,
                ),
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
                        'Proses',
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
                        'Selesai',
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
                        'Diabaikan',
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
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  left: context.spacing.lg,
                  right: context.spacing.lg,
                ),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _detailFeedback();
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: context.spacing.md),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.sm,
                        vertical: context.spacing.md,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: context.colors.surface),
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: context.colors.surface,
                                child: Icon(
                                  Icons.chat_outlined,
                                  color: context.colors.primary,
                                ),
                              ),
                              SizedBox(width: context.spacing.sm),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Lorem Ipsum, dolor sit amet',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyles.body.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'agushermanto@gmail.com',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyles.body,
                                    ),
                                    SizedBox(height: context.spacing.sm),
                                    Wrap(
                                      children: [
                                        Text(
                                          'Agus Hermanto',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: context
                                              .textStyles
                                              .subtitleSmall
                                              .copyWith(
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        SizedBox(width: context.spacing.md),
                                        Text(
                                          '12 October 2025',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: context
                                              .textStyles
                                              .subtitleSmall
                                              .copyWith(
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Selesai',
                                style: context.textStyles.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.success,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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

  void _detailFeedback() {
    showAppModalBottomSheet(
      context: context,
      child: Container(
        padding: EdgeInsets.all(context.spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Feedback',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.title.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.primary,
                  ),
                ),
                Text(
                  'Masukkan dan kritik yang diberikan pengguna',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.body,
                ),
              ],
            ),
            SizedBox(height: context.appSize.s16),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: context.spacing.sm,
                horizontal: context.spacing.md,
              ),
              decoration: BoxDecoration(
                color: context.colors.accent,
                borderRadius: BorderRadius.circular(context.radius.medium),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.info_outline),
                  SizedBox(width: context.spacing.sm),
                  Expanded(
                    child: Text(
                      'Lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
                      style: context.textStyles.body,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.appSize.s16),
            Text('Infomasi Feedback', style: context.textStyles.title),
            SizedBox(height: context.spacing.md),
            _groupInformationItem('Judul', 'Lorem ipsum dolor'),
            _groupInformationItem('Feedback', 'Dolor ipsom lorem ipsum'),
            Container(
              margin: EdgeInsets.only(
                top: context.spacing.lg,
                bottom: context.spacing.sm,
              ),
              child: Text(
                'Status',
                style: context.textStyles.body.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 5,
              ),
              children: [
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: true,
                  onChanged: (value) {},
                  title: Text('Proses'),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: false,
                  onChanged: (value) {},
                  title: Text('Selesai'),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: true,
                  onChanged: (value) {},
                  title: Text('Abaikan'),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: false,
                  onChanged: (value) {},
                  title: Text('Batal'),
                ),
              ],
            ),
            SizedBox(height: context.appSize.s16),
            Container(
              margin: EdgeInsets.only(
                top: context.spacing.lg,
                bottom: context.spacing.sm,
              ),
              child: Row(
                spacing: context.spacing.sm,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: context.spacing.md,
                        horizontal: context.spacing.xl,
                      ),
                      foregroundColor: context.colors.error,
                      side: BorderSide(color: context.colors.error, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                      ),
                    ),
                    child: Text('Hapus'),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      child: Text('Simpan'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _groupInformationItem(String label, String value) {
    return Container(
      padding: EdgeInsets.only(bottom: context.spacing.sm),
      margin: EdgeInsets.only(bottom: context.spacing.sm),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.divider)),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: context.textStyles.body)),
          Text(
            value,
            style: context.textStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
