import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splendlens_fe/core/data/response/auth_response.dart';
import 'package:splendlens_fe/models/responses/login_response.dart';
import 'package:splendlens_fe/repository/repository.dart';

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

  AuthStatus _status = AuthStatus.unauthenticated;
  AuthStatus get status => _status;
  set status(AuthStatus newStatus) {
    _status = newStatus;
    notifyListeners();
  }

  String errorMessage = '';

  void handleError(BuildContext context, String message) {
    debugPrint(message);
    _isLoading = false;
    notifyListeners();
  }

  void handleSessionResponse(
      BuildContext context, LoginResponse? response) async {
    _isLoading = false;
    notifyListeners();

    if (response != null && response.key != null) {
      _status = AuthStatus.authenticated;
      notifyListeners();
      _key = response.key;

      context.go('/');

      // append key to loginbody
      loginBody['key'] = _key;
      debugPrint(jsonEncode(loginBody));
      await saveUserCredentials(jsonEncode(loginBody));
    } else {
      // to handle
      debugPrint(response?.errorMessage);
    }
  }

  Future<void> login(BuildContext context, Map<String, dynamic> body) async {
    _isLoading = true;
    loginBody = body;
    _status = AuthStatus.authenticating;

    authRepository
        .login(body)
        .then((value) => handleSessionResponse(context, value))
        .onError((error, StackTrace) => handleError(context, error.toString()));
  }

  Future saveUserCredentials(String userCredentials) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? credentials = prefs.getString('userCredentials');

    if (credentials == null) {
      await prefs.setString('userCredentials', userCredentials);
    }
  }
}
