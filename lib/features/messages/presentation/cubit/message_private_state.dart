part of 'message_private_cubit.dart';

abstract class MessagePrivateState extends Equatable{
  const MessagePrivateState();
  @override
  List<Object> get props => [];
}

class MessagePrivateInitial extends MessagePrivateState {
  @override
  List<Object> get props => [];
}

class MessagePrivateLoading extends MessagePrivateState {}

class MessagePrivateError extends MessagePrivateState {
  final String message;

  MessagePrivateError({required this.message});
}

class MessagePrivateSuccess extends MessagePrivateState{
  final List<Mensaje> response;
  MessagePrivateSuccess({required this.response});
}