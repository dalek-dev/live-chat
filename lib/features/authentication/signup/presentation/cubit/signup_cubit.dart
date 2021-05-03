import 'package:chat_realtime/features/authentication/signup/application/signup_service.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/models/request/signup_request.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/models/response/signup_response.dart';
import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState>{
  final SignUpService service;
  SignupCubit({required this.service}) : super(SignupInitial());

  void signUp(SignUpRequest params) async {
    emit(SignupLoading());

    var failureOrSuccess =  await service.signUp(params);

    failureOrSuccess.fold(
            (failure) => emit(SignupError(message: (failure as GeneralFailure).message)),
            (success) => emit(SignupSuccess(response: success))
    );
  }

}