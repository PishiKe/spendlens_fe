import 'package:flutter/material.dart';
import 'package:splendlens_fe/models/requests/login_model.dart';
import 'package:splendlens_fe/ui/screens/authentication/authentication_viewmodel.dart';
import 'package:splendlens_fe/utilities/utilities.dart';

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

  handleLogin(context, String? username, String? password) async {
    final loginModel = LoginModel(username: username, password: password);

    await _authenticationViewModel.login(context, loginModel.toJson());
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
    print(_authenticationViewModel.status);
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
                      color: const Color.fromARGB(255, 246, 105, 95),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => handleLogin(context,
                          _usernameController?.text, _passwordController?.text),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
