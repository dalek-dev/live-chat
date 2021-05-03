import 'package:chat_realtime/features/authentication/login/infraestructure/models/request/login_request.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/models/response/login_response.dart';
import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository{
  Future<Either<Failure, LoginResponse>> signIn(LoginRequest params);
}