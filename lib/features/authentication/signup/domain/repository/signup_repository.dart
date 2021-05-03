import 'package:chat_realtime/features/authentication/signup/infraestructure/models/request/signup_request.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/models/response/signup_response.dart';
import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepository{
  Future<Either<Failure, SignUpResponse>> signUp(SignUpRequest params);
}