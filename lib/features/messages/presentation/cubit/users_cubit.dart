import 'package:chat_realtime/features/commons/core/errors/failures.dart';
import 'package:chat_realtime/features/messages/application/message_service.dart';
import 'package:chat_realtime/features/messages/infraestructure/models/users_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'users_state.dart';

@injectable
class UsersCubit extends Cubit<UsersState>{
  final MessageService service;
  UsersCubit({required this.service}) : super(UsersInitial());

  void getUsers(String token) async {
    emit(UsersLoading());

    var failureOrSuccess = await service.getUsers(token);

    failureOrSuccess.fold(
            (failure) => emit(UsersError(message: (failure as GeneralFailure).message)),
            (success) => emit(UsersSuccess(response: success)),
    );

  }

}