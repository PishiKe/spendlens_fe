// ignore_for_file: body_might_complete_normally_nullable

import 'package:splendlens_fe/models/responses/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse?> login(dynamic body) async {}
}