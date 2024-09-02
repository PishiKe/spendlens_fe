import 'package:splendlens_fe/models/models.dart';

class LoginResponse implements DefaultResponse {
  @override
  late String message;

  @override
  late bool status;

  SessionData? data;

  LoginResponse({required this.status, required this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json['status'] ?? false,
        message: json['message'] ?? '',
        data: json['data'] != null ? SessionData.fromJson(json['data']) : null,
      );

  @override
  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data != null ? data!.toJson() : {},
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
