import 'package:flutter/material.dart';

class AppShadow {
  /// small = BoxShadow with blurRadius 4, offset (0, 2)
  final BoxShadow small = BoxShadow(
    color: Colors.black.withValues(alpha: 0.1),
    blurRadius: 2,
    offset: Offset(0, 2),
  );

  /// medium = BoxShadow with blurRadius 8, offset (0, 4)
  final BoxShadow medium = BoxShadow(
    color: Colors.black.withValues(alpha: 0.1),
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  /// large = BoxShadow with blurRadius 16, offset (0, 8)
  final BoxShadow large = BoxShadow(
    color: Colors.black.withValues(alpha: 0.1),
    blurRadius: 16,
    offset: Offset(0, 8),
  );

  /// subtle = Very light shadow (for cards)
  final BoxShadow subtle = BoxShadow(
    color: Colors.black.withValues(alpha: 0.1),
    blurRadius: 2,
    offset: Offset(0, 1),
  );

  /// none = no shadow
  final BoxShadow none = BoxShadow(
    color: Colors.black.withValues(alpha: 0.1),
    blurRadius: 0,
    offset: Offset(0, 0),
  );
}
