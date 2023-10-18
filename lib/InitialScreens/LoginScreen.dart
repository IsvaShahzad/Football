import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../MainScreens/HomeScreen.dart';
import 'ForgotPasswordScreen.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  final loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  late String email;
  late String password;
  late bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/greeb_login.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
            key: loginFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 165.0),
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Football Club ⚽\nLogin to Continue',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ),
                    Container(
                        height: 380,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.all(Radius.zero),
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
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 22.0),
                                    child: Text('Email',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                  ),
                                  Container(
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Colors.white.withOpacity(0.1),
                                        hintText: 'Enter Email',
                                        hintStyle: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                        // prefixIcon: Icon(Icons.email, color: Color(0xFF466d1d)),

                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color(0xFF466d1d)),
                                        ),
                                        // Customize the focused border
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color(0xFF466d1d)),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        RegExp regex = RegExp(
                                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter your Email ';
                                        } else if (!regex.hasMatch(value)) {
                                          return 'Enter according to format';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                  const Text('Password',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: TextFormField(
                                      controller: passwordController,
                                      obscureText: _isObscure,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Colors.white.withOpacity(0.1),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color(0xFF466d1d)),
                                        ),
                                        // Customize the focused border
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color(0xFF466d1d)),
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
                                      textInputAction: TextInputAction.next,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF000000),
                                          fontWeight: FontWeight.w600),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Your Password ';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: TextButton.styleFrom(
                                          primary: Color(0xFFF44336),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ForgotPasswordScreen()));
                                        }),
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
                                                        HomeScreen(),
                                              ),
                                            );
                                          }
                                        },

                                        child: Center(
                                          child: Text(
                                            'Login',
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('or',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.red,
                                        )),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account?"),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          SignUpScreen()));
                                        },
                                        child: Text(
                                          "Sign up",
                                          style: TextStyle(
                                            color: Colors
                                                .blue, // Sign up button color
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
