import 'package:splendlens_fe/core/data/data.dart';
import 'package:splendlens_fe/core/repository/repository.dart';
import 'package:splendlens_fe/core/models/responses/user_response.dart';

class UserRepositoryImp implements UserRepository {
  final BaseApiService _apiService = NetworkApiService();
  @override
  Future<UserResponse?> getUser(String? key) async {
    try {
      dynamic response = await _apiService.get(ApiEndpoints().user, key!);

      return UserResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
