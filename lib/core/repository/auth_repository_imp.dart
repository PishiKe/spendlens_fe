import 'package:splendlens_fe/core/data/data.dart';
import 'package:splendlens_fe/core/models/responses/login_response.dart';
import 'package:splendlens_fe/core/models/responses/user_response.dart';
import 'package:splendlens_fe/core/repository/auth_repository.dart';

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
      // print('Full Response: $response');

      // Convert the response to LoginResponse object
      return LoginResponse.fromJson(response);
    } catch (e) {
      print('Error during login: $e');
      rethrow; // Re-throw the exception to be handled elsewhere
    }
  }

  @override
  Future<UserResponse?> user(String? key) async {
    try {
      dynamic response = await _apiService.getUser(ApiEndpoints().user, key!);

      return UserResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
