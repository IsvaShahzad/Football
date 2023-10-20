import 'package:flutter/material.dart';
import 'package:project_football/MainScreens/BookingTeam.dart';
import 'package:project_football/MainScreens/ProfileScreen.dart';

import '../MainScreens/HomeScreen.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          tileColor: Colors.white60,
          trailing: Icon(
            Icons.home,
            size: 18,
            color: Colors.green,
          ),
          title: Text(
            "Home Page",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        Divider(),

        ListTile(
          tileColor: Colors.white60,
          trailing: Icon(
            Icons.person,
            size: 18,
            color: Colors.green,
          ),
          title: Text(
            "Profile",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage()));
          },
        ),
        Divider(),

        ListTile(
          tileColor: Colors.white60,
          trailing: Icon(
            Icons.book,
            size: 18,
            color: Colors.green,
          ),
          title: Text(
            "Book your ground",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BookTeam()));
          },
        ),
        Divider(),
        ListTile(
          tileColor: Colors.white60,
          trailing: Icon(
            Icons.monetization_on_sharp,
            size: 18,
            color: Colors.green,
          ),
          title: Text(
            "Fine due",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onTap: () async {


            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => PostingDisplayedScreen(
            //           addedposting: {
            //             'All Requirements': addedrequirements,
            //           },
            //           id: 'id',
            //         )));
          },
        ),
        Divider(),
        ListTile(
          tileColor: Colors.white60,
          trailing: Icon(
            Icons.monetization_on_sharp,
            size: 18,
            color: Colors.green,
          ),
          title: Text(
            "Join a team",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onTap: () async {


            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => PostingDisplayedScreen(
            //           addedposting: {
            //             'All Requirements': addedrequirements,
            //           },
            //           id: 'id',
            //         )));
          },
        ),
        Divider(),
        ListTile(
          tileColor: Colors.white60,
          trailing: Icon(
            Icons.people_alt,
            size: 18,
            color: Colors.green,
          ),
          title: Text(
            "Your team",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => ContactUsScreen()));
          },
        ),
        Divider(),
        ListTile(
          tileColor: Colors.white60,
          trailing: Icon(
            Icons.help,
            size: 18,
            color: Colors.green,
          ),
          title: Text(
            "Help/Contact us",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => LoginScreen()));
          },
        ),
        Divider(),
        ListTile(
          tileColor: Colors.white60,
          trailing: Icon(
            Icons.logout,
            size: 18,
            color: Colors.green,
          ),
          title: Text(
            "Logout",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => LoginScreen()));
          },
        ),
        Divider(),
      ],

    );
  }
}
