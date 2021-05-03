import 'package:chat_realtime/features/authentication/login/login_store.dart';
import 'package:chat_realtime/services/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatMessage extends StatelessWidget {

  final String texto;
  final String uid;
  final AnimationController animationController;

  ChatMessage({
    Key? key,
    required this.texto,
    required this.uid,
    required this.animationController
  }) : super(key: key);

  final LoginStore _loginStore = getIt<LoginStore>();

  @override
  Widget build(BuildContext context) {


    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut ),
        child: Container(
          child: this.uid == _loginStore.usuario.uid
              ? _myMessage()
              : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
            right: 5,
            bottom: 5,
            left: 50
        ),
        child: Text( texto, style: TextStyle( color: Colors.white ), ),
        decoration: BoxDecoration(
            color: Color(0xff4D9EF6),
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }


  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
            left: 5,
            bottom: 5,
            right: 50
        ),
        child: Text( texto, style: TextStyle( color: Colors.black87 ), ),
        decoration: BoxDecoration(
            color: Color(0xffE4E5E8),
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}