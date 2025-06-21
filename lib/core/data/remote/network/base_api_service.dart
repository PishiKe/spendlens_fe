abstract class BaseApiService {
  // final String baseUrl = 'http://10.0.2.2:8000';
  final String baseUrl = 'http://64.227.142.89:8000';

  Future post(String url, Map<String, dynamic> body);
  Future get(String url);
}
