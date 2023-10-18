import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'InitialScreens/SplashScreen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.init; // Initialize ScreenUtil
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primarySwatch: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
          // Customize the enabled border
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
          ),
          // Customize the focused border
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
          ),
        ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
