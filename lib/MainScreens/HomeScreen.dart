import 'package:flutter/material.dart';
import 'package:project_football/InitialScreens/loginScreen.dart';
import '../Widgets/Listtiles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/green_pastel.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Browse and Explore!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF357a38),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               Padding(
                 padding: EdgeInsets.only(top: 70),
                 child: Padding(
                   padding: EdgeInsets.symmetric(horizontal: 30),
                   child: Container(
                    height: 350,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       border: Border.all(
                         color: Colors.transparent,
                         width: 1.5,
                       ),
                       borderRadius: BorderRadius.all(Radius.zero),
                       boxShadow: [
                         BoxShadow(
                           color:
                           Colors.black.withOpacity(0.2), // Shadow color
                           spreadRadius: 2, // Spread radius
                           blurRadius: 12, // Blur radius
                           offset: Offset(
                               0, 3), // Offset in (x,y) from the container
                         ),
                       ],
                     ),
              ),
                 ),
               )
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Builder(
            builder: (context) {
              return AppBar(
                backgroundColor:
                    Colors.transparent, // Make the background transparent

                elevation: 0,
                flexibleSpace: Container(),
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Color(0xFF357a38),


                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                  actions: [
                    PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 'logout',
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.black, // Change the text color to red
                              ),
                            ),
                          ),
                        ];
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: Color(0xFF357a38),
                      ),
                      onSelected: (value) {
                        if (value == 'logout') {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => LoginScreen()));                        }
                      },
                    ),
                  ]

              );
            },
          ),
        ),
        drawer: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/green_pastel.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Drawer(
            backgroundColor: Colors.transparent,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 80.0,
                  child: DrawerHeader(
                    child: null,
                  ),
                ),

                // Use the DrawerItems widget here
                DrawerItems(),
                Divider(),
                // Add more DrawerItems or separate them into multiple widgets
              ],
            ),
          ),
        ),
      ),
    );
  }
}
