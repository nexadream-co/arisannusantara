import 'package:flutter/material.dart';

enum SnackbarType { success, warning, error }

class CustomSnackbar {
  static success(
    BuildContext context, {
    String? title,
    String? message,
    SnackbarType? type,
    Duration? duration,
    bool mounted = true,
  }) => show(
    context,
    title: title,
    message: message,
    type: SnackbarType.success,
    duration: duration,
    mounted: mounted,
  );

  static warning(
    BuildContext context, {
    String? title,
    String? message,
    SnackbarType? type,
    Duration? duration,
    bool mounted = true,
  }) => show(
    context,
    title: title,
    message: message,
    type: SnackbarType.warning,
    duration: duration,
    mounted: mounted,
  );

  static error(
    BuildContext context, {
    String? title,
    String? message,
    SnackbarType? type,
    Duration? duration,
    bool mounted = true,
  }) => show(
    context,
    title: title,
    message: message,
    type: SnackbarType.error,
    duration: duration,
    mounted: mounted,
  );

  static show(
    BuildContext context, {
    String? title,
    String? message,
    SnackbarType? type,
    Duration? duration,
    bool mounted = true,
  }) {
    if (!mounted) return;
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              type == SnackbarType.success
                  ? Icons.check_circle
                  : type == SnackbarType.warning
                  ? Icons.info
                  : Icons.error_outline,
              color: _color(type),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  if (message != null)
                    Text(
                      message,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      duration: duration ?? const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

Color _color(SnackbarType? type) {
  return type == SnackbarType.success
      ? Colors.green.shade700
      : type == SnackbarType.warning
      ? Colors.orange
      : Colors.red.shade700;
}
