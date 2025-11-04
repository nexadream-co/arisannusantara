import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class TextfieldWithoutBorderWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextAlign textAlign;
  final int? minLines;
  final int? maxLines;
  final String? label;
  final bool required;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const TextfieldWithoutBorderWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.minLines,
    this.label,
    this.maxLines,
    this.keyboardType,
    this.required = false,
    this.validator,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderSide: BorderSide.none);
    return TextFormField(
      controller: controller,
      textAlign: textAlign,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      validator:
          validator ??
          (value) {
            if (required && (value ?? '').isEmpty) {
              return '${label ?? 'Input'} tidak boleh kosong';
            }
            return null;
          },
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
