import 'dart:convert';
import 'dart:io';
import 'package:splendlens_fe/core/data/remote/remote.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
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
  Future login(String url, body) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: json.encode(body),
      );
      returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}
