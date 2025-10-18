import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class DividerWidget extends StatelessWidget {
  final String? text;
  const DividerWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      thickness: 0.5,
      color: context.colors.textSecondary,
    );

    if (text == null) {
      return divider;
    }

    return Row(
      children: [
        Expanded(child: divider),
        Container(
          margin: EdgeInsets.symmetric(horizontal: context.spacing.sm),
          child: Text(
            text!,
            style: context.textStyles.body.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Expanded(child: divider),
      ],
    );
  }
}
