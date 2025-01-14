import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splendlens_fe/core/data/remote/remote.dart';

class NetworkApiService extends BaseApiService {
  final Map<String, dynamic> _allowedHeaders = {
    'Content-type': 'application/json'
  };
  dynamic returnResponse(http.Response response) {
    dynamic responseJson = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 201:
        return responseJson;
      case 400:
        return responseJson;
      case 401:
      case 404:
        return responseJson;
      case 500:
      default:
        throw FetchDataException(
          'Error occured while communicating with'
          'the server with status code : ${response.statusCode}',
        );
    }
  }

  @override
  Future get(String url, String key) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl + url),
        headers: {..._allowedHeaders, 'Authorization': 'Token $key'},
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException();
    }
  }

  @override
  Future post(String url, Map<String, dynamic> body, String? key) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: json.encode(body),
        headers: {
          ..._allowedHeaders,
          key == null ? '' : 'Authorization': 'Token $key'
        },
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException();
    }
  }
}
