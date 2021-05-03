import 'package:auto_route/auto_route.dart';
import 'package:chat_realtime/config/app_theme.dart';
import 'package:chat_realtime/config/routes.gr.dart';
import 'package:chat_realtime/features/authentication/signup/infraestructure/models/request/signup_request.dart';
import 'package:chat_realtime/features/authentication/signup/presentation/cubit/signup_cubit.dart';
import 'package:chat_realtime/features/authentication/signup/signup_store.dart';
import 'package:chat_realtime/features/commons/core/mixins/progress_overlay_mixin.dart';
import 'package:chat_realtime/features/commons/core/mixins/snack_mixin.dart';
import 'package:chat_realtime/features/commons/widgets/button_deafult.dart';
import 'package:chat_realtime/services/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPasswordScreen extends StatefulWidget {
  @override
  _SignupPasswordScreenState createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> with ProgressOverlayMixin, SnacksMixin {
  late SignupCubit _cubit;
  final SignUpStore _signUpStore = getIt<SignUpStore>();
  final passwordController = TextEditingController();
  bool showPassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cubit = getIt<SignupCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final currentFocus = FocusScope.of(context);
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
          appBar: AppBar(
            title: Text('Ingresa tu contraseña', style: MyTheme.heading2,),
            centerTitle: true,
            leading: BackButton(
              color: MyTheme.greyColor[200],
            ),
            backgroundColor: MyTheme.primaryColor,
            elevation: 0.0,
          ),
          body: BlocProvider(
            create: (_) => _cubit,
            child: SizedBox(
              width: _size.width,
              height: _size.height,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
                  child: Column(
                    children: [
                      BlocListener<SignupCubit, SignupState>(
                          child: SizedBox(),
                          listener: (context, state){
                            if(state is SignupLoading){
                              showProgress(context);
                            }else if(state is SignupError){
                              hideProgress();
                              showErrorSnack(context: context, message: state.message);
                            }else if(state is SignupSuccess){
                              hideProgress();
                              showSnack(context: context, message: 'Se registro satisfactoriamente');
                              AutoRouter.of(context).pushAndPopUntil(LoginScreenRoute(), predicate: (Route<dynamic> route) => false,);
                              print('exito');
                            }
                          }
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: _size.height * 0.05),
                        child: TextField(
                          controller: passwordController,
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
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: _size.height * 0.3),
                        child: ButtonDefault(text: 'Aceptar', onTap: (){
                          if(passwordController.text.length == 0){
                          showSnack(context: context, message: 'Ingrese su correo');
                          }else {
                            _cubit.signUp(SignUpRequest(name: _signUpStore.name!,
                                email: _signUpStore.email!,
                                password: passwordController.text.trim(),
                                age: int.parse(_signUpStore.age!)));
                          }                },),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
