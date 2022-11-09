import 'package:flutter/material.dart';

import 'LoginScreen.dart';

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
      //home: LoginScreen(),
      home: LoginScreen(),
    );
  }
}
