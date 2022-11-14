import 'package:flutter/material.dart';
import 'package:seegong_flutter/SpaceListScreen.dart';
import 'package:seegong_flutter/screens/Rservation.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';


void main() => runApp(MyApp());
final GlobalKey<ScaffoldState> _key = GlobalKey();


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        SpaceListScreen.routename: (context) => SpaceListScreen(),
      },
    );
  }
}
      // key: _key,
      // drawer: NavigationMenu(),
      //           _key.currentState?.openDrawer();