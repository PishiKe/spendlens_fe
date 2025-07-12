import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splendlens_fe/core/utilities/utilities.dart';
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
        builder: AppWidgets.loginWidget,
      ),
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: const BottomNavbar(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppTheme().lightBlue,
              shape: const CircleBorder(),
              elevation: 0,
              child: Icon(
                Icons.add,
                color: AppTheme().white,
              ),
              onPressed: () => context.go('/addExpense'),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
        routes: [
          GoRoute(
            path: AppScreens.home,
            name: 'home',
            builder: AppWidgets.homeWidget,
          ),
          GoRoute(
            path: AppScreens.addExpense,
            name: 'addExpense',
            builder: AppWidgets.addExpense,
          ),
          GoRoute(
            path: AppScreens.goals,
            name: 'goals',
            builder: AppWidgets.goalsWidget,
          ),
          GoRoute(
            path: AppScreens.recurring,
            name: 'recurring',
            builder: AppWidgets.recurringWidget,
          ),
          GoRoute(
            path: AppScreens.profile,
            name: 'profile',
            builder: AppWidgets.profileWidget,
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
