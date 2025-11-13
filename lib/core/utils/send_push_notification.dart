import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis_auth/auth_io.dart';

/// A service class that sends Firebase Cloud Messaging (FCM) notifications
/// directly from the Flutter client using the FCM HTTP v1 API.
///
/// Do not include service account credentials inside your production app bundle.
/// For production, handle push notifications securely on your backend server.
class FirebasePushService {
  /// The required OAuth scope for accessing Firebase Cloud Messaging.
  static const _scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

  /// Loads the Firebase service account credentials from an asset JSON file.
  ///
  /// The JSON file should be added in `pubspec.yaml` under:
  /// ```yaml
  /// flutter:
  ///   assets:
  ///     - assets/credentials/service-account.json
  /// ```
  ///
  /// Returns a decoded JSON map that contains the service account details.
  Future<Map<String, dynamic>> _loadServiceAccount() async {
    final jsonString = await rootBundle.loadString(
      'assets/credentials/service-account.json',
    );
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  /// Sends a single push notification to a specific FCM device token
  /// using the Firebase Cloud Messaging HTTP v1 API.
  ///
  /// Parameters:
  /// - [deviceToken]: The FCM device token of the target device.
  /// - [title]: The notification title to display.
  /// - [body]: The notification body text.
  /// - [route]: (optional) A custom route or payload to include in the message data.
  ///
  /// Prints the HTTP response when in debug mode.
  Future<void> sendPushMessage({
    required String deviceToken,
    required String title,
    required String body,
    String? route,
  }) async {
    try {
      final serviceAccount = await _loadServiceAccount();
      final credentials = ServiceAccountCredentials.fromJson(serviceAccount);
      final client = await clientViaServiceAccount(credentials, _scopes);

      final projectId = serviceAccount['project_id'];
      final url =
          'https://fcm.googleapis.com/v1/projects/$projectId/messages:send';

      final message = {
        "message": {
          "token": deviceToken,
          "notification": {"title": title, "body": body},
          "data": {"route": route},
        },
      };

      final response = await client.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(message),
      );

      if (kDebugMode) {
        print('🔹 Status Code: ${response.statusCode}');
        print('🔹 Response Body: ${response.body}');
        client.close();
      }
    } catch (_) {
      // Silently ignore errors to prevent crash; handle logging externally if needed
    }
  }

  /// Sends the same push notification to multiple devices.
  ///
  /// This function iterates through all device tokens and calls [sendPushMessage]
  /// for each one. Use this for simple multi-device broadcasts.
  ///
  /// Parameters:
  /// - [deviceTokens]: List of FCM device tokens to send the message to.
  /// - [title]: Notification title text.
  /// - [body]: Notification body text.
  ///
  /// Logs progress and results when running in debug mode.
  Future<void> sendPushToMultipleDevices({
    required List<String> deviceTokens,
    required String title,
    required String body,
  }) async {
    if (deviceTokens.isEmpty) {
      if (kDebugMode) {
        print('⚠️ No tokens provided.');
      }
      return;
    }

    if (kDebugMode) {
      print('🚀 Sending message to ${deviceTokens.length} devices...');
    }

    for (final token in deviceTokens) {
      try {
        await sendPushMessage(deviceToken: token, title: title, body: body);
      } catch (e) {
        if (kDebugMode) {
          print('❌ Failed to send to $token → $e');
        }
      }
    }

    if (kDebugMode) {
      print('✅ Done sending notifications.');
    }
  }
}
