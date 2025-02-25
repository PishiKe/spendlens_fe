import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';
import 'package:splendlens_fe/core/data/response/auth_response.dart';
import 'package:splendlens_fe/core/models/requests/login_model.dart';
import 'package:splendlens_fe/viewmodel/authentication_viewmodel.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _usernameController, _passwordController;
  AuthenticationViewModel _authenticationViewModel = AuthenticationViewModel();
  bool obsecure = true;

  handleLogin(String? username, String? password) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final loginModel = LoginModel(username: username, password: password);

    await _authenticationViewModel.login(loginModel.toJson());

    if (_authenticationViewModel.status == AuthStatus.authenticated) {
      if (mounted) context.go('/');
    } else {
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color.fromARGB(0, 91, 82, 82),
        content: AwesomeSnackbarContent(
          title: 'Oh Snap!',
          message: _authenticationViewModel.errorMessage,
          contentType: ContentType.warning,
        ),
      );
      if (mounted) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _authenticationViewModel = AuthenticationViewModel();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController?.dispose();
    _passwordController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Username', border: OutlineInputBorder()),
              controller: _usernameController,
              validator: (value) => Validators.notEmpty(value, 'your username'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: obsecure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () => setState(() => obsecure = !obsecure),
                  )),
              controller: _passwordController,
              obscureText: obsecure,
              validator: (value) => Validators.notEmpty(value, 'your password'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(
              height: 16.0,
            ),
            _authenticationViewModel.isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: MaterialButton(
                      color: AppTheme().blue,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: AppTheme().white),
                      ),
                      onPressed: () => handleLogin(
                          _usernameController?.text, _passwordController?.text),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
