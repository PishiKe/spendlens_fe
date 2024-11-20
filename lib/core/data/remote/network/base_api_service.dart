import 'package:splendlens_fe/core/models/models.dart';

abstract class BaseApiService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<dynamic> login(String url, Map<String, dynamic> body);
  Future<dynamic> getUser(String url, String key);
  Future<dynamic> createExpense(String url, Expense body, String key);
}
