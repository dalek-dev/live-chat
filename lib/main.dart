import 'package:chat_realtime/config/app_theme.dart';
import 'package:chat_realtime/config/routes.gr.dart';
import 'package:chat_realtime/services/dependency_injector.dart';
import 'package:chat_realtime/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Chat real time',
        theme: ThemeData(
          primaryColor: MyTheme.primaryColor,
          accentColor: MyTheme.accentColor,
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
      ),
    );
  }
}
