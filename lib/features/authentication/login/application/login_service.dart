import 'package:chat_realtime/features/authentication/login/domain/repository/login_repository.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/models/request/login_request.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/models/response/login_response.dart';
import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginService{
  final LoginRepository repository;
  LoginService({required this.repository});

  Future<Either<Failure, LoginResponse>> signIn(LoginRequest params) async {
    return repository.signIn(params);
  }

}