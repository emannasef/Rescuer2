import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> post(
      {required String url, Map<String, dynamic>? body, String? token}) async {
    String baseUrl = 'http://ahmedatef2000-001-site1.htempurl.com/api/';

    Map<String, String> headers = {
      'Accept': '*/*',
      'Content-Type': 'application/json'
    };

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer$token',
      });
    }

    http.Response response = await http.post(
      Uri.parse(baseUrl + url),
      body: jsonEncode(body),
      headers: headers,
    );

    print(response.body);

    return response.body;
  }
}
