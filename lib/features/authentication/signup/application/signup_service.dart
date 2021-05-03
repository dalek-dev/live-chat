import 'package:chat_realtime/features/authentication/signup/domain/repository/signup_repository.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/models/request/signup_request.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/models/response/signup_response.dart';
import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpService{
  final SignUpRepository repository;
  SignUpService({required this.repository});
  Future<Either<Failure, SignUpResponse>> signUp(SignUpRequest params) async {
    return  await repository.signUp(params);
  }
}