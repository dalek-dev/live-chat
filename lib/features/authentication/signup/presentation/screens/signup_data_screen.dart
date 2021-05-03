import 'package:auto_route/auto_route.dart';
import 'package:chat_realtime/config/app_theme.dart';
import 'package:chat_realtime/config/routes.gr.dart';
import 'package:chat_realtime/features/authentication/signup/signup_store.dart';
import 'package:chat_realtime/features/commons/core/mixins/snack_mixin.dart';
import 'package:chat_realtime/features/commons/widgets/button_deafult.dart';
import 'package:chat_realtime/services/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupDataScreen extends StatefulWidget {
  @override
  _SignupDataScreenState createState() => _SignupDataScreenState();
}

class _SignupDataScreenState extends State<SignupDataScreen> with SnacksMixin {
  final SignUpStore _signUpStore = getIt<SignUpStore>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();

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
            title: Text('Ingresa tus datos', style: MyTheme.heading2,),
            centerTitle: true,
            leading: BackButton(
              color: MyTheme.greyColor[200],
            ),
            backgroundColor: MyTheme.primaryColor,
            elevation: 0.0,
          ),
          body: SizedBox(
            width: _size.width,
            height: _size.height,
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: _size.height * 0.05),
                      child: TextField(
                        controller: nameController,
                        onChanged: (value) {

                        },
                        decoration: InputDecoration(
                          labelText: 'Nombres',
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
                        keyboardType: TextInputType.text,
                        style:
                        TextStyle(color: MyTheme.greyColor[200], fontWeight: FontWeight.normal),
                      ),
                    ),
                    TextField(
                      controller: ageController,
                      onChanged: (value) {

                      },
                      decoration: InputDecoration(
                        labelText: 'Edad',
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
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      style:
                      TextStyle(color: MyTheme.greyColor[200], fontWeight: FontWeight.normal),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: _size.height * 0.3),
                      child: ButtonDefault(text: 'Continuar', onTap: (){
                        if(ageController.text.length == 0 || nameController.text.length == 0){
                        showSnack(context: context, message: 'Ingrese sus datos');
                        }else {
                          _signUpStore.name = nameController.text.trim();
                          _signUpStore.age = ageController.text.trim();
                          AutoRouter.of(context).push(SignupPasswordScreenRoute());
                        }
                      },),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
