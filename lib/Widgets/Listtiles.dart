import 'package:flutter/material.dart';
import 'package:project_football/MainScreens/BookGround.dart';
import 'package:project_football/MainScreens/BookingsDone.dart';
import 'package:project_football/MainScreens/ProfileScreen.dart';
import 'package:provider/provider.dart';


class DrawerItems extends StatefulWidget {
  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => BookingData(),
        child: Consumer<BookingData>(
            builder: (context, bookingData, child) {
              // return Consumer<BookingData>(builder: (context, bookingData, child) {
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
                      style:
                      TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context,
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
                      style:
                      TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => BookTeam()));
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
                      style:
                      TextStyle(
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
                      style:
                      TextStyle(
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
                      "Your bookings",
                      style:
                      TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BookingsDone(
                                // Pass the data from the BookingData instance
                                name: bookingData.name,
                                selectedValue: bookingData.selectedValue,
                                selectedHours: bookingData.selectedHours,
                                date: bookingData.date,
                              ),
                        ),
                      );
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
                      style:
                      TextStyle(
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
                      style:
                      TextStyle(
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
            }));
  }
}
