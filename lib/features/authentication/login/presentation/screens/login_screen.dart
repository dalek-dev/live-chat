import 'package:auto_route/auto_route.dart';
import 'package:chat_realtime/config/app_theme.dart';
import 'package:chat_realtime/config/routes.gr.dart';
import 'package:chat_realtime/features/authentication/login/infraestructure/models/request/login_request.dart';
import 'package:chat_realtime/features/authentication/login/login_store.dart';
import 'package:chat_realtime/features/authentication/login/presentation/cubit/auth_cubit.dart';
import 'package:chat_realtime/features/commons/core/mixins/progress_overlay_mixin.dart';
import 'package:chat_realtime/features/commons/core/mixins/snack_mixin.dart';
import 'package:chat_realtime/features/commons/sockets/presentation/cubit/connect_cubit.dart';
import 'package:chat_realtime/features/commons/widgets/button_deafult.dart';
import 'package:chat_realtime/services/dependency_injector.dart';
import 'package:chat_realtime/services/socket_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ProgressOverlayMixin, SnacksMixin {

  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool showPassword = true;
  final LoginStore _loginStore = getIt<LoginStore>();
  final AuthCubit _authCubit = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    final socketService = Provider.of<SocketService>(context);
    final _size = MediaQuery.of(context).size;
    final query = MediaQuery.of(context);
    return MediaQuery(
      data: query.copyWith(
          textScaleFactor: query.textScaleFactor.clamp(1.0, 1.4)
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          currentFocus.requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: MyTheme.primaryColor,
          body: MultiBlocProvider(
            providers: [
              BlocProvider(
              create: (_) => _authCubit,),

            ],
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child:  Column(
                children: [
                  BlocListener<AuthCubit, AuthState>(
                      child: SizedBox(),
                      listener: (context, state){
                        if(state is AuthLoading){
                          showProgress(context);
                        }else if(state is AuthError){
                          hideProgress();
                          showErrorSnack(context: context, message: state.message);
                        }else if(state is AuthSuccess){
                          hideProgress();
                          _loginStore.currentUser = state.response.usuario;
                          _loginStore.token = state.response.token;
                          socketService.connect();
                          AutoRouter.of(context).push(ChatMainScreenRoute());
                          print('exito');
                        }
                      }
                  ),
                  SizedBox(
                    height: _size.height * 0.48,
                    width: _size.width,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: _size.width * 0.1),
                        child: SvgPicture.asset('assets/images/main/login.svg'),
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.48,
                    width: _size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Iniciar Sesión', style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                          ),),
                          TextField(
                            controller: emailController,
                            onChanged: (value) {

                            },
                            inputFormatters: [
                            ],
                            decoration: InputDecoration(
                              labelText: 'Correo',
                              labelStyle: TextStyle(
                                  color: MyTheme.greyColor[200]
                              ),
                              contentPadding:
                              EdgeInsets.only(left: 12.0, right: 12.0, bottom: 11.0),
                              border: UnderlineInputBorder(borderSide: BorderSide(color: MyTheme.accentColor)),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyTheme.accentColor)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyTheme.accentColor)),
                            ),
                            autocorrect: false,
                            cursorColor: MyTheme.greyColor[200],
                            keyboardType: TextInputType.emailAddress,
                            style:
                            TextStyle(color: MyTheme.greyColor[200], fontWeight: FontWeight.normal),
                          ),
                          TextField(
                            controller: passController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if(value.length == 6){
                                currentFocus.unfocus();
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              labelStyle: TextStyle(
                                  color: MyTheme.greyColor[200]
                              ),
                              contentPadding:
                              EdgeInsets.only(left: 12.0, right: 12.0, bottom: 11.0),
                              border:UnderlineInputBorder(borderSide: BorderSide(color: MyTheme.accentColor)),
                              suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showPassword =! showPassword;
                                    });
                                  },
                                  child: Icon((showPassword)?Icons.visibility:Icons.visibility_off)
                              ),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyTheme.accentColor)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: MyTheme.accentColor)),
                            ),
                            obscureText: showPassword,
                            autocorrect: false,
                            keyboardType:  TextInputType.number,
                            maxLength: 6,

                            style:
                            TextStyle(color:  MyTheme.greyColor[200], fontWeight: FontWeight.normal),
                          ),
                         ButtonDefault(text: 'Continuar', onTap: (){
                          _authCubit.authentication(LoginRequest(email: emailController.text.trim(), password: passController.text.trim()));
                         },),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: MyTheme.greyColor[300],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.0,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: '¿Nuevo usuario?, '),
                                  TextSpan(
                                    text: 'Crear una cuenta',
                                    style: TextStyle(
                                      color: MyTheme.accentColor,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      AutoRouter.of(context).push(SignupEmailScreenRoute());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
