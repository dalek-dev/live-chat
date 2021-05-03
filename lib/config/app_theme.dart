import 'package:flutter/material.dart';

class MyTheme{
  MyTheme._();

  static const Color primaryColor = Color(0xFFe1e8ed);
  static const Color accentColor = Color(0xFF0c0c0c);
  static const Color unreadChatBG = Color(0xFFEE1D1D);

  static const MaterialColor greyColor = MaterialColor(grey, <int, Color>{
    100: Color(grey),// Gray 1
    200: Color(0xFF828282), // Gray 2
    300: Color(0xFF4F4F4F), // Gray 3
    400: Color(0xFFBDBDBD), // Gray 4
    500: Color(0xFFE0E0E0), // Gray 6
    600: Color(0xFFC4C4C4), // Gray 5
  });
  static const int grey = 0xFF717171;
  static const errorBackground = Color(0xFFff0d25);


  static const TextStyle heading2 = TextStyle(
    color: MyTheme.accentColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5
  );

  static const TextStyle chatSenderName = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5
  );

  static const TextStyle bodyText1 = TextStyle(
    color: MyTheme.accentColor,
    fontSize: 14.0,
    letterSpacing: 1.2,
    fontWeight: FontWeight.w500
  );
  static const TextStyle bodyTextMessage = TextStyle(
    fontSize: 13,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w600
  );
  static const TextStyle bodyTextTime = TextStyle(
    color: MyTheme.accentColor,
    fontWeight: FontWeight.bold,
    fontSize: 11,
    letterSpacing: 1
  );
}