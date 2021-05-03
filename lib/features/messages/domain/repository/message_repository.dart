import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:chat_realtime/features/messages/infraestructure/models/mensajes_response.dart';
import 'package:chat_realtime/features/messages/infraestructure/models/users_response.dart';
import 'package:dartz/dartz.dart';

abstract class MessageRepository{
  Future<Either<Failure, UsersResponse>> getUsers(String token);
  Future<Either<Failure, List<Mensaje>>> getChat( String uid, String token);
}