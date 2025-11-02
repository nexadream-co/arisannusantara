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
}
