import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splendlens_fe/models/responses/login_response.dart';
import 'package:splendlens_fe/repository/repository.dart';
import 'package:splendlens_fe/ui/screens/home/home_screen.dart';

class AuthenticationViewModel extends ChangeNotifier {
  final AuthRepository authRepository = AuthRepositoryImp();
  dynamic loginBody;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool newLoading) {
    _isLoading = newLoading;
    notifyListeners();
  }

  String? _key;
  String get key => _key!;
  set key(String? newKey) {
    _key = newKey;
    notifyListeners();
  }

  String errorMessage = '';

  void handleError(BuildContext context, String message) {
    debugPrint(message);
    _isLoading = false;
    notifyListeners();
  }

  void handleSessionResponse(BuildContext context, LoginResponse? response) {
    _isLoading = false;
    notifyListeners();

    if (response != null && response.key != null) {
      _key = response.key;
      context.go('/');
    } else {
      // debugPrint(response?.errorMessage);
    }
  }

  Future<void> login(BuildContext context, Map<String, dynamic> body) async {
    _isLoading = true;

    loginBody = body;

    authRepository
        .login(body)
        .then((value) => handleSessionResponse(context, value))
        .onError((error, StackTrace) => handleError(context, error.toString()));
  }
}
