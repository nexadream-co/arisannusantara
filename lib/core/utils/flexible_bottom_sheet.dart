import 'package:flutter/material.dart';

/// Displays a reusable and scrollable **flexible modal bottom sheet**.
///
/// This function creates a modal bottom sheet that can be dragged,
/// scrolled, and expanded dynamically (using [DraggableScrollableSheet]).
/// It’s useful for displaying scrollable content (like lists or forms)
/// that can expand from a small peek view up to almost full screen.
///
/// ### Example usage:
/// ```dart
/// showFlexibleBottomSheet(
///   context: context,
///   initialSize: 0.4, // optional: start height as 40% of screen
///   minSize: 0.2,     // optional: collapsed height as 20%
///   maxSize: 0.9,     // optional: expanded height as 90%
///   builder: (scrollController) {
///     return ListView.builder(
///       controller: scrollController,
///       itemCount: 30,
///       itemBuilder: (context, index) {
///         return ListTile(
///           title: Text('Item #$index'),
///         );
///       },
///     );
///   },
/// );
/// ```
///
/// ### Parameters:
/// - [context]: Build context to show the modal.
/// - [builder]: Function that returns the scrollable content widget.
///   The provided [scrollController] must be attached to any scrollable
///   widget inside to ensure smooth drag/scroll sync.
/// - [initialSize]: The initial visible portion of the sheet (default `0.4`).
/// - [minSize]: The minimum collapsed size (default `0.2`).
/// - [maxSize]: The maximum expanded size (default `0.9`).
///
/// ### Notes:
/// - Use `isScrollControlled: true` to allow full-screen expansion.
/// - You can wrap the child content with your own UI and header.
/// - The sheet includes transparent background for rounded corners styling.
///
/// Example visual behavior:
/// ``
Future<void> showFlexibleBottomSheet({
  required BuildContext context,
  required Widget Function(ScrollController scrollController) builder,
  double initialSize = 0.4,
  double minSize = 0.2,
  double maxSize = 0.95,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialSize,
        minChildSize: minSize,
        maxChildSize: maxSize,
        builder: (context, scrollController) {
          return _FlexibleSheetContainer(
            scrollController: scrollController,
            child: builder(scrollController),
          );
        },
      );
    },
  );
}

class _FlexibleSheetContainer extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;

  const _FlexibleSheetContainer({
    required this.child,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          Navigator.of(context).maybePop();
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onVerticalDragStart: (_) {},
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
