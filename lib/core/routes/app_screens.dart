part of 'app_routes.dart';

class AppScreens {
  static const home = '/';
  static const login = '/login';
  static const addExpense = 'addExpense';
}

class AppWidgets {
  static Widget loginWidget(
    BuildContext context,
    GoRouterState state,
  ) =>
      const LoginScreen();

  static Widget homeWidget(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  static Widget addExpense(
    BuildContext context,
    GoRouterState state,
  ) => const ExpenseForm();
}
