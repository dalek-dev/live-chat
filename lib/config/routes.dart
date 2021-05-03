import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chat_realtime/features/authentication/login/presentation/screens/login_screen.dart';
import 'package:chat_realtime/features/authentication/signup/presentation/screens/signup_data_screen.dart';
import 'package:chat_realtime/features/authentication/signup/presentation/screens/signup_email_screen.dart';
import 'package:chat_realtime/features/authentication/signup/presentation/screens/signup_password_screen.dart';
import 'package:chat_realtime/features/messages/presentation/screens/chat_main_screen.dart';
import 'package:chat_realtime/features/messages/presentation/screens/chat_room_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: LoginScreen, initial: true),
  AutoRoute(page: SignupEmailScreen),
  AutoRoute(page: SignupDataScreen),
  AutoRoute(page: SignupPasswordScreen),
  AutoRoute(page: ChatMainScreen),
  AutoRoute(page: ChatRoomScreen)
])
class $AppRouter{}