part of 'app_routes.dart';

class AppScreens {
  static const login = '/';
  static const home = '/home';
  static const addExpense = '/addExpense';
  static const goals = '/goals';
  static const recurring = '/recurring';
  static const profile = '/profile';
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
  ) =>
      const ExpenseForm();

  static Widget goalsWidget(
    BuildContext context,
    GoRouterState state,
  ) =>
      const GoalsScreen();

  static Widget recurringWidget(
    BuildContext context,
    GoRouterState state,
  ) =>
      const RecurringScreen();

  static Widget profileWidget(
    BuildContext context,
    GoRouterState state,
  ) =>
      const ProfileScreen();
}
