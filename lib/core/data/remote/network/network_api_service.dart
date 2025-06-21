import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splendlens_fe/core/data/remote/remote.dart';
import 'package:splendlens_fe/core/utilities/shared_prefs_utils.dart';

class NetworkApiService extends BaseApiService {
  final Map<String, dynamic> _allowedHeaders = {
    'Content-type': 'application/json',
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
  Future get(String url) async {
    try {
      final String key = await SharedPrefsUtils.readPrefStr('key');

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
  Future post(String url, Map<String, dynamic> body) async {
    try {
      final String? key = await SharedPrefsUtils.readPrefStr('key');
      Map<String, String> headers = {
        ..._allowedHeaders,
        if (key != null) 'Authorization': 'Token $key'
      };

      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: json.encode(body),
        headers: headers,
      );

      return returnResponse(response);
    } on SocketException catch (e) {
      throw FetchDataException("No Internet Connection ${e.message}");
    } catch (e) {
      throw FetchDataException("Something went wrong");
    }
  }
}
