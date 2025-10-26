import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class TextFieldPrimaryWidget extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final String? label;
  final String? hintText;
  final Widget? suffixIcon;
  final bool required;
  final bool obscureText;
  final String? Function(String?)? validator;
  const TextFieldPrimaryWidget({
    super.key,
    this.controller,
    this.label,
    this.required = false,
    this.hintText,
    this.validator,
    this.obscureText = false,
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
            controller: controller,
            validator:
                validator ??
                (value) {
                  if (required && (value ?? '').isEmpty) {
                    return '${label ?? 'Input'} tidak boleh kosong';
                  }
                  return null;
                },
            obscureText: obscureText,
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
