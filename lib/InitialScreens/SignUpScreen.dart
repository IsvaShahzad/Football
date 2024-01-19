import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../MainScreens/HomeScreen.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;

  final loginFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/greeb_login.jpeg"),
                  fit: BoxFit.cover)),

          child: Scaffold(
              backgroundColor: Colors.transparent,


              body: Container(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign up Account ',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Container(
                        height: 550,
                        // width: 370,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.transparent,
                              width: 1.5,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.zero),

                          boxShadow: [
                            BoxShadow(
                              color:
                              Colors.black.withOpacity(0.2), // Shadow color
                              spreadRadius: 2, // Spread radius
                              blurRadius: 12, // Blur radius
                              offset: Offset(
                                  0, 3), // Offset in (x,y) from the container
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 22.0),
                                  child: Text('First Name',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF000000),
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Container(
                                  child: TextFormField(
                                    // keyboardType: TextInputType.emailAddress,
                                    controller: firstNameController,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.1),
                                      hintText: 'Enter Your First name',
                                      hintStyle: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
                                      ),
                                      // Customize the focused border
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
                                      ),
                                    ),
                                    validator: (value) {
                                      RegExp regex =
                                          RegExp(r'^'
                                          r'\(\d{3}\) \d{3}\-\d{4}$');
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Some Text';
                                      } else if (value.length > 14) {
                                        return 'Enter less than 14 numbers';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Text('Last Name',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF000000),
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Container(
                                  child: TextFormField(
                                    // keyboardType: TextInputType.emailAddress,
                                    controller: lastNameController,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.1),
                                      hintText: 'Enter Your Last name',
                                      hintStyle: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
                                      ),
                                      // Customize the focused border
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
                                      ),
                                    ),
                                    validator: (value) {
                                      RegExp regex = RegExp(
                                          r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Some Text ';
                                      } else if (value.length > 20) {
                                        return 'Enter less than 20 numbers';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text('Email',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF000000),
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.1),
                                      hintText: 'Enter Email',
                                      hintStyle: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
                                      ),
                                      // Customize the focused border
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
                                      ),
                                    ),
                                    validator: (value) {
                                      RegExp regex = RegExp(
                                          r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Some Text ';
                                      } else if (!regex.hasMatch(value)) {
                                        return 'Enter according to format';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                ),
                                const Text('Password',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.bold,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.1),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
                                    ),
                                    // Customize the focused border
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
                                    ),
                                    hintText: ' Enter Password',
                                    hintStyle: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Some Text ';
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text('Mobile Number',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF000000),
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                ),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: mobileController,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.1),
                                      hintText: 'Enter Your Mobile number',
                                      hintStyle: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
                                      ),
                                      // Customize the focused border
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Color(0xFF466d1d)),
                                      ),
                                    ),
                                    validator: (value) {
                                      RegExp regex = RegExp(
                                          r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter your Mobile Number  ';
                                      } else if (value.length > 12) {
                                        return 'Enter less than 12 numbers';
                                      } else if (!regex.hasMatch(value))
                                        return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                        Color(0xFF5DBB63), // Button color
                                        onPrimary: Colors.white, // Text color
                                        minimumSize: const Size(180, 50),
                                        maximumSize: const Size(180, 50),
                                      ),
                                      onPressed: () async {
                                        if (loginFormKey.currentState!
                                            .validate()) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (BuildContext context) =>
                                                  LoginScreen(),
                                            ),
                                          );
                                        }
                                      },

                                      child: Center(
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
// Empty container as a placeholder
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        LoginScreen()));
                                      },
                                      child: Text('Already have an account?',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ))))),
    );
  }
}
