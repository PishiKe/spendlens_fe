import 'package:flutter/material.dart';
import 'package:splendlens_fe/models/responses/responses.dart';
import 'package:splendlens_fe/repository/repository.dart';

class HomeViewModel with ChangeNotifier {
  final _userRpo = UserRepositoryImp();
  late UserResponse user;

  String? _firstName;
  String? get firstName => _firstName!;
  set firstName(newValue) {
    _firstName = newValue;
    notifyListeners();
  }

  String? _key;
  String? get key => _key!;
  set key(newValue) {
    _key = newValue;
    notifyListeners();
  }

  void handleUserReponse(BuildContext context, UserResponse? response) {
    if (response != null) {
      debugPrint(response.toString());
      user = response;
      firstName = response.username;
    }
  }

  Future<void> getUser(BuildContext context, String? key) async {
    return _userRpo
        .getUser(key)
        .then((value) => handleUserReponse(context, value));
  }
}
