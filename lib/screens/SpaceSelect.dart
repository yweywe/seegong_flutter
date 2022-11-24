import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/NavigationMenu.dart';
import 'package:seegong_flutter/screens/SpaceListScreen.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';



final GlobalKey<ScaffoldState> _key = GlobalKey();

class SpaceSelect extends StatelessWidget {
  const SpaceSelect({super.key});
  static final routename ='/SpaceSelect';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarseegong,
      drawer: NavigationMenu(),
      body: ShowSpaceSelectListView(context),
      // body: Container(
      //   child: GridView.count(
      //     // 가로
      //     crossAxisCount: 4,
      //     // 전체
      //     children: List.generate(12, (index) {
      //       return Center(
      //         child: Column(
      //           children: [
      //             IconButton(
      //               icon: Icon(Icons.menu),
      //               onPressed: () {
      //                 print("Item $index pressed");
      //                 Navigator.pushNamed(context, SpaceListScreen.routename);
      //               },
      //             ),
      //             Text(
      //                 "Item $index"
      //             )
      //           ],
      //         ),
      //       );
      //     }),
      //   ),
      // ),
    );
  }
}

Future<Object?> _getSpaceName() async{
  var value = await FirebaseDatabase.instance.ref('SpaceSelect/SpaceName/').get();
  return value.value;
}

FutureBuilder ShowSpaceSelectListView(BuildContext context) {
  return FutureBuilder(
      future: _getSpaceName(),
      builder: (context , snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (snapshot.hasError) {
          return Text('${snapshot.error.toString()}');
        }
        else{
          var jsonStr = jsonDecode(jsonEncode(snapshot.data));

          List<Map<String, dynamic>> JsonList = [];
          for (Map<String, dynamic> i in jsonStr) {
            JsonList.add(i);
          }
          return ListView.builder(
              itemCount: JsonList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        Navigator.pushNamed(context, SpaceListScreen.routename);
                      },
                    ),
                    Text("${jsonStr[index]['name']}")
                  ],
                );
              });
        }
      });
}