part of 'connect_cubit.dart';

abstract class ConnectState extends Equatable{
  const ConnectState();
  @override
  List<Object> get props => [];
}

class ConnectInitial extends ConnectState {
  @override
  List<Object> get props => [];
}

class Connecting extends ConnectState {}

class Online extends ConnectState {}

class Offline extends ConnectState {}