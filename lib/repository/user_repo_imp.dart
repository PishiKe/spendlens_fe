import 'package:splendlens_fe/core/data/data.dart';
import 'package:splendlens_fe/repository/repository.dart';
import 'package:splendlens_fe/models/responses/user_response.dart';

class UserRepositoryImp implements UserRepository {
  final BaseApiService _baseApiService = NetworkApiService();
  @override
  Future<UserResponse?> getUser(String? key) async {
    try {
      dynamic response = _baseApiService.getUser(ApiEndpoints().user, key!);

      return UserResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
