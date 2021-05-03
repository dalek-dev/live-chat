import 'package:auto_route/auto_route.dart';
import 'package:chat_realtime/config/app_theme.dart';
import 'package:chat_realtime/config/routes.gr.dart';
import 'package:chat_realtime/features/authentication/login/login_store.dart';
import 'package:chat_realtime/features/commons/core/mixins/progress_overlay_mixin.dart';
import 'package:chat_realtime/features/commons/core/mixins/snack_mixin.dart';
import 'package:chat_realtime/features/messages/presentation/cubit/users_cubit.dart';
import 'package:chat_realtime/mocks/message_model.dart';
import 'package:chat_realtime/services/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMainScreen extends StatefulWidget {
  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> with ProgressOverlayMixin, SnacksMixin {

  late UsersCubit _cubit;
  final LoginStore _store = getIt<LoginStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cubit = getIt<UsersCubit>();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _cubit.getUsers(_store.token!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,

      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){}
            ),
        centerTitle: true,
        backgroundColor: MyTheme.primaryColor,
        title: Text('Live Chat', style: MyTheme.heading2),
        elevation: 0.0,
      ),
      body: BlocProvider(
        create: (_) => _cubit,
        child: Column(
          children: [
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
                child: BlocConsumer<UsersCubit, UsersState>(
                  listener: (context, state){
                    if(state is UsersLoading){
                      showProgress(context);
                    }else if(state is UsersError){
                      hideProgress();
                      showSnack(context: context, message: state.message);
                    }else if(state is UsersSuccess){
                      hideProgress();
                    }
                  },
                  builder: (context, state){
                     if(state is UsersSuccess){
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){
                              _store.usuario = state.response.usuarios![index];
                              AutoRouter.of(context).push(ChatRoomScreenRoute());
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20.0,
                                child: Text(state.response.usuarios![index].nombre!.substring(0,1)),
                                backgroundColor: (index % 2 == 0)?Colors.amberAccent.withOpacity(0.5):Colors.deepPurpleAccent.withOpacity(0.5),
                              ),
                              title: Text(state.response.usuarios![index].nombre!, style: TextStyle(
                                  fontWeight: FontWeight.bold ,
                                  fontSize: 16.0
                              ),),
                              subtitle: Row(
                                children: [
                                  Icon(Icons.done_all),
                                  Text(allChats[index].text!, style: TextStyle(
                                      fontSize: 12.0
                                  ),)
                                ],
                              ),
                              trailing: Container(
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (state.response.usuarios![index].online!)?Colors.green:Colors.red,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: state.response.usuarios!.length,
                      );
                     }else{
                       return Container();
                     }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
