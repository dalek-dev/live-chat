part of 'users_cubit.dart';

abstract class UsersState extends Equatable{
  const UsersState();
  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoading extends UsersState {}

class UsersError extends UsersState {
  final String message;

  UsersError({required this.message});
}

class UsersSuccess extends UsersState{
  final UsersResponse response;
  UsersSuccess({required this.response});
}