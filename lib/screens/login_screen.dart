import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './home_screen.dart';
import './forgot_password_screen.dart';
import './signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
  //
  // Future<void> _loginWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();
  //
  //     if (googleSignInAccount != null) {
  //       // Successfully logged in
  //       print("Logged in with Google: ${googleSignInAccount.displayName}");
  //     }
  //   } catch (error) {
  //     print("Google login error: $error");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
                    const Padding(
                      padding: EdgeInsets.only(top: 165.0),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.zero),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 101, 101, 101)
                                  .withOpacity(0.2), // Shadow color
                              spreadRadius: 2, // Spread radius
                              blurRadius: 12, // Blur radius
                              offset: const Offset(
                                  0, 3), // Offset in (x,y) from the container
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 22.0),
                                    child: Text('Email',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.1),
                                      hintText: 'Enter Email',
                                      hintStyle: const TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                      // prefixIcon: Icon(Icons.email, color: Color(0xFF466d1d)),

                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Color(0xFF466d1d)),
                                      ),
                                      // Customize the focused border
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Color(0xFF466d1d)),
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
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                  ),
                                  const Text('Password',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
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
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color(0xFF466d1d)),
                                        ),
                                        // Customize the focused border
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: Color(0xFF466d1d)),
                                        ),
                                        hintText: ' Enter Password',
                                        hintStyle: const TextStyle(
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
                                      style: const TextStyle(
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
                                      style: TextButton.styleFrom(
                                        foregroundColor:
                                            const Color(0xFFF44336),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPasswordScreen()));
                                      },
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF5DBB63),
                                            foregroundColor: Colors.white,
                                            elevation: 8,
                                            minimumSize: const Size(180, 50),
                                            maximumSize: const Size(180, 50),
                                          ),
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (loginFormKey.currentState!
                                                .validate()) {
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
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        HomeScreen()),
                                              );
                                              //       }
                                              //     } catch (e) {
                                              //       print(e);
                                              // Display an error message to the user
                                              // ScaffoldMessenger.of(context)
                                              //     .showSnackBar(
                                              //   SnackBar(
                                              //     content: Text(
                                              //         'User not found. Please check your email and password.'),
                                              //     backgroundColor: Colors.red,
                                              //   ),
                                              // );
                                            }
                                          }),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Text('or',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.red,
                                        )),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 5.0),
                                  // ),
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
                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: ElevatedButton.icon(
                                  //     onPressed: () async {
                                  //       final result =
                                  //           await FacebookAuth.instance.login();
                                  //
                                  //       if (result.status ==
                                  //           LoginStatus.success) {
                                  //         final accessToken =
                                  //             result.accessToken;
                                  //         // Use the accessToken for further actions
                                  //         print(
                                  //             "Logged in with Facebook: ${accessToken?.token}");
                                  //       } else if (result.status ==
                                  //           LoginStatus.cancelled) {
                                  //         print("Facebook login cancelled");
                                  //       } else {
                                  //         print("Facebook login error");
                                  //       }
                                  //     },
                                  //     icon: Image.asset(
                                  //       "assets/images/fb_icon.png",
                                  //       width: 24,
                                  //       height: 27,
                                  //     ),
                                  //     label: Text("Login with Facebook"),
                                  //     style: ElevatedButton.styleFrom(
                                  //       primary:
                                  //           Colors.blue, // Facebook blue color
                                  //       onPrimary: Colors.white,
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 5.0),
                                  // ),
                                  // Align(
                                  //   alignment: Alignment.center,
                                  //   child: ElevatedButton.icon(
                                  //     onPressed: _loginWithGoogle,
                                  //     icon: Image.asset(
                                  //       "assets/images/google.png",
                                  //       width: 44,
                                  //       height: 24,
                                  //     ),
                                  //     label: Text("Login with Google"),
                                  //     style: ElevatedButton.styleFrom(
                                  //       primary: Color(
                                  //           0xFF4cbb17), // Gmail red color
                                  //       onPrimary: Colors.white,
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 5.0),
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Don't have an account?"),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          SignUpScreen()));
                                        },
                                        child: const Text(
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
