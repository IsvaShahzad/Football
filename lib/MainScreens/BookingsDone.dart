import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BookGround.dart';

class BookingsDone extends StatefulWidget {
  final String name;
  final String date;
  final String selectedValue;
  final String selectedHours;


  BookingsDone({
    required this.name,
    required this.date,
    required this.selectedHours,
    required this.selectedValue,

  });

  @override
  State<BookingsDone> createState() => _BookingsDoneState();
}

class _BookingsDoneState extends State<BookingsDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/green_pastel.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 70, left: 0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.grey),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 108.0, left: 20),
                      child: Text(
                        'Booking Details',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      height: 300,
                      color: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<BookingData>(
                            builder: (context, bookingData, child) {
                              return ListTile(
                                title: Text('Name: ${widget.name}'),
                              );
                            },
                          ),
                          ListTile(
                            title: Consumer<BookingData>(
                              builder: (context, bookingData, child) {
                                return Text('Ground/Field: ${bookingData.selectedValue ?? 'N/A'}');
                              },
                            ),
                          ),
                          ListTile(
                            title: Consumer<BookingData>(
                              builder: (context, bookingData, child) {
                                return Text('Hours Booked: ${bookingData.selectedHours ?? 'N/A'}');
                              },
                            ),
                          ),
                          ListTile(
                            title: Text('Date: ${widget.date}'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
