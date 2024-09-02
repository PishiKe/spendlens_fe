import 'package:flutter/material.dart';
import 'package:splendlens_fe/models/requests/login_model.dart';
import 'package:splendlens_fe/ui/views/authentication/authentication_viewmodel.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationViewmodel? authenticationViewmodel =
        AuthenticationViewmodel();

    final data = LoginModel(username: 'pishi', password: 'pishi');

    handleLogin(context, body) {
      authenticationViewmodel.login(context, body);
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  handleLogin(context, data);
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
