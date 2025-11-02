import 'package:intl/intl.dart';

extension NumberExtensions on num {
  /// Format number to Indonesian currency format without prefix
  /// Example: 10000000 -> "10.000.000"
  String get toIdrFormat {
    final formatter = NumberFormat.decimalPattern('id_ID');
    return formatter.format(this);
  }

  /// Format number to Indonesian currency with Rp prefix
  /// Example: 10000000 -> "Rp10.000.000"
  String get toIdrWithPrefix {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return formatter.format(this);
  }
}
