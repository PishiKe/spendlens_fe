import 'package:flutter/material.dart';
import 'package:splendlens_fe/models/requests/login_model.dart';
import 'package:splendlens_fe/ui/views/authentication/authentication_viewmodel.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationViewModel authenticationViewmodel = AuthenticationViewModel();

    final loginModel = LoginModel(username: 'pishi', password: 'pishi');

    handleLogin(context, body) async {
      await authenticationViewmodel.login(context, loginModel.toJson());
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  handleLogin(context, loginModel);
                },
                child: Text('Test'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
