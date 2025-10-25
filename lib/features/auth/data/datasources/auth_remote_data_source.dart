import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/app/result.dart';
import '../../domain/entities/user_entity.dart';

class AuthRemoteDataSource {
  final String baseUrl;

  AuthRemoteDataSource({this.baseUrl = 'https://api.yourapp.com'});

  /// Login via API
  Future<Result<UserEntity>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Result.success(UserEntity.fromJson(data['user']));
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  /// Example: Fetch user profile from API
  Future<UserEntity> getProfile(String token) async {
    final url = Uri.parse('$baseUrl/profile');

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return UserEntity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch profile');
    }
  }
}
