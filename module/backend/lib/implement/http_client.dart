import 'dart:convert';

import 'package:backend/enum/endpoint.dart';
import 'package:flutter/foundation.dart';

import '../abstract/api_client.dart';
import 'package:http/http.dart' as http;


class HttpClient implements ApiClient {
  final http.Client client;
  final String baseUrl;

  HttpClient({
    required this.baseUrl,
    http.Client? client,
  }) : client = client ?? http.Client();

  @override
  Future<dynamic> get(EndPoint point,{Map<String,String>? headers}) async {
    try {
      final url = '$baseUrl${point.point}';
      final response = await client.get(Uri.parse(url), headers: headers);
      //
      _checkResponse(response);
      //
      return _decodeResponse(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error http url: ${point.point} - $e');
      }
    }
    
  }

  @override
  Future<dynamic> post(EndPoint point,{Map<String,String>? headers, dynamic body} ) async {
    try {
      final url = '$baseUrl${point.point}';
      // Implement POST request logic here using the full URL
      final response = await client.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
      //
      _checkResponse(response);
      //
      return _decodeResponse(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error http url: ${point.point} - $e');
      }
    }
    
  }

  @override
  Future<dynamic> put(EndPoint point, {Map<String,String>? headers, dynamic body}) async {
    try {
      final url = '$baseUrl${point.point}';
      // Implement PUT request logic here using the full URL
      final response = await client.put(Uri.parse(url), body: jsonEncode(body));
      //
      _checkResponse(response);
      //
      return _decodeResponse(response);
    
    } catch (e) {
      if (kDebugMode) {
        print('Error http url: ${point.point} - $e');
      }
    }
  }

  @override
  Future<dynamic> delete(EndPoint point, {Map<String,String>? headers}) async {
    try {
      final url = '$baseUrl${point.point}';
      // Implement DELETE request logic here using the full URL
      final response = await client.delete(Uri.parse(url), headers: headers);
      //
      _checkResponse(response);
      //
      return _decodeResponse(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error http url: ${point.point} - $e');
      }
    }
  }


  void _checkResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Error: ${response.statusCode} - ${response.body}');
    }
  }

  dynamic _decodeResponse(http.Response response){
    try {
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception('Error decoding response: ${response.body}');
    }
  }
}