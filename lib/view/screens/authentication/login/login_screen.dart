import 'package:flutter/material.dart';
import 'package:splendlens_fe/view/screens/authentication/authentication.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: MediaQuery.of(context).size.height * 0.15,
              bottom: 16.0),
          child: Column(
            children: [
              Text('Hello Again!',
                  style: Theme.of(context).textTheme.headlineLarge),
              const Text(
                'Welcome back you\'ve \n been missed!',
                textAlign: TextAlign.center,
              ),
              const LoginForm(),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                    height: 8.0,
                    thickness: 1,
                    color: AppTheme().black,
                  ),
                  // const Text('Or continue with'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
