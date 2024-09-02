abstract class BaseApiService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future<dynamic> login(String url, dynamic body);
}
