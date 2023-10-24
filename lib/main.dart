import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'InitialScreens/SplashScreen.dart';
import 'MainScreens/BookGround.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.init; // Initialize ScreenUtil
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookingData(

      ), // Provide an instance of BookingData
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          primarySwatch: Colors.green,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
            ),
          ),
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
