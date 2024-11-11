import 'package:flutter/material.dart';
import 'package:splendlens_fe/models/responses/responses.dart';
import 'package:splendlens_fe/repository/repository.dart';
import 'package:splendlens_fe/utilities/shared_prefs_utils.dart';

class HomeViewModel with ChangeNotifier {
  final _userRepository = UserRepositoryImp();
  late UserResponse user;

  String? _firstName;
  String? get firstName => _firstName!;
  set firstName(newValue) {
    _firstName = newValue;
    notifyListeners();
  }

  void handleUserReponse(BuildContext context, UserResponse? response) {
    if (response != null) {
      user = response;
      firstName = user.username;
    }
  }

  Future<void> getUser(BuildContext context) async {
    final String key = await SharedPrefsUtils.readPrefStr('key');

    return _userRepository
        .getUser(key)
        .then((value) => handleUserReponse(context, value));
  }
}
