import 'dart:convert';

import 'package:chat_realtime/config/strings.dart';
import 'package:chat_realtime/features/commons/core/errors/exceptions.dart';
import 'package:chat_realtime/features/messages/infraestructure/models/mensajes_response.dart';
import 'package:chat_realtime/features/messages/infraestructure/models/users_response.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class MessagesRemoteDataSource{
  Future<UsersResponse> getUsers(String token);
  Future<List<Mensaje>> getChat( String userId, String token );
}

@LazySingleton(as: MessagesRemoteDataSource)
class MessagesRemoteDataSourceImpl implements MessagesRemoteDataSource{

  final http.Client httpClient = http.Client();
  @override
  Future<UsersResponse> getUsers(String token) async {
    final http.Response response = await httpClient.get(
      Uri.parse('${UtilStrings.ENDPOINT}api/usuarios?desde=0'),
      headers: {
        'x-token': token
      },
    );
    if(response.statusCode == 200){
      var usersResponse = usersResponseFromJson(response.body);
      return usersResponse;
    }else if(response.statusCode == 400 || response.statusCode == 404 || response.statusCode == 401 || response.statusCode == 500 ){
      throw GeneralException(message: 'Ocurrio un problema, intentalo más tarde.');
    }else{
      throw GeneralException();
    }
  }

  @override
  Future<List<Mensaje>> getChat(String userId, String token) async {
    final http.Response response = await httpClient.get(
      Uri.parse('${UtilStrings.ENDPOINT}mensajes/$userId'),
      headers: {
        'x-token': token
      },
    );
    if(response.statusCode == 200){
      var msgResponse = mensajesResponseFromJson(response.body);
      return msgResponse.mensajes!;
    }else if(response.statusCode == 400 || response.statusCode == 404 || response.statusCode == 401 || response.statusCode == 500 ){
      throw GeneralException(message: 'Ocurrio un problema, intentalo más tarde.');
    }else{
      throw GeneralException();
    }
  }

}
