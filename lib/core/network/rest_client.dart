import 'dart:convert';

import 'package:http/http.dart' as http;

/// It handles all the REST service communication by establishing connection
/// with the remote server and parsing the response body into the data type of [T]
/// It provides all the http methods like GET, POST, PUT, DELETE, etc.
class RestClient<T> {
  final String baseUrl;

  RestClient({required this.baseUrl});

  /// It handles the REST call which has the method type [http.get]
  Future<T> get(String endpoint, T Function(dynamic) fromJson) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return processWithResponse(response, fromJson);
  }

  /// It handles the REST call which has the method type [http.post]
  Future<T> post(
      String endpoint, dynamic data, T Function(dynamic) fromJson) async {
    final response = await http.post(Uri.parse('$baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    return processWithResponse(response, fromJson);
  }

  /// It handles [response] and convert it as POJO as type of [T]
  T processWithResponse(response, T Function(dynamic) fromJson) {
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return fromJson(jsonData);
    } else {
      throw Exception("Failed to load");
    }
  }
}
