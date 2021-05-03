import 'dart:io';

import 'package:chat_realtime/config/app_theme.dart';
import 'package:chat_realtime/features/authentication/login/login_store.dart';
import 'package:chat_realtime/features/commons/core/mixins/progress_overlay_mixin.dart';
import 'package:chat_realtime/features/commons/core/mixins/snack_mixin.dart';
import 'package:chat_realtime/features/commons/widgets/chat_message.dart';
import 'package:chat_realtime/features/messages/presentation/cubit/message_private_cubit.dart';
import 'package:chat_realtime/services/dependency_injector.dart';
import 'package:chat_realtime/services/socket_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> with TickerProviderStateMixin, ProgressOverlayMixin, SnacksMixin {

  final LoginStore _store = getIt<LoginStore>();
  late MessagePrivateCubit _cubit;
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  late SocketService socketService;

  bool isWriting = false;
  List<ChatMessage> _messages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cubit = getIt<MessagePrivateCubit>();
    socketService = Provider.of<SocketService>(context, listen: false);
    this.socketService.socket.on('mensaje-personal', _escucharMensaje );
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _cubit.messagePrivate(_store.usuario.uid!, _store.token!);
    });
  }
  void _escucharMensaje( dynamic payload ) {

    ChatMessage message = new ChatMessage(
      texto: payload['mensaje'],
      uid: payload['de'],
      animationController: AnimationController( vsync: this, duration: Duration(milliseconds: 300 )),
    );

    setState(() {
      _messages.insert(0, message);
    });

    message.animationController.forward();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,

      appBar: AppBar(
        centerTitle: false,
        backgroundColor: MyTheme.primaryColor,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              child: Text(_store.usuario.nombre!.substring(0,1)),
              backgroundColor: Colors.green.withOpacity(0.5),
            ),
            Column(
              children: [
                Text(_store.usuario.nombre!),
                Text(_store.usuario.online == true?'online':'offline', style: TextStyle(
                  color: MyTheme.greyColor[200]
                ),),
              ],
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: BlocProvider(
        create: (_) => _cubit,
        child: Column(
          children: [
            BlocListener<MessagePrivateCubit, MessagePrivateState>(
                child: SizedBox(),
                listener: (context, state){
              if(state is MessagePrivateLoading){
                showProgress(context);
              }else if(state is MessagePrivateError){
                hideProgress();
                showSnack(context: context, message: state.message);
              }else if(state is MessagePrivateSuccess){
                hideProgress();
                final history = state.response.map((m) => ChatMessage(
                  texto: m.mensaje!,
                  uid: m.de!,
                  animationController: new AnimationController(vsync: this, duration: Duration( milliseconds: 0))..forward(),
                ));
                setState(() {
                  _messages.insertAll(0, history);
                });
              }
            }),
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )
                ),
                padding: EdgeInsets.only(top: 20.0),
                child:ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _messages.length,
                  itemBuilder: (_, i) => _messages[i],
                  reverse: true,
                )
              ),
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: MyTheme.greyColor[200],
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: TextField(
                          onChanged: (texto){
                            setState(() {
                              if ( texto.trim().length > 0 ) {
                                isWriting = true;
                              } else {
                                isWriting = false;
                              }
                            });
                          },
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                              hintText: 'Escribe un mensaje ... ',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: MyTheme.greyColor[500]
                              )
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric( horizontal: 4.0 ),
                    child: Platform.isIOS
                        ? CupertinoButton(
                      child: Text('Enviar'),
                      onPressed: isWriting
                          ? () => _handleSubmit( _textController.text.trim() )
                          : null,
                    ) : Container(
                      margin: EdgeInsets.symmetric( horizontal: 4.0 ),
                      child: IconTheme(
                        data: IconThemeData( color: Colors.blue[400] ),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon( Icons.send ),
                          onPressed: isWriting
                              ? () => _handleSubmit( _textController.text.trim() )
                              : null,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto ) {

    if ( texto.length == 0 ) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      uid: _store.currentUser!.uid!,
      texto: texto,
      animationController: AnimationController(vsync: this, duration: Duration( milliseconds: 200 )),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() { isWriting = false; });

    this.socketService.emit('mensaje-personal', {
      'de': _store.currentUser!.uid!,
      'para': _store.usuario.uid!,
      'mensaje': texto
    });
  }

  @override
  void dispose() {
    for( ChatMessage message in _messages ) {
      message.animationController.dispose();
    }

    this.socketService.socket.off('mensaje-personal');
    super.dispose();
  }
}
