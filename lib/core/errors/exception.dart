import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future<void> handleException(
  error, {
  StackTrace? stackTrace,
  String? url,
}) async {
  final informations = [];

  if (url != null) informations.add(url);

  await FirebaseCrashlytics.instance.recordError(
    error,
    stackTrace,
    information: informations as Iterable<Object>,
  );
}
