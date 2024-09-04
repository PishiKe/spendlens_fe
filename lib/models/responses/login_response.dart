import 'package:splendlens_fe/models/models.dart';

class LoginResponse implements DefaultResponse {
  @override
  String message;

  @override
  bool statusCode;
  SessionData? body;

  LoginResponse({required this.statusCode, required this.message, this.body});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        statusCode: json['statusCode'] ?? false,
        message: json['message'] ?? '',
        body: json['body'] != null ? SessionData.fromJson(json['body']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'status': statusCode,
        'message': message,
        'body': body != null ? body!.toJson() : {},
      };
}

class SessionData {
  SessionData({
    this.key,
  });

  String? key;

  factory SessionData.fromJson(Map<String, dynamic> json) => SessionData(
        key: json['key'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'key': key,
      };
}
