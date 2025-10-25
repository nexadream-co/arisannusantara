import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_entity.dart';

class AuthLocalDataSource {
  static const _userKey = 'user_session';

  /// Save user data locally
  Future<void> saveUser(UserEntity user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  /// Retrieve user data
  Future<UserEntity?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;

    final data = jsonDecode(jsonString);
    return UserEntity.fromJson(data);
  }

  /// Clear stored session
  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
