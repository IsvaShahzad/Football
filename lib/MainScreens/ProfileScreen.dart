import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_football/InitialScreens/LoginScreen.dart';
import 'package:project_football/MainScreens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

final _formKey = GlobalKey<FormState>();

late String _name = "";
late String _email = "";
late String _mobile = "";
late String _pincode = "";
late String _state = "";

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  String email = "";

  // final FocusNode myFocusNode = FocusNode();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  late XFile file;
  var _isLoading = false;
  ShowAlert() {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Profile updated! "),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFAB47BC),
                onPrimary: Colors.white,
                elevation: 3,
                minimumSize: const Size(150, 50),
                maximumSize: const Size(150, 50),
                shape: StadiumBorder(),
              ),
              child: Text('OK',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadSavedSellerProfile();
  }

  void loadSavedSellerProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      mobileController.text = prefs.getString('mobile') ?? '';
      pincodeController.text = prefs.getString('pincode') ?? '';
      stateController.text = prefs.getString('state') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0), // Set the AppBar's height to zero
            child: AppBar(
            ),
          ),
          body: Container(


            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/green_pastel.jpg"),
                    fit: BoxFit.cover)),
            child: Form(
              // color: Colors.white,
              child: new ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[

                      Positioned(
                        left: 10.0,
                        top: 5.0,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                          },
                        ),
                      ),
                      // new Container(
                      //   color: Colors.transparent,
                      //   child: new Column(
                      //     children: <Widget>[
                      //       Padding(
                      //         padding: EdgeInsets.only(top: 0.0),
                      //         child: new Stack(
                      //             fit: StackFit.loose,
                      //             children: <Widget>[
                      //               Padding(
                      //                   padding: EdgeInsets.only(
                      //                       top: 90.0, right: 100.0),
                      //                   child: new Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.center,
                      //                     children: <Widget>[],
                      //                   )),
                      //             ]),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      new Container(

                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                  ),
                                  child: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(top:100),
                                            child: new Text(
                                              'Personal Information',
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF357a38),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          _status
                                              ? _getEditIcon()
                                              : new Container(),
                                        ],
                                      )
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.only(top: 32),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 17),
                                  child: Container(
                                      height: 450,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.transparent,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.zero),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black
                                                .withOpacity(0.2), // Shadow color
                                            spreadRadius: 2, // Spread radius
                                            blurRadius: 12, // Blur radius
                                            offset: Offset(0,
                                                3), // Offset in (x, y) from the container
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 33.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      'Name',
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.bold,
                                                        color: Color(0xFF357a38),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Flexible(
                                                  child: TextFormField(
                                                    controller: nameController,
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: "Enter Your Name",
                                                    ),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    enabled: !_status,
                                                    autofocus: !_status,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Please enter your name';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) =>
                                                        _name = value!,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25.0,
                                                  right: 25.0,
                                                  top: 25.0),
                                              child: new Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  new Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      new Text(
                                                        'Email ID',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(0xFF357a38),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25.0,
                                                  right: 25.0,
                                                  top: 2.0),
                                              child: new Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  new Flexible(
                                                    child: new TextFormField(
                                                      controller: emailController,
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText:
                                                                  "Enter Email ID"),
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      enabled: !_status,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter your name';
                                                        }
                                                        return null;
                                                      },
                                                      onSaved: (value) =>
                                                          _email = value!,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25.0,
                                                  right: 25.0,
                                                  top: 25.0),
                                              child: new Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  new Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      new Text(
                                                        'Mobile',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(0xFF357a38),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25.0,
                                                  right: 25.0,
                                                  top: 2.0),
                                              child: new Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  new Flexible(
                                                    child: new TextFormField(
                                                      controller: mobileController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration: const InputDecoration(
                                                          hintText:
                                                              "Enter Mobile Number"),
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      enabled: !_status,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter your name';
                                                        }
                                                        return null;
                                                      },
                                                      onSaved: (value) =>
                                                          _mobile = value!,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25.0,
                                                  right: 25.0,
                                                  top: 25.0),
                                              child: new Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      child: new Text(
                                                        'Pin Code',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(0xFF357a38),
                                                        ),
                                                      ),
                                                    ),
                                                    flex: 2,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: new Text(
                                                        'State',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(0xFF357a38),
                                                        ),
                                                      ),
                                                    ),
                                                    flex: 2,
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 2.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10.0),
                                                    child: new TextFormField(
                                                      controller: pincodeController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                              hintText:
                                                                  "Enter Pin Code"),
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      enabled: !_status,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter your name';
                                                        }
                                                        return null;
                                                      },
                                                      onSaved: (value) =>
                                                          _pincode = value!,
                                                    ),
                                                  ),
                                                  flex: 2,
                                                ),
                                                Flexible(
                                                  child: new TextFormField(
                                                    controller: stateController,
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: "Enter State",
                                                    ),
                                                    enabled: !_status,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Please enter your name';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) =>
                                                        _state = value!,
                                                  ),
                                                  flex: 2,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              !_status ? _getActionButtons() : new Container(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }



  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF357a38),
                  onPrimary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  elevation: 5,
                  minimumSize: const Size(130, 50),
                  maximumSize: const Size(130, 50),
                ),
                child: new Text("Save"),
                // textColor: Colors.white,
                // color: Colors.green,is

                onPressed: saveSellerProfile,
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF357a38),
                  onPrimary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  elevation: 5,
                  minimumSize: const Size(130, 50),
                  maximumSize: const Size(130, 50),
                ),
                child: new Text("Cancel"),
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(top: 110),
        child: new CircleAvatar(
          backgroundColor: Colors.red,
          radius: 14.0,
          child: new Icon(
            Icons.edit,
            color: Colors.white,
            size: 16.0,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }



  void saveSellerProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', nameController.text);
      await prefs.setString('email', emailController.text);
      await prefs.setString('pincode', pincodeController.text);
      await prefs.setString('state', stateController.text);
      await prefs.setString('mobile', mobileController.text);

      print('Seller Profile data saved to Firestore');
      ShowAlert();
    } catch (e) {
      print('Error saving portfolio data: $e');
    }
  }
}
