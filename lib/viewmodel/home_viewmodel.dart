import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:splendlens_fe/core/models/responses/responses.dart';
import 'package:splendlens_fe/core/repository/repository.dart';
import 'package:splendlens_fe/core/utilities/shared_prefs_utils.dart';

class HomeViewModel with ChangeNotifier {
  final _userRepository = UserRepositoryImp();

  String? _username;
  String? get username => _username;

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
      notifyListeners();
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
        .onError((error, stackTrace) => handleError(context, error.toString()));
  }

  Future? addExpense (){
    return null;
  }
}
