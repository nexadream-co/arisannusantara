import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';

class PrivacyPolicyRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Result<Map<String, dynamic>>> getPrivacyPolicy() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return const Result.failed('Pengguna tidak ditemukan');
      }

      // Reference to settings collection
      final settingRef = _firestore
          .collection(DBCollections.settings)
          .where('key', isEqualTo: 'privacyPolicy')
          .limit(1);

      final querySnapshot = await settingRef.get();

      if (querySnapshot.docs.isEmpty) {
        return const Result.failed('Kebijakan Privasi tidak ditemukan');
      }

      final doc = querySnapshot.docs.first;
      final data = doc.data();

      return Result.success({
        'key': data['key'],
        'value': data['value'], // already a Map<String, dynamic>
        'updatedAt': data['updatedAt'],
      });
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
