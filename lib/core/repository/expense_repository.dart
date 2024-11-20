import 'package:splendlens_fe/core/models/models.dart';

abstract class ExpenseRepository {
  Future<void> createExpense(Expense body, String key);
  Future<void> getExpenses(String key);
}