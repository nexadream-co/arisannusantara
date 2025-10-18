import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class TextFieldPrimaryWidget extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String? label;
  final String? hintText;
  final Widget? suffixIcon;
  const TextFieldPrimaryWidget({
    super.key,
    this.label,
    this.hintText,
    this.margin,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide(color: context.colors.primary, width: 1.5),
    );

    return Container(
      margin: margin ?? EdgeInsets.only(bottom: context.spacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: EdgeInsets.only(bottom: context.spacing.xs),
              child: Text(label!, style: context.textStyles.body),
            ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: context.textStyles.subtitle.copyWith(
                fontStyle: FontStyle.italic,
              ),
              enabledBorder: border,
              focusedBorder: border,
              border: border,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
