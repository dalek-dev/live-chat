import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class GeneralFailure extends Failure {
  final String message;

  GeneralFailure({this.message = 'Ocurrió un problema, intenta nuevamente'});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}


class FormatFailure extends Failure {
  final String message;

  FormatFailure({this.message = 'Ocurrio un problema, intentalo más tarde.'});

  @override
  List<Object> get props => [message];

}