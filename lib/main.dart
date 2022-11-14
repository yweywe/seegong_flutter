import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'package:seegong_flutter/screens/Rservation.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';
import 'package:seegong_flutter/NavigationMenu.dart';
import 'SpaceListScreen.dart';

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
      },
    );
  }
}
      key: _key,
      drawer: NavigationMenu(),
                _key.currentState?.openDrawer();