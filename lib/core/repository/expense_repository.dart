import 'package:splendlens_fe/core/models/models.dart';

abstract class ExpenseRepository {
  Future<Expense> createExpense(Map<String, dynamic> body);
  Future<List<Expense>> getExpenses(String key);
  Future<List<Expense>?> getExpensesByMonth(int userId, String month);
  Future<MontlyExpenseTotal> getMontlyTotalExpense(int userId);
}
