import 'package:flutter/material.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/NavigationMenu.dart';
import 'package:seegong_flutter/screens/SpaceListScreen.dart';



final GlobalKey<ScaffoldState> _key = GlobalKey();

class SpaceSelect extends StatelessWidget {
  const SpaceSelect({super.key});
  static final routename ='/SpaceSelect';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarseegong,
      drawer: NavigationMenu(),
      body: Container(
        child: GridView.count(
          // 가로
          crossAxisCount: 4,
          // 전체
          children: List.generate(12, (index) {
            return Center(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      print("Item $index pressed");
                      Navigator.pushNamed(context, SpaceListScreen.routename);
                    },
                  ),
                  Text(
                      "Item $index"
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}