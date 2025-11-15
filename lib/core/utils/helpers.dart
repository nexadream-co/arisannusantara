import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

DateTime? parseFirestoreDate(dynamic value) {
  if (value == null) return null;

  if (value is Timestamp) {
    return value.toDate();
  } else if (value is DateTime) {
    return value;
  } else if (value is String) {
    // Optional: handle string ISO8601 format (if exists in older data)
    return DateTime.tryParse(value);
  } else {
    return null;
  }
}

Future<void> applaunchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Tidak bisa membuka $url');
  }
}
