import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'CaroselSliderScreen.dart';
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
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Successfully logged in
        print("Logged in with Google: ${googleSignInAccount.displayName}");
      }
    } catch (error) {
      print("Google login error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/l.jpg"), fit: BoxFit.cover)),
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
                      padding: const EdgeInsets.only(top: 150.0),
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Football Club ⚽\nLogin to Continue',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    Container(
                        height: 500,
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            border: Border.all(
                              color: Color(0xFF97C1A9),
                              width: 1.5,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          borderSide: BorderSide(
                                              width: 3,
                                              color: Color(0xFF5DBB63)),
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
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
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
                                            primary: Color(0xFF5DBB63),
                                            onPrimary: Colors.white,
                                            elevation: 8,
                                            minimumSize: const Size(180, 50),
                                            maximumSize: const Size(180, 50),
                                            shape: StadiumBorder(),
                                          ),
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (loginFormKey.currentState
                                                    ?.validate() ==
                                                true) {
                                              //     try {
                                              //       final user = await _auth
                                              //           .signInWithEmailAndPassword(
                                              //         email: emailController.text,
                                              //         password:
                                              //         passwordController.text,
                                              //       );
                                              //       print(user);
                                              //       _showLoggedInSnackbar();
                                              //       // Navigate to the next screen only if the user is registered
                                              //       if (user != null) {
                                              //         Navigator.pushReplacement(
                                              //           context,
                                              //           MaterialPageRoute(
                                              //               builder: (BuildContext
                                              //               context) =>
                                              //                   ContinueAsScreen()),
                                              //         );
                                              //       }
                                              //     } catch (e) {
                                              //       print(e);
                                              // Display an error message to the user
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'User not found. Please check your email and password.'),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }
                                          }),
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                  ),
                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: ElevatedButton(
                                  //       style: ElevatedButton.styleFrom(
                                  //         primary: Color(0xFF5DBB63),
                                  //         onPrimary: Colors.white,
                                  //         shape: new RoundedRectangleBorder(
                                  //           borderRadius:
                                  //               new BorderRadius.circular(30.0),
                                  //         ),
                                  //         elevation: 8,
                                  //         minimumSize: const Size(180, 50),
                                  //         maximumSize: const Size(180, 50),
                                  //       ),
                                  //       child: Text('Sign Up',
                                  //           style: TextStyle(
                                  //             fontWeight: FontWeight.bold,
                                  //             fontSize: 18,
                                  //           )),
                                  //       onPressed: () async {
                                  //         // Navigator.pushReplacement(
                                  //         //     context,
                                  //         //     MaterialPageRoute(
                                  //         //         builder:
                                  //         //             (BuildContext context) =>
                                  //         //             Registration()));
                                  //       }),
                                  // ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton.icon(
                                      onPressed: () async {
                                        final result =
                                            await FacebookAuth.instance.login();

                                        if (result.status ==
                                            LoginStatus.success) {
                                          final accessToken =
                                              result.accessToken;
                                          // Use the accessToken for further actions
                                          print(
                                              "Logged in with Facebook: ${accessToken?.token}");
                                        } else if (result.status ==
                                            LoginStatus.cancelled) {
                                          print("Facebook login cancelled");
                                        } else {
                                          print("Facebook login error");
                                        }
                                      },
                                      icon: Image.asset(
                                        "assets/images/fb_icon.png",
                                        width: 24,
                                        height: 27,
                                      ),
                                      label: Text("Login with Facebook"),
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Colors.blue, // Facebook blue color
                                        onPrimary: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton.icon(
                                      onPressed: _loginWithGoogle,
                                      icon: Image.asset(
                                        "assets/images/google.png",
                                        width: 44,
                                        height: 24,
                                      ),
                                      label: Text("Login with Google"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(
                                            0xFF4cbb17), // Gmail red color
                                        onPrimary: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
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
