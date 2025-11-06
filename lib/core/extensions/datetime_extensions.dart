import 'package:intl/intl.dart';

extension NullableDateTimeExtensions on DateTime? {
  /// Format nullable DateTime to Indonesian date
  /// Example:
  /// - DateTime(2025, 10, 12) -> "12 Oktober 2025"
  /// - null -> "-"
  String get toIdDate {
    if (this == null) return '-';
    final formatter = DateFormat('d MMMM yyyy', 'id_ID');
    return formatter.format(this!);
  }

  /// Format nullable DateTime to Indonesian date and time
  /// Example:
  /// - DateTime(2025, 10, 12, 10, 23) -> "12 Oktober 2025 10:23"
  /// - null -> "-"
  String get toIdDateTime {
    if (this == null) return '-';
    final formatter = DateFormat('d MMMM yyyy HH:mm', 'id_ID');
    return formatter.format(this!);
  }

  /// Format to full Indonesian date with day name and time
  /// Example: Senin, 7 Januari 2025 14:35
  String get toIdFullDateTime {
    if (this == null) return '-';
    final formatter = DateFormat('EEEE, d MMMM yyyy HH:mm', 'id_ID');
    return formatter.format(this!);
  }

  /// Format to full Indonesian date with day name only (no time)
  /// Example: Senin, 7 Januari 2025
  String get toIdFullDate {
    if (this == null) return '-';
    final formatter = DateFormat('EEEE, d MMMM yyyy', 'id_ID');
    return formatter.format(this!);
  }
}
