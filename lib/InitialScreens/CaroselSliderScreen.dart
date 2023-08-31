// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// import 'LoginScreen.dart';
//
// class CarouselScreen extends StatefulWidget {
//   @override
//   _CarouselScreenState createState() => _CarouselScreenState();
// }
// class _CarouselScreenState extends State<CarouselScreen> {
//   int _currentImageIndex = 0;
//   List<String> _imageAssetPaths = [
//     'assets/images/carosel.jpg', // Replace with your asset image paths
//     'assets/images/footballcloud.jpg',
//     'assets/images/footballpic.jpg',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Center(
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: MediaQuery.of(context).size.height,
//                 viewportFraction: 1.0,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _currentImageIndex = index;
//                   });
//                 },
//               ),
//               items: _imageAssetPaths.map((imageAssetPath) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width,
//                       child: Image.asset(
//                         imageAssetPath,
//                         fit: BoxFit.cover,
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//             Positioned(
//               bottom: 50.0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: _imageAssetPaths.map((imageAssetPath) {
//                   int index = _imageAssetPaths.indexOf(imageAssetPath);
//                   return Container(
//                     width: 10.0,
//                     height: 10.0,
//                     margin: EdgeInsets.symmetric(horizontal: 2.0),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: _currentImageIndex == index
//                           ? Colors.blue
//                           : Colors.grey,
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             if (_currentImageIndex == _imageAssetPaths.length - 1)
//               Positioned(
//                 bottom: 30.0,
//                 right: 16.0,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => LoginScreen()), // Replace LoginScreen with your actual login screen
//                     );
//                   },
//                   child: Text('Done'),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
