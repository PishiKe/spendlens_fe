import 'package:splendlens_fe/core/data/data.dart';
import 'package:splendlens_fe/models/responses/login_response.dart';
import 'package:splendlens_fe/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<LoginResponse?> login(Map<String, dynamic> body) async {
    try {
      // Make the login request
      dynamic response = await _apiService.login(
        ApiEndpoints().login,
        body,
      );

      // Print the entire response for debugging
      print('Full Response: $response');

      // Convert the response to LoginResponse object
      return LoginResponse.fromJson(response);
    } catch (e) {
      print('Error during login: $e');
      rethrow; // Re-throw the exception to be handled elsewhere
    }
  }
}