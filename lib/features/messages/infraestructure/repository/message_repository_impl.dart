import 'package:chat_realtime/features/commons/core/errors/exceptions.dart';
import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:chat_realtime/features/messages/domain/repository/message_repository.dart';
import 'package:chat_realtime/features/messages/infraestructure/infraestructure/messages_remote_data_source.dart';
import 'package:chat_realtime/features/messages/infraestructure/models/mensajes_response.dart';
import 'package:chat_realtime/features/messages/infraestructure/models/users_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MessageRepository)
class MessageRepositoryImpl implements MessageRepository{
  final MessagesRemoteDataSource remoteDataSource;
  MessageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UsersResponse>> getUsers(String token) async {
    try {
      var response = await remoteDataSource.getUsers(token);
      return Right(response);
    } on GeneralException catch (e){
      return Left(GeneralFailure(message: e.message));
    }catch (_) {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, List<Mensaje>>> getChat(String uid, String token) async {
    try {
      var response = await remoteDataSource.getChat(uid, token);
      return Right(response);
    } on GeneralException catch (e){
      return Left(GeneralFailure(message: e.message));
    }catch (_) {
      return Left(GeneralFailure());
    }
  }


}