import 'package:splendlens_fe/core/models/models.dart';

abstract class ExpenseRepository {
  Future<Expense> createExpense(Map<String, dynamic> body, String key);
  Future<void> getExpenses(String key);
}
