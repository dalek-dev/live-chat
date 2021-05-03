import 'package:chat_realtime/features/authentication/login/application/login_service.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/models/request/login_request.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/models/response/login_response.dart';
import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState>{
  final LoginService service;
  AuthCubit({required this.service}) : super(AuthInitial());

  void authentication(LoginRequest params) async {
    emit(AuthLoading());

    var failureOrSuccess =  await service.signIn(params);

    failureOrSuccess.fold(
            (failure) => emit(AuthError(message: (failure as GeneralFailure).message)),
            (success) => emit(AuthSuccess(response: success))
    );

  }

}