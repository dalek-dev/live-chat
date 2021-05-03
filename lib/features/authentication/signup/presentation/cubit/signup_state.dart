part of 'signup_cubit.dart';

abstract class SignupState extends Equatable{
  const SignupState();
  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupLoading extends SignupState {}

class SignupError extends SignupState {
  final String message;

  SignupError({required this.message});
}

class SignupSuccess extends SignupState{
  final SignUpResponse response;
  SignupSuccess({required this.response});
}