import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/// Firebase Messaging Service (no local notifications)
class FirebaseMessagingService {
  static final FirebaseMessagingService _instance =
      FirebaseMessagingService._internal();
  factory FirebaseMessagingService() => _instance;
  FirebaseMessagingService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  bool _initialized = false;

  /// Call this once inside your main page’s initState
  Future<void> init(BuildContext context) async {
    if (_initialized) return;
    _initialized = true;

    // Request notification permissions (especially iOS / Android 13+)
    await _messaging.requestPermission(alert: true, badge: true, sound: true);

    // Print FCM token (for testing)
    final token = await _messaging.getToken();
    debugPrint('📱 FCM Token: $token');

    // 🔹 Foreground message handler — show Snackbar
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? 'No title';
      final body = message.notification?.body ?? 'No body';

      // Show as Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title\n$body'),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
    });

    // 🔹 Background tap handler — when user taps notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessageClick(context, message);
    });

    // 🔹 Terminated state (when app opened from a notification)
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageClick(context, initialMessage);
    }
  }

  /// Handle navigation when a notification is tapped
  void _handleMessageClick(BuildContext context, RemoteMessage message) {
    final data = message.data;
    final route = data['route'];

    if (route != null && route.isNotEmpty) {
      Navigator.of(context).pushNamed(route);
    }
    // else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('🔔 Notification clicked (no route provided)'),
    //       behavior: SnackBarBehavior.floating,
    //     ),
    //   );
    // }
  }
}
