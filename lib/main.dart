import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:splendlens_fe/ui/screens/home/home_screen.dart';
import 'package:splendlens_fe/utilities/utilities.dart';

import 'ui/ui.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
    ],
    child: const MyApp(),
  ));
}

final _router = GoRouter(initialLocation: '/login', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SpendLens',
      theme: AppTheme().appTheme,
      routerConfig: _router,
    );
  }
}
