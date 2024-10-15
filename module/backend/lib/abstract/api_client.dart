import 'package:backend/enum/endpoint.dart';

abstract class ApiClient {
  Future<dynamic> get(EndPoint point, {Map<String, String>? headers});
  Future<dynamic> post(EndPoint point, {Map<String, String>? headers, dynamic body});
  Future<dynamic> put(EndPoint point, {Map<String, String>? headers, dynamic body});
  Future<dynamic> delete(EndPoint point, {Map<String, String>? headers});
}