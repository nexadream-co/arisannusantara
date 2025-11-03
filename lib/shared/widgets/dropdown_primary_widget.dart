import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class DropdownPrimaryWidget<T> extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String? label;
  final bool required;
  final String? hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  const DropdownPrimaryWidget({
    super.key,
    this.margin,
    this.label,
    this.required = false,
    this.hintText,
    this.value,
    required this.items,
    this.onChanged,
    this.validator,
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
          DropdownButtonFormField<T>(
            initialValue: value,
            validator:
                validator ??
                (v) {
                  if (required && v == null) {
                    return '${label ?? 'Input'} tidak boleh kosong';
                  }
                  return null;
                },
            style: context.textStyles.body,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: context.textStyles.subtitle.copyWith(
                fontStyle: FontStyle.italic,
              ),
              enabledBorder: border,
              focusedBorder: border,
              border: border,
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.spacing.md,
                vertical: context.spacing.sm,
              ),
            ),
            items: items,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
