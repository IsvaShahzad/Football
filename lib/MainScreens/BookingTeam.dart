import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_football/MainScreens/HomeScreen.dart';
import 'package:intl/intl.dart';
import '../Widgets/ProfileWidgets.dart';

class BookTeam extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

final _formKey = GlobalKey<FormState>();

late String _name = "";
late String _email = "";
late String _mobile = "";
late String _pincode = "";
late String _state = "";


List<String> categoryOptions = [
  'Ayub Park',
  'Orchard DHA-1',
  'Giga Mall Complex',
  'DHA-1 Sector E',
];

List<String> hoursOptions = [
  '11:00-12:30',
  '2:00-3:30',
  '5:00-6:30',
  '8:00-9:30',
  '10:00-11:30',
  '1:00-2:30',
];
late String _selectedValue;
late String _selectedHours;



class MapScreenState extends State<BookTeam>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  String email = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController groundController = TextEditingController();
  final TextEditingController hoursController = TextEditingController();
  TextEditingController dateinput = TextEditingController();


  late XFile file;

  void toggleStatus() {
    setState(() {
      _status = !_status; // Toggle _status
    });
  }

  void ShowAlert() {
    BookingAlert.showBookingAlert(context, () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BookTeam()));
      resetForm();
    });
  }
  void resetForm() {
    // Reset the form fields or variables to their initial state
    nameController.text = "";
    hoursController.text = "";
    dateinput.text= "";
    groundController.text = "";
  }


  @override
  void initState() {
    super.initState();
    _selectedValue = categoryOptions[0];
    _selectedHours = hoursOptions[0];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize:
            Size.fromHeight(0), // Set the AppBar's height to zero
            child: AppBar(),
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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                        ),
                      ),
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
                                            padding: EdgeInsets.only(top: 70),
                                            child: new Text(
                                              'Book Your Ground',
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF357a38),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.only(top: 28),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 17),
                                  child: Container(
                                      height: 500,
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
                                            color: Colors.black.withOpacity(
                                                0.1), // Shadow color
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
                                                left: 25.0,
                                                right: 25.0,
                                                top: 33.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      'Name',
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color:
                                                        Color(0xFF357a38),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0,
                                                right: 25.0,
                                                top: 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Flexible(
                                                  child: TextFormField(
                                                    controller: nameController,
                                                    decoration:
                                                    const InputDecoration(
                                                      hintText:
                                                      "Enter Your Name",
                                                    ),
                                                    textInputAction:
                                                    TextInputAction.next,
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
                                            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text(
                                                      'Select Ground /Field',
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
                                            padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: 270, // Set the width to the desired value
                                                        child: DropdownButtonFormField(
                                                          value: _selectedValue,
                                                          items: categoryOptions.map((category) {
                                                            return DropdownMenuItem(
                                                              value: category,
                                                              child: Text(category),
                                                            );
                                                          }).toList(),
                                                          decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.white.withOpacity(0.1),
                                                            contentPadding: const EdgeInsets.symmetric(
                                                              vertical: 15,
                                                              horizontal: 10.0,
                                                            ),
                                                            hintStyle: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors.grey,
                                                            ),
                                                            border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(Radius.circular(4)),
                                                              borderSide: BorderSide(width: 1, color: Colors.orange),
                                                            ),
                                                          ),
                                                          onChanged: (selectedCategory) {
                                                            setState(() {
                                                              _selectedValue = selectedCategory.toString();
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    ],
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
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: <Widget>[
                                                      new Text(
                                                        'Hours booked',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color:
                                                          Color(0xFF357a38),
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
                                                  SizedBox(
                                                    width: 270, // Set the width to the desired value
                                                    child: DropdownButtonFormField(
                                                      value: _selectedHours,
                                                      items: hoursOptions.map((hours) {
                                                        return DropdownMenuItem(
                                                          value: hours,
                                                          child: Text(hours),
                                                        );
                                                      }).toList(),
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: Colors.white.withOpacity(0.1),
                                                        contentPadding: const EdgeInsets.symmetric(
                                                          vertical: 15,
                                                          horizontal: 10.0,
                                                        ),
                                                        hintStyle: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.grey,
                                                        ),
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                                          borderSide: BorderSide(width: 1, color: Colors.orange),
                                                        ),
                                                      ),
                                                      onChanged: (selectedHours) {
                                                        setState(() {
                                                          _selectedHours = selectedHours.toString();
                                                        });
                                                      },
                                                    ),
                                                  )
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
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: <Widget>[
                                                      new Text(
                                                        'Select Date',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color:
                                                          Color(0xFF357a38),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 0),
                                            child: SizedBox(
                                              width: 275,
                                              child: TextFormField(
                                                controller: dateinput,
                                                decoration: InputDecoration(
                                                  labelText: "",
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  hintText: ' ',
                                                  prefixIcon: Padding(
                                                    padding: const EdgeInsets.only(top: 10),
                                                    child: Icon(
                                                      Icons.calendar_today,
                                                      // Adjust the icon's size and color as needed
                                                      size: 24,
                                                      color: Colors.grey, // Change the color to your desired color
                                                    ),
                                                  ),
                                                ),
                                                readOnly: true,
                                                  onTap: () async {
                                                    DateTime? pickedDate = await showDatePicker(
                                                        context: context,
                                                        initialDate: DateTime.now(),
                                                        firstDate: DateTime(1950),
                                                        //DateTime.now() - not to allow to choose before today.
                                                        lastDate: DateTime(2100));

                                                    if (pickedDate != null) {
                                                      print(
                                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                      String formattedDate =
                                                      DateFormat('dd-MM-yyyy').format(pickedDate);
                                                      print(
                                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                                      setState(() {
                                                        dateinput.text =
                                                            formattedDate; //set output date to TextField value.
                                                      });
                                                    } else {}
                                                  ;
                                                },
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFF000000),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Please Enter Some Text ';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 25),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary:
                                                  Color(0xFF5DBB63), // Button color
                                                  onPrimary: Colors.white, // Text color
                                                  minimumSize: const Size(150, 45),
                                                  maximumSize: const Size(150, 45),
                                                ),
                                                onPressed: () async {
                                                  ShowAlert();
                                                },

                                                child: Center(
                                                  child: Text(
                                                    'Book now',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      )),
                                ),
                              ),
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

}

