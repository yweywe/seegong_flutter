import 'package:flutter/material.dart';
import 'package:seegong_flutter/screens/LoginScreen.dart';
import 'package:seegong_flutter/screens/ReservationList.dart';
import 'package:seegong_flutter/screens/ReservationResult.dart';
import 'package:seegong_flutter/screens/SpaceListScreen.dart';
import 'package:seegong_flutter/screens/Reservation.dart';
import 'package:seegong_flutter/screens/SpaceSelect.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return runApp(MyApp());
}
final GlobalKey<ScaffoldState> key = GlobalKey();


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seegong',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        primaryColor: Color(0xffffffff),
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => LoginScreen(),
        SpaceSelect.routename: (context) => SpaceSelect(),
        SpaceListScreen.routename: (context) => SpaceListScreen(),
        SpecificScreen.routename : (context) => SpecificScreen(),
        ReservationScreen.routename : (context) => ReservationScreen(),
        ReservationList.routename : (context) => ReservationList(),
        ResultScreen.routename : (context) => ResultScreen(),
      },
    );
  }
}
