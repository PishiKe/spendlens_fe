// ignore_for_file: body_might_complete_normally_nullable

import 'package:splendlens_fe/models/models.dart';

abstract class UserRepository {
  Future<UserResponse?> getUser(String? key) async {}
}
