import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/splash_screen.dart';

void main() async {
  if (kIsWeb || defaultTargetPlatform == TargetPlatform.macOS) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.instance.webAndDesktopInitialize(
      appId: "1329834907365798",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.init; // Initialize ScreenUtil
  runApp(MyApp());
}

String prettyPrint(Map json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primarySwatch: Colors.green,
        inputDecorationTheme: const InputDecorationTheme(
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
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
