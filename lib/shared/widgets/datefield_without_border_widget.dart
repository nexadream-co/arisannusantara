import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/extensions/context_extensions.dart';

class DateFieldWithoutBorderWidget extends StatefulWidget {
  final String hintText;
  final String? label;
  final bool required;
  final DateTime? initialValue;
  final String? Function(DateTime?)? validator;
  final ValueChanged<DateTime?>? onChanged;

  const DateFieldWithoutBorderWidget({
    super.key,
    required this.hintText,
    this.label,
    this.required = false,
    this.initialValue,
    this.validator,
    this.onChanged,
  });

  @override
  State<DateFieldWithoutBorderWidget> createState() =>
      _DateFieldWithoutBorderWidgetState();
}

class _DateFieldWithoutBorderWidgetState
    extends State<DateFieldWithoutBorderWidget> {
  late TextEditingController _controller;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialValue;
    _controller = TextEditingController(
      text: _selectedDate != null
          ? DateFormat('dd MMMM yyyy').format(_selectedDate!)
          : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _controller.text = DateFormat('dd MMMM yyyy').format(picked);
      });
      widget.onChanged?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(borderSide: BorderSide.none);

    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: _pickDate,
      validator: (value) {
        // Use custom validator if provided
        if (widget.validator != null) {
          return widget.validator!(_selectedDate);
        }

        // Default validation
        if (widget.required && _selectedDate == null) {
          return '${widget.label ?? 'Tanggal'} tidak boleh kosong';
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
        suffix: Padding(
          padding: EdgeInsets.only(right: context.spacing.md),
          child: Icon(Icons.calendar_today_rounded, size: 12),
        ),
        isDense: true,
        contentPadding: EdgeInsets.zero,
        enabledBorder: border,
        focusedBorder: border,
        border: border,
      ),
    );
  }
}
