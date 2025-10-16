import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  const TitleWidget({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: context.textStyles.headline1),
        SizedBox(height: context.spacing.sm),
        if (subtitle != null)
          Container(
            margin: EdgeInsets.only(bottom: context.spacing.sm),
            child: Text(subtitle!, style: context.textStyles.body),
          ),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            color: context.colors.secondary,
            borderRadius: BorderRadius.circular(context.radius.small),
          ),
        ),
      ],
    );
  }
}
