import 'dart:convert';
import 'dart:io';
import 'package:splendlens_fe/core/data/remote/remote.dart';
import 'package:http/http.dart' as http;

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
  Future<dynamic> login(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: json.encode(body),
        headers: {..._allowedHeaders},
      );

      // print('Response Status: ${response.statusCode}');
      // print('Response Headers: ${response.headers}');
      // print('Response Body: ${response.body}');

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future createExpense(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: json.encode(body),
        headers: {..._allowedHeaders},
      );

      return returnResponse(response);
    } on SocketException {
      throw FetchDataException();
    }
  }

  @override
  Future getUser(String url, String key) async {
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
}
