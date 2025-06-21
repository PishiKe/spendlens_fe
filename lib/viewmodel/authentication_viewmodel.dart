import 'package:flutter/material.dart';
import 'package:splendlens_fe/core/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splendlens_fe/core/models/responses/responses.dart';
import 'package:splendlens_fe/core/data/response/auth_response.dart';

class AuthenticationViewModel with ChangeNotifier {
  final _authRepository = AuthRepositoryImp();
  dynamic loginBody;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool newLoading) {
    _isLoading = newLoading;
    notifyListeners();
  }

  AuthStatus _status = AuthStatus.unauthenticated;
  AuthStatus get status => _status;
  set status(AuthStatus newStatus) {
    _status = newStatus;
    notifyListeners();
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String newMessage) {
    _errorMessage = newMessage;
    notifyListeners();
  }

  UserResponse? _user;
  UserResponse? get user => _user;

  String? _firstName;
  String? get firstName => _firstName;

  Future<void> handleSessionResponse(LoginResponse? response) async {
    _isLoading = false;
    if (response != null && response.key != null) {
      _status = AuthStatus.authenticated;
      saveAuthKey(response.key!.toString());
    } else {
      _status = AuthStatus.unauthenticated;
      _errorMessage = response!.errorMessage!;
    }
  }

  Future<void> login(Map<String, dynamic> body) async{
    _isLoading = true;
    loginBody = body;
    _status = AuthStatus.authenticating;

    final response = await _authRepository.login(body);
    await handleSessionResponse(response);
  }

  void handleUserReponse(UserResponse? response) {
    if (response != null) {
      _user = response;
      _firstName = response.username;
    }
  }

  Future<void> getUser(BuildContext context, String? key) async {
    return _authRepository
        .user(key)
        .then((value) => handleUserReponse(value));
  }

  Future saveAuthKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('key', key);
    notifyListeners();
  }

  Future<String> getKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('key') ?? '';
  }
}
