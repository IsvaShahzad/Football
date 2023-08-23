import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_football/InitialScreens/CaroselSliderScreen.dart';

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
            context, MaterialPageRoute(builder: (context) => CarouselScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Image.asset('assets/images/stadium.jpg')
    );
  }
}


