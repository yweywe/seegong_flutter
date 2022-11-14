import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'package:seegong_flutter/screens/Rservation.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyApp created');
    return MaterialApp(
      title: 'Seegong',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => SpecificScreen(),
        ReservationScreen.routename : (context) => ReservationScreen(),
        SpecificScreen.routename : (context) => SpecificScreen(),
      },
    );
  }
}