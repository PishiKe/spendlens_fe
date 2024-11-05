import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splendlens_fe/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splendlens_fe/models/responses/responses.dart';
import 'package:splendlens_fe/core/data/response/auth_response.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

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

  String errorMessage = '';

  UserResponse? _user;
  UserResponse? get user => _user;
  set user(UserResponse? newUser) {
    _user = newUser;
    notifyListeners();
  }

  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? newFirstName) {
    _firstName = newFirstName;
    notifyListeners();
  }

  void handleError(BuildContext context, String message) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: message,
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
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

      saveAuthKey(response.key!.toString());

      context.go('/');
    } else {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color.fromARGB(0, 91, 82, 82),
        content: AwesomeSnackbarContent(
          title: '',
          message: '${response!.errorMessage}',
          contentType: ContentType.warning,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  Future<void> login(BuildContext context, Map<String, dynamic> body) async {
    _isLoading = true;
    loginBody = body;
    _status = AuthStatus.authenticating;

    _authRepository
        .login(body)
        .then((value) => handleSessionResponse(context, value))
        .onError((error, StackTrace) => handleError(context, error.toString()));
  }

  void handleUserReponse(BuildContext context, UserResponse? response) {
    if (response != null) {
      user = response;
      firstName = response.username;
    }
  }

  Future<void> getUser(BuildContext context, String? key) async {
    return _authRepository
        .user(key)
        .then((value) => handleUserReponse(context, value));
  }

  Future saveAuthKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('key', key);
    notifyListeners();
  }
}
