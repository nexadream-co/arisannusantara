import 'package:cloud_firestore/cloud_firestore.dart';

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
