import 'package:chat_realtime/features/messages/application/message_service.dart';
import 'package:chat_realtime/features/messages/infraestructure/models/mensajes_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:chat_realtime/features/commons/core/errors/failures.dart';

part 'message_private_state.dart';

@injectable
class MessagePrivateCubit extends Cubit<MessagePrivateState>{
  final MessageService service;
  MessagePrivateCubit({required this.service}) : super(MessagePrivateInitial());

  void messagePrivate(String uid, String token) async {
    emit(MessagePrivateLoading());

    var failureOrSuccess = await service.getChat(uid, token);

    failureOrSuccess.fold(
            (failure) => emit(MessagePrivateError(message: (failure as GeneralFailure).message)),
            (success) => emit(MessagePrivateSuccess(response: success))
    );
  }

}