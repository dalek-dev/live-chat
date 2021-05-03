import 'package:chat_realtime/features/authentication/signup/domain/repository/signup_repository.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/datasources/signup_remote_data_source.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/models/request/signup_request.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/models/response/signup_response.dart';
import 'package:chat_realtime/features/commons/core/errors/exceptions.dart';
import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository{
  final SignUpRemoteDataSource remoteDataSource;
  SignUpRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, SignUpResponse>> signUp(SignUpRequest params) async {
    try {
      var response = await remoteDataSource.signUp(params);
      return Right(response);
    } on GeneralException catch (e){
      return Left(GeneralFailure(message: e.message));
    }catch (_) {
      return Left(GeneralFailure());
    }
  }

}