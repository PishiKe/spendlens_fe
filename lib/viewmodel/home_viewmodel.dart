import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:splendlens_fe/models/responses/responses.dart';
import 'package:splendlens_fe/repository/repository.dart';
import 'package:splendlens_fe/utilities/shared_prefs_utils.dart';

class HomeViewModel with ChangeNotifier {
  final _userRepository = UserRepositoryImp();

  String? _username;
  String? get username => _username;
  set username(String? newValue) {
    _username = newValue;
    notifyListeners();
  }

  String? _firstName;
  String get firstName => _firstName!;
  set firstName(String? newFirstName) {
    _firstName = newFirstName;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
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

  void handleUserReponse(BuildContext context, UserResponse? response) {
    if (response != null) {
      _username = response.username;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getUser(BuildContext context) async {
    final String key = await SharedPrefsUtils.readPrefStr('key');

    _isLoading = true;
    notifyListeners();

    return _userRepository
        .getUser(key)
        .then((value) => handleUserReponse(context, value))
        .onError((error, StackTrace) => handleError(context, error.toString()));
  }
}
