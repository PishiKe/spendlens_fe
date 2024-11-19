abstract class ExpenseRepository {
  Future<void> createExpense(String url, Map<String, dynamic> body);
}