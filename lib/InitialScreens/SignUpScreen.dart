import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/footballcloud.jpg"),
                  fit: BoxFit.cover)),

          child: Scaffold(
              backgroundColor: Colors.transparent,
              // appBar: AppBar(
              //   elevation: 13,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.only(
              //           bottomRight: Radius.circular(12),
              //           bottomLeft: Radius.circular(12))),
              //   actions: <Widget>[
              //     IconButton(
              //         icon: Icon(
              //           Icons.logout,
              //           color: Colors.white,
              //         ),
              //         onPressed: () {
              //           Navigator.pushReplacement(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => LoginScreen()));
              //         }),
              //
              //   ],
              // ),

              body: Container(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 90.0),
                        child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign up Account ',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Container(
                        height: 578,
                        width: 370,
                        decoration: BoxDecoration(
                            color: Colors.white60,
                            border: Border.all(
                              color: Color(0xFF5DBB63),
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
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.green),
                                      ),
                                    ),
                                    validator: (value) {
                                      RegExp regex =
                                          RegExp(r'^\(\d{3}\) \d{3}\-\d{4}$');
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
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.green),
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
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.green),
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
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.green),
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
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF5DBB63),
                                      onPrimary: Colors.white,
                                      elevation: 8,
                                      minimumSize: const Size(200, 50),
                                      maximumSize: const Size(200, 50),
                                      shape: StadiumBorder(),
                                    ),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState?.validate() ==
                                          true) {
                                        // try {
                                        //   final newUser = await _auth.createUserWithEmailAndPassword(
                                        //     email: emailController.text,
                                        //     password: passwordController.text,
                                        //   );
                                        //
                                        //   final user = (await _auth.signInWithEmailAndPassword(
                                        //     email: emailController.text,
                                        //     password: passwordController.text,
                                        //   ))
                                        //       .user;
                                        //
                                        //   await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
                                        //     'id': user?.uid,
                                        //     'firstname': firstNameController.text,
                                        //     'lastname': lastNameController.text,
                                        //     'mobile': mobileController.text,
                                        //     'isAdmin': false,
                                        //     'isApproved': false,
                                        //     'email': user?.email,
                                        //   });
                                        //
                                        //   print(newUser);
                                        //
                                        //   Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(builder: (BuildContext context) => VerifyEmail()),
                                        //   );
                                        // } catch (e) {
                                        //   print(e);
                                        // }
                                      }
                                    },
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
