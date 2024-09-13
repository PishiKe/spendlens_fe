import 'package:flutter/material.dart';
import 'package:splendlens_fe/repository/repository.dart';

class AuthenticationViewModel {
  final AuthRepository authRepository = AuthRepositoryImp();
  String errorMessage = '';

  Future<void> login(BuildContext context, Map<String, dynamic> body) async {
    try {
      final response = await authRepository.login(body);

      if (response != null) {
        // Handle the successful response (store token, navigate, etc.)
        // print('Login response: ${response.toJson()}');
      }
    } catch (e) {
      errorMessage = e.toString();
      debugPrint('Login error: $errorMessage');
    } finally {
      // You can manage the loading state here if needed
    }
  }
}
