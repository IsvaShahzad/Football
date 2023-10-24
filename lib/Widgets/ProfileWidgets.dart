import 'package:flutter/material.dart';

import '../MainScreens/BookGround.dart';

class ProfileWidgets extends StatefulWidget {
  final VoidCallback onEditPressed;

  ProfileWidgets({required this.onEditPressed, required Null Function() onSavePressed, required Null Function() onCancelPressed});

  @override
  State<ProfileWidgets> createState() => _ProfileWidgetsState();
}

class _ProfileWidgetsState extends State<ProfileWidgets> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(top: 110),
        child: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 14.0,
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 16.0,
          ),
        ),
      ),
      onTap: widget.onEditPressed,
    );
  }
}

class ProfileAlert {
  static void showProfileUpdatedAlert(BuildContext context, Function onOKPressed) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Profile updated!"),
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
              child: Text('OK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              onPressed: () {
                Navigator.of(context).pop();
                onOKPressed();
              },
            ),
          )
        ],
      ),
    );
  }
}


class BookingAlert {
  static void showBookingAlert(BuildContext context, Function onOKPressed) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Booking Successful!"),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                elevation: 3,
                minimumSize: const Size(150, 50),
                maximumSize: const Size(150, 50),
              ),
              child: Text('OK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              onPressed: () {

                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
void resetForm() {
  // Reset the form fields or variables to their initial state
  nameController.text = "";
  hoursController.text = "";
  dateinput.text = "";
  groundController.text = "";
}

