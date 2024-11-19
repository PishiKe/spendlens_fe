class LoginResponse {
  final bool isSuccess;
  final String? key;
  final String? errorMessage;
  LoginResponse({required this.isSuccess, this.key, this.errorMessage});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('key')) {
      return LoginResponse(
        isSuccess: true,
        key: json['key'],
      );
    } else if (json.containsKey('non_field_errors')) {
      return LoginResponse(
        isSuccess: false,
        errorMessage: json['non_field_errors'][0],
      );
    } else {
      return LoginResponse(
        isSuccess: false,
        errorMessage: 'Unknown error occurred',
      );
    }
  }

  Map<String, dynamic> toJson() {
    if (isSuccess) {
      return {'key': key};
    } else {
      return {
        'non_field_errors': [errorMessage]
      };
    }
  }
}
