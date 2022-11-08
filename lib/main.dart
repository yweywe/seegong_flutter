import 'package:flutter/material.dart';
import 'package:seegong_flutter/screens/Rservation.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';
import 'package:seegong_flutter/screens/test2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'gsans',
        primarySwatch: Colors.blue,
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