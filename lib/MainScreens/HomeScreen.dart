import 'package:flutter/material.dart';
import 'package:project_football/InitialScreens/SignUpScreen.dart';
import 'package:project_football/MainScreens/ProfileScreen.dart';

import '../InitialScreens/LoginScreen.dart';
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Builder(
          builder: (context) {
            return AppBar(
              backgroundColor: Color(0xff78b075),
              elevation: 0,
              flexibleSpace: Container(),
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
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
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ];
                  },
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onSelected: (value) {
                    if (value == 'logout') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                  },
                ),
              ],
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
              DrawerItems(), // You can customize this
              Divider(),
              // Add more DrawerItems or separate them into multiple widgets
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/green_pastel.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25, left: 10, bottom: 40),
                child: Text(
                  'Browse and Explore!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF357a38),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Static grid that won't scroll
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: 4, // Number of grid items
                physics:
                    NeverScrollableScrollPhysics(), // Make it non-scrollable
                shrinkWrap: true, // Wrap content tightly
                itemBuilder: (BuildContext context, int index) {
                  // Define separate titles and asset images for each item
                  List<String> titles = [
                    "Matches",
                    "Stadiums",
                    "Teams",
                    "Tournaments"
                  ];
                  List<String> images = [
                    "assets/images/matches.jfif",
                    "assets/images/sstadium.jfif",
                    "assets/images/teams.jfif",
                    "assets/images/ttournaments.jfif"
                  ];

                  return GestureDetector(
                    onTap: () {
                      // Check the index and navigate accordingly
                      if (index == 0) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      } else if (index == 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      } else if (index == 2) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      } else if (index == 3) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    child: GridItem(
                      image: images[index], // Use the image path from the list
                      title: titles[index], // Use the title from the list
                    ),
                  );

                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Padding(
                  padding: EdgeInsets.all(16), // You can adjust the padding
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Happening Right Now:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),

                  child: Container(

                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 12,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String image;
  final String title;

  GridItem({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
