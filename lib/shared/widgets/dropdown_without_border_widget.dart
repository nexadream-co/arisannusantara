import 'package:flutter/material.dart';

class DropdownWithoutBorderWidget<T> extends StatelessWidget {
  final String hintText;
  final String? label;
  final bool required;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;

  const DropdownWithoutBorderWidget({
    super.key,
    required this.hintText,
    required this.items,
    this.label,
    this.required = false,
    this.value,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final border = const OutlineInputBorder(borderSide: BorderSide.none);

    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items,
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (required && value == null) {
              return '${label ?? 'Input'} tidak boleh kosong';
            }
            return null;
          },
      isExpanded: true,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
        contentPadding: EdgeInsets.zero,
        isDense: true,
        enabledBorder: border,
        focusedBorder: border,
        border: border,
      ),
    );
  }
}
