import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../config/database/db_collection.dart';
import '../../../core/app/result.dart';

class TermConditionRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<Result<Map<String, dynamic>>> getTermAndCondition() async {
    try {
      // Reference to settings collection
      final settingRef = _firestore
          .collection(DBCollections.settings)
          .where('key', isEqualTo: 'termCondition')
          .limit(1);

      final querySnapshot = await settingRef.get();

      if (querySnapshot.docs.isEmpty) {
        return const Result.failed('Syarat dan Ketentuan tidak ditemukan');
      }

      final doc = querySnapshot.docs.first;
      final data = doc.data();

      return Result.success({
        'key': data['key'],
        'value': data['value'],
        'updatedAt': data['updatedAt'],
      });
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
