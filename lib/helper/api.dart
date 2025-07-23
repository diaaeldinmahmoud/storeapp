import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Failed to load data from $url with status: ${response.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}',
      );
    }
  }

  Future<dynamic> put({
    required String url, // Enforces String type
    required dynamic body,
    required String? token,
  }) async {
    try {
      // Log URL type and value for debugging
      print('URL type: ${url.runtimeType}, value: $url');

      // Explicit type check
      if (url.runtimeType != String) {
        throw Exception(
          'URL must be a String, received type: ${url.runtimeType}, value: $url',
        );
      }

      // Validate URL
      if (url.isEmpty) {
        throw Exception('URL is empty');
      }

      Uri uri;
      try {
        uri = Uri.parse(url);
      } catch (e) {
        throw Exception('Invalid URL format: $url ($e)');
      }

      // Prepare headers
      Map<String, String> headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      // Encode body for application/x-www-form-urlencoded
      String encodedBody;
      if (body is Map) {
        encodedBody = body.entries
            .map(
              (e) =>
                  '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value.toString())}',
            )
            .join('&');
      } else {
        encodedBody = body.toString();
      }

      print('url = $url body = $encodedBody token = $token');

      // Make HTTP PUT request
      http.Response response = await http
          .put(uri, body: encodedBody, headers: headers)
          .timeout(
            Duration(seconds: 30),
            onTimeout: () {
              throw Exception('Request timed out');
            },
          );

      // Handle response
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
        return data;
      } else {
        throw Exception(
          'Error with status code ${response.statusCode}: ${response.body}',
        );
      }
    } catch (e) {
      throw Exception('Failed to make PUT request: $e');
    }
  }
}
