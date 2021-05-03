import 'dart:convert';

import 'package:chat_realtime/config/strings.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/models/request/login_request.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/models/response/login_response.dart';
import 'package:chat_realtime/features/commons/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDataSources{
  Future<LoginResponse> login(LoginRequest params);
}

@LazySingleton(as: LoginRemoteDataSources)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSources{

  final http.Client httpClient = http.Client();

  @override
  Future<LoginResponse> login(LoginRequest params) async {
    final http.Response response = await httpClient.post(
      Uri.parse('${UtilStrings.ENDPOINT}api/login'),
      headers: {
        'Content-Type': UtilStrings.CONTENT_TYPE_JSON
      },
      body:json.encode(params.toJson()),
    );
    if(response.statusCode == 200){
      var signInResponse = loginResponseFromJson(response.body);
      return signInResponse;
    }else if(response.statusCode == 400 || response.statusCode == 404 || response.statusCode == 401 || response.statusCode == 500 ){
      throw GeneralException(message: 'Ocurrio un problema, intentalo más tarde.');
    }else{
      throw GeneralException();
    }

  }

}

