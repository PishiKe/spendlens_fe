abstract class DefaultResponse {
  late bool statusCode;
  late String message;

  Map<String, dynamic> toJson();
}
