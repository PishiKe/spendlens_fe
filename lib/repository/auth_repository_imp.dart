import 'package:splendlens_fe/core/data/data.dart';
import 'package:splendlens_fe/models/responses/login_response.dart';
import 'package:splendlens_fe/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final BaseApiService _apiService = NetworkApiService();
  @override
  Future<LoginResponse?> login(body) async {
    try {
      dynamic response = await _apiService.login(
        ApiEndpoints().login,
        body,
      );
      print(response);
      return LoginResponse.fromJson(response);
    } catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }
}
