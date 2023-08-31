import 'dart:async';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Image.asset('assets/images/stadium.jpg')
    );
  }
}


