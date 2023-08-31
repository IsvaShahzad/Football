import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  ShowAlert() {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Email reset link has been sent!"),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF5DBB63),
                onPrimary: Colors.white,
                elevation: 3,
                minimumSize: const Size(150, 50),
                maximumSize: const Size(150, 50),
              ),
              child: Text(
                'OK',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/greeb_login.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: loginFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Icon(Icons.close, color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 90),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Football Club ⚽  \nForgot Password',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  Container(
                    height: 210,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.zero),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 12,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                            ),
                            Container(
                              child: TextFormField(
                                controller: emailController,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w600,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter Email',
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF707070),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xFF466d1d),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xFF466d1d),
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(8.0, 10.0, 5.0, 10.0),
                                ),
                                validator: (value) {
                                  RegExp regex = RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
                                  );
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Some Text';
                                  } else if (value.length > 20) {
                                    return 'Enter less than 20 characters';
                                  } else if (!regex.hasMatch(value)) {
                                    return 'Enter according to format';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF5DBB63),
                                    onPrimary: Colors.white,
                                    elevation: 11,
                                    minimumSize: const Size(160, 50),
                                    maximumSize: const Size(160, 50),
                                  ),
                                  child: Text(
                                    'Send Link',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (loginFormKey.currentState?.validate() ==
                                        true) {
                                      ShowAlert();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
