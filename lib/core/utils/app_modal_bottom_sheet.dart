import 'package:flutter/material.dart';

/// Displays a **default modal bottom sheet** that automatically
/// pushes upward when the keyboard is shown (e.g., for text fields).
///
/// This is useful for forms, inputs, or dialogs that require user text entry.
///
/// ### Example usage:
/// ```dart
/// showAppModalBottomSheet(
///   context: context,
///   title: "Add Note",
///   child: Padding(
///     padding: const EdgeInsets.all(16),
///     child: Column(
///       mainAxisSize: MainAxisSize.min,
///       children: [
///         TextField(
///           decoration: InputDecoration(labelText: 'Title'),
///         ),
///         const SizedBox(height: 10),
///         TextField(
///           decoration: InputDecoration(labelText: 'Description'),
///           maxLines: 3,
///         ),
///         const SizedBox(height: 20),
///         ElevatedButton(
///           onPressed: () => Navigator.pop(context),
///           child: const Text('Submit'),
///         ),
///       ],
///     ),
///   ),
/// );
/// ```
///
/// ### Parameters:
/// - [context]: The build context.
/// - [child]: The widget to display inside the bottom sheet.
/// - [title]: (Optional) A title displayed at the top of the sheet.
/// - [isDismissible]: Whether the user can tap outside to close (default `true`).
/// - [enableDrag]: Whether the sheet can be swiped down to close (default `true`).
///
Future<void> showAppModalBottomSheet({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
      return Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SafeArea(
            top: false,
            child: Column(mainAxisSize: MainAxisSize.min, children: [child]),
          ),
        ),
      );
    },
  );
}
