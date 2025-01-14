
abstract class BaseApiService {
  final String baseUrl = 'http://127.0.0.1:8000';

  Future post(String url, Map<String, dynamic> body, String? key);
  Future get(String url, String key);
}
