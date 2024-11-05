abstract class BaseApiService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<dynamic> login(String url, Map<String, dynamic> body);
  Future<dynamic> getUser(String url, String key);
  Future<dynamic> createExpense(String url, Map<String, dynamic> body);
}
