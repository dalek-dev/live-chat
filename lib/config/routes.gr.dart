// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../features/authentication/login/presentation/screens/login_screen.dart'
    as _i3;
import '../features/authentication/signup/presentation/screens/signup_data_screen.dart'
    as _i5;
import '../features/authentication/signup/presentation/screens/signup_email_screen.dart'
    as _i4;
import '../features/authentication/signup/presentation/screens/signup_password_screen.dart'
    as _i6;
import '../features/messages/presentation/screens/chat_main_screen.dart' as _i7;
import '../features/messages/presentation/screens/chat_room_screen.dart' as _i8;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.LoginScreen());
    },
    SignupEmailScreenRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.SignupEmailScreen());
    },
    SignupDataScreenRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.SignupDataScreen());
    },
    SignupPasswordScreenRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.SignupPasswordScreen());
    },
    ChatMainScreenRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.ChatMainScreen());
    },
    ChatRoomScreenRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.ChatRoomScreen());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginScreenRoute.name, path: '/'),
        _i1.RouteConfig(SignupEmailScreenRoute.name,
            path: '/signup-email-screen'),
        _i1.RouteConfig(SignupDataScreenRoute.name,
            path: '/signup-data-screen'),
        _i1.RouteConfig(SignupPasswordScreenRoute.name,
            path: '/signup-password-screen'),
        _i1.RouteConfig(ChatMainScreenRoute.name, path: '/chat-main-screen'),
        _i1.RouteConfig(ChatRoomScreenRoute.name, path: '/chat-room-screen')
      ];
}

class LoginScreenRoute extends _i1.PageRouteInfo {
  const LoginScreenRoute() : super(name, path: '/');

  static const String name = 'LoginScreenRoute';
}

class SignupEmailScreenRoute extends _i1.PageRouteInfo {
  const SignupEmailScreenRoute() : super(name, path: '/signup-email-screen');

  static const String name = 'SignupEmailScreenRoute';
}

class SignupDataScreenRoute extends _i1.PageRouteInfo {
  const SignupDataScreenRoute() : super(name, path: '/signup-data-screen');

  static const String name = 'SignupDataScreenRoute';
}

class SignupPasswordScreenRoute extends _i1.PageRouteInfo {
  const SignupPasswordScreenRoute()
      : super(name, path: '/signup-password-screen');

  static const String name = 'SignupPasswordScreenRoute';
}

class ChatMainScreenRoute extends _i1.PageRouteInfo {
  const ChatMainScreenRoute() : super(name, path: '/chat-main-screen');

  static const String name = 'ChatMainScreenRoute';
}

class ChatRoomScreenRoute extends _i1.PageRouteInfo {
  const ChatRoomScreenRoute() : super(name, path: '/chat-room-screen');

  static const String name = 'ChatRoomScreenRoute';
}
