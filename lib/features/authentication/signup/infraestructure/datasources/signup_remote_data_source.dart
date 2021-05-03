import 'dart:convert';

import 'package:chat_realtime/config/strings.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/models/request/signup_request.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/models/response/signup_response.dart';
import 'package:chat_realtime/features/commons/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class SignUpRemoteDataSource{
  Future<SignUpResponse> signUp(SignUpRequest params);
}

@LazySingleton(as: SignUpRemoteDataSource)
class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource{

  final http.Client httpClient = http.Client();

  @override
  Future<SignUpResponse> signUp(SignUpRequest params) async {
    final http.Response response = await httpClient.post(
      Uri.parse('${UtilStrings.ENDPOINT}api/login/new'),
      headers: {
        'Content-Type': UtilStrings.CONTENT_TYPE_JSON
      },
      body:json.encode(params.toJson()),
    );
    if(response.statusCode == 200){
      var signUpResponse = SignUpResponse.fromJson(json.decode(response.body));
      return signUpResponse;
    }else if(response.statusCode == 400 || response.statusCode == 404 || response.statusCode == 401 || response.statusCode == 500 ){
      var signUpResponse = SignUpResponse.fromJson(json.decode(response.body));
      throw GeneralException(message: 'Ocurrio un problema, intentalo más tarde.');
    }else{
      throw GeneralException();
    }
  }

}