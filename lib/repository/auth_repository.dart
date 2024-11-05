// ignore_for_file: body_might_complete_normally_nullable

import 'package:splendlens_fe/models/models.dart';

abstract class AuthRepository {
  Future<LoginResponse?> login(Map<String, dynamic> body) async {}
  Future<UserResponse?> user(String? key) async {}
}
