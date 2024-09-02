import 'package:flutter/material.dart';
import 'package:splendlens_fe/repository/repository.dart';

class AuthenticationViewmodel {
  final _authRepo = AuthRepositoryImp();

  Future<void> login(BuildContext context, dynamic body) async {
    // to move to state
    dynamic loginBody = body;

    await _authRepo.login(body);
  }
}
