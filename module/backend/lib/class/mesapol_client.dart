import 'package:backend/const/api_url.dart';
import 'package:backend/const/header.dart';
import 'package:backend/enum/endpoint.dart';

import '../implement/http_client.dart';

class MesapolAuthClient extends HttpClient{
  //
  MesapolAuthClient() : super(baseUrl: Mesapol_URL);

  Future<dynamic> login(String username, String password) async {
    final response = await post(
      EndPoint.login, 
      body: {
        'username': username,
        'password': password,
      },
      headers: defautHeaders,
    );
    return response;
  }

  Future<dynamic> register(String username, String password) async {
    final response = await post(
      EndPoint.register,
      body: {
      'username': username,
      'password': password,
      },
      headers: defautHeaders,
    );
    return response;
  }

}