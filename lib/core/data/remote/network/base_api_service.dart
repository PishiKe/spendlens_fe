abstract class BaseApiService {
  final String baseUrl = const String.fromEnvironment('spendlens_base_url');

  Future<dynamic> login(String url, dynamic body);
}
