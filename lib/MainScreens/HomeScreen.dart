import 'package:flutter/material.dart';
import 'package:project_football/InitialScreens/SignUpScreen.dart';
import 'package:project_football/MainScreens/ProfileScreen.dart';


import '../InitialScreens/LoginScreen.dart';
import '../Widgets/Listtiles.dart';
import '../Api/api_service.dart';
import '../Api/ModelClass.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Welcome>? _userModel = []; //create a list of api_service

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    try {
      final users = await ApiService().getUsers();
      if (users != null) {
        setState(() {
          _userModel = users;
        });
      } else {
        print('no response');
      }
    } catch (e) {
      print("Error: $e");
    }
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
      body:
          // _userModel == null || _userModel!.isEmpty
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     : ListView.builder(
          //         itemCount: _userModel!.length,
          //         itemBuilder: (context, index) {
          //           return Card(
          //               child: Column(children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Text(_userModel![index].id.toString()),
          //                 Text(_userModel![index].username),
          //               ],
          //             ),
          Container(
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
              Padding(
                padding: EdgeInsets.only(right: 165, bottom: 10),
                child: Text(
                  'What are you looking for?',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Static grid that won't scroll
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 3.0,
                ),
                itemCount: 4,
                // Number of grid items
                physics: NeverScrollableScrollPhysics(),
                // Make it non-scrollable
                shrinkWrap: true,
                // Wrap content tightly
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
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      } else if (index == 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      } else if (index == 2) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      } else if (index == 3) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    child: GridItem(
                      image: images[index],
                      // Use the image path from the list
                      title: titles[index], // Use the title from the list
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 13),
                      child: Text(
                        'Happening Right Now:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 13, left: 290),
                      child: TextButton(
                        onPressed: () {
                          // Define the onPressed function for the "View all" button
                          print(
                              "View All button clicked!"); // This is a sample action
                        },
                        child: Text(
                          'View all',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 13, top: 0),
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
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
      ),
    );
  }
}
