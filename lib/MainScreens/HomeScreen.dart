import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _onFavoritePage = false;





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/green_pastel.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.zero,
                  bottomLeft: Radius.zero)),
          titleSpacing: 60, // Add this line to adjust the title spacing

          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Browse Category",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: <Widget>[

          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 80),

        ),

        drawer: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/green_pastel.jpg"),
                  fit: BoxFit.cover)),
          child: Drawer(
            backgroundColor: Colors.transparent,
            child: ListView(
              children: <Widget>[
              //   SizedBox(
              //     height: 80.h,
              //   ),
                Container(
                  height: 80.0,
                  child: DrawerHeader(
                    child: null,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),

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
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()));
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
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => AddRequirements()));
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
                    "Bookings",
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
            ),
          ),
        ),
      ),
    );
  }
}
