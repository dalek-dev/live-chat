import 'package:chat_realtime/config/strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'connect_state.dart';

@injectable
class ConnectCubit extends Cubit<ConnectState>{
  ConnectCubit() : super(ConnectInitial());
  late IO.Socket socket;
  void connectingToServer() async {
    emit(Connecting());
    this.socket = IO.io(UtilStrings.ENDPOINT, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
    });

    this.socket.on('connect', (_){emit(Online());});
    this.socket.on('disconnect',  (_){emit(Offline());});

  }

}