import 'dart:async';
import 'package:flutter/foundation.dart';

/// A helper that converts a [Stream] into a [Listenable] so that
/// GoRouter can refresh when your Riverpod stream emits a new event.
///
/// Usage example:
/// ```dart
/// refreshListenable: GoRouterRefreshStream(ref.watch(authNotifierProvider.notifier).stream),
/// ```
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
