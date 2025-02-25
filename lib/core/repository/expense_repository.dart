import 'package:splendlens_fe/core/models/models.dart';

abstract class ExpenseRepository {
  Future<Expense> createExpense(Map<String, dynamic> body);
  Future<void> getExpenses(String key);
}
