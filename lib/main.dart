import 'package:flutter/material.dart';

import 'NavigationMenu.dart';
import 'SpaceListScreen.dart';

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
      body: ElevatedButton(
        child: Text("장소 화면 이동 테스트용"),
        onPressed: (){
          // todo
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return SpaceListScreen();
          }));
        },
      ),
      drawer: NavigationMenu(),
    );
  }
}
