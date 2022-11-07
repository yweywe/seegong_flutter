import 'package:flutter/material.dart';
import 'package:seegong_flutter/NavigationMenu.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'gsans',
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
          title: Text("이름"),
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                _key.currentState?.openDrawer();
              },
          ),
      ),
      body: Text("TEXT HERE"),
      drawer: NavigationMenu(),
    );
  }
}


