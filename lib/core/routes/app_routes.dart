import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splendlens_fe/view/view.dart';
part './app_screens.dart';

class AppRoutes {
  static final GoRouter _router = GoRouter(
      initialLocation: AppScreens.login,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            path: AppScreens.login,
            name: 'login',
            builder: AppWidgets.loginWidget),
        GoRoute(
            path: AppScreens.home, name: 'home', builder: AppWidgets.homeWidget)
      ]);

  static GoRouter get router => _router;
}
