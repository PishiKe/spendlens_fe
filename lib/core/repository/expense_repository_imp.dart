import 'package:splendlens_fe/core/data/data.dart';
import 'package:splendlens_fe/core/models/models.dart';
import 'package:splendlens_fe/core/repository/expense_repository.dart';

class ExpenseRepositoryImp implements ExpenseRepository {
  NetworkApiService networkApiService = NetworkApiService();

  @override
  Future<Expense> createExpense(Map<String, dynamic> body, String key) async {
    try {
      dynamic request =
          await networkApiService.post(ApiEndpoints().expenses, body, key);

      return Expense.fromJson(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Expense>> getExpenses(String key) async {
    try {
      dynamic request =
          await networkApiService.get(ApiEndpoints().expenses, key);

      List<Expense> expenses = (request as List<dynamic>)
          .map((expenseJson) => Expense.fromJson(expenseJson))
          .toList();

      return expenses;
    } catch (e) {
      rethrow;
    }
  }
}
