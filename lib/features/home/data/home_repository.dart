import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../config/database/db_collection.dart';
import '../../../config/enums/period_filter.dart';
import '../../../core/app/result.dart';

class HomeRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  /// Helper to build date range based on period enum
  Map<String, DateTime> _getDateRange(PeriodFilter period) {
    final now = DateTime.now();
    late DateTime start;

    switch (period) {
      case PeriodFilter.thisMonth:
        start = DateTime(now.year, now.month, 1);
        break;
      case PeriodFilter.threeMonthsAgo:
        start = DateTime(now.year, now.month - 3, now.day);
        break;
      case PeriodFilter.sixMonthsAgo:
        start = DateTime(now.year, now.month - 6, now.day);
        break;
      case PeriodFilter.oneYearAgo:
        start = DateTime(now.year - 1, now.month, now.day);
        break;
    }

    return {'start': start, 'end': now};
  }

  Future<Result<int>> getTotalGroups({required PeriodFilter period}) async {
    try {
      final range = _getDateRange(period);

      final query = await _firestore
          .collection(DBCollections.groups)
          .where('createdAt', isGreaterThanOrEqualTo: range['start'])
          .where('createdAt', isLessThanOrEqualTo: range['end'])
          .get();

      return Result.success(query.size);
    } catch (e) {
      return Result.failed('Failed to get total groups: $e');
    }
  }

  Future<Result<int>> getTotalUsers({required PeriodFilter period}) async {
    try {
      final range = _getDateRange(period);

      final query = await _firestore
          .collection(DBCollections.users)
          .where('createdAt', isGreaterThanOrEqualTo: range['start'])
          .where('createdAt', isLessThanOrEqualTo: range['end'])
          .get();

      return Result.success(query.size);
    } catch (e) {
      return Result.failed('Failed to get total users: $e');
    }
  }

  Future<Result<int>> getTotalFeedbacks({required PeriodFilter period}) async {
    try {
      final range = _getDateRange(period);

      final query = await _firestore
          .collection(DBCollections.feedback)
          .where('createdAt', isGreaterThanOrEqualTo: range['start'])
          .where('createdAt', isLessThanOrEqualTo: range['end'])
          .get();

      return Result.success(query.size);
    } catch (e) {
      return Result.failed('Failed to get total feedbacks: $e');
    }
  }

  Future<Result<int>> getTotalShuffle({required PeriodFilter period}) async {
    try {
      final range = _getDateRange(period);

      final query = await _firestore
          .collection(DBCollections.histories)
          .where('createdAt', isGreaterThanOrEqualTo: range['start'])
          .where('createdAt', isLessThanOrEqualTo: range['end'])
          .get();

      return Result.success(query.size);
    } catch (e) {
      return Result.failed('Failed to get total shuffle: $e');
    }
  }

  Future<Result<double?>> getPaidGroupsPercentage() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return const Result.failed('User not found');
      }

      final membersRef = _firestore.collection(DBCollections.members);

      // Query all active members for current user (skip == false or not exists)
      final totalSnapshot = await membersRef
          .where('userId', isEqualTo: user.uid)
          .where('isActive', isEqualTo: true)
          .where('skip', isNotEqualTo: true)
          .get();

      // If user never joined any active group
      if (totalSnapshot.docs.isEmpty) {
        return const Result.success(null);
      }

      // Query all paid members
      final paidSnapshot = await membersRef
          .where('userId', isEqualTo: user.uid)
          .where('isActive', isEqualTo: true)
          .where('skip', isNotEqualTo: true)
          .where('paidAt', isNotEqualTo: null)
          .get();

      final totalCount = totalSnapshot.size;
      final paidCount = paidSnapshot.size;

      // Safely convert num to double
      final percentage = (paidCount / totalCount * 100)
          .clamp(0, 100)
          .toDouble();

      return Result.success(percentage);
    } catch (e) {
      return Result.failed('Failed to calculate paid groups percentage: $e');
    }
  }
}
