abstract class BaseApiService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future post(String url, Map<String, dynamic> body);
  Future get(String url);
}
