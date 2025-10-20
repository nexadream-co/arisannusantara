import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class TextfieldWithoutBorderWidget extends StatelessWidget {
  final String hintText;
  final TextAlign textAlign;
  const TextfieldWithoutBorderWidget({
    super.key,
    required this.hintText,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderSide: BorderSide.none);
    return TextFormField(
      textAlign: textAlign,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.textStyles.subtitle.copyWith(
          fontStyle: FontStyle.italic,
        ),
        contentPadding: EdgeInsets.zero,
        isDense: true,
        enabledBorder: border,
        focusedBorder: border,
        border: border,
      ),
    );
  }
}
