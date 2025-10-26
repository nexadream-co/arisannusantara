import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

Future<void> handleException(
  error, {
  StackTrace? stackTrace,
  String? url,
}) async {
  if (kDebugMode) {
    if (url != null) print(url);
    print(error);
    if (stackTrace != null) print(stackTrace);
  }

  final informations = [];

  if (url != null) informations.add(url);

  await FirebaseCrashlytics.instance.recordError(
    error,
    stackTrace,
    information: informations as Iterable<Object>,
  );
}
