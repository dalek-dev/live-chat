import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:chat_realtime/features/messages/domain/repository/message_repository.dart';
import 'package:chat_realtime/features/messages/infraestructure/models/mensajes_response.dart';
import 'package:chat_realtime/features/messages/infraestructure/models/users_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MessageService{
  final MessageRepository repository;
  MessageService({required this.repository});

  Future<Either<Failure, UsersResponse>> getUsers(String token) async {
    return repository.getUsers(token);
  }

  Future<Either<Failure, List<Mensaje>>> getChat(String uid, String token) async {
    return repository.getChat(uid, token);
  }
}