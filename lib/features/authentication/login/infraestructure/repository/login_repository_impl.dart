import 'package:chat_realtime/features/authentication/login/domain/repository/login_repository.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/datasources/login_remote_data_sources.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/models/request/login_request.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/models/response/login_response.dart';
import 'package:chat_realtime/features/commons/core/errors/exceptions.dart';
import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository{
  final LoginRemoteDataSources remoteDataSource;
  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, LoginResponse>> signIn(LoginRequest params) async {
    try {
      var response = await remoteDataSource.login(params);
      return Right(response);
    } on GeneralException catch (e){
      return Left(GeneralFailure(message: e.message));
    }catch (_) {
      return Left(GeneralFailure());
    }
  }
}