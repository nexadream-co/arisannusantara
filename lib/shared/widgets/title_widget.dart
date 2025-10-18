import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  const TitleWidget({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.appSize.s8),
        Text(title, style: context.textStyles.headline1),
        SizedBox(height: context.spacing.sm),
        if (subtitle != null)
          Container(
            margin: EdgeInsets.only(bottom: context.spacing.md),
            child: Text(subtitle!, style: context.textStyles.body),
          ),
        Container(
          width: context.appSize.s64,
          height: context.appSize.s8,
          decoration: BoxDecoration(
            color: context.colors.secondary,
            borderRadius: BorderRadius.circular(context.radius.small),
          ),
        ),
      ],
    );
  }
}
