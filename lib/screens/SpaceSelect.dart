import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/NavigationMenu.dart';
import 'package:seegong_flutter/screens/SpaceListScreen.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class SpaceSelect extends StatelessWidget {
  const SpaceSelect({super.key});

  static const icon_list = [
    "slst_cent_ticon_confroom.svg",
    "slst_cent_ticon_lecture.svg",
    "slst_cent_ticon_grassfield.svg",
    "slst_cent_ticon_footsal.svg",
    "slst_cent_ticon_practiceroom.svg",
    "slst_cent_ticon_academy.svg",
    "slst_cent_ticon_meetplace.svg",
    "slst_cent_ticon_cafe.svg"
  ];
  static const name_list = [
    "회의실",
    "강의실",
    "잔디구장",
    "풋살장",
    "연습실",
    "학원",
    "모임터",
    "카페"
  ];

  static final routename ='/SpaceSelect';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarseegong,
      drawer: NavigationMenu(),
      // body: ShowSpaceSelectListView(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text("이름님,\n어떤 장소를 예약해볼까요?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          ),
          Container(
            child: Expanded(
              child: GridView.count(
                // 가로
                crossAxisCount: 4,
                // 전체
                children: List.generate(icon_list.length, (index) {
                  return Center(
                    child: Column(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                              "images/icons/${icon_list[index]}",
                          ),
                          iconSize: 54,
                          onPressed: () {
                            print("Item $index pressed");
                            Navigator.pushNamed(context, SpaceListScreen.routename);
                          },
                        ),
                        Text(
                            name_list[index],
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Future<Object?> _getSpaceName() async{
//   var value = await FirebaseDatabase.instance.ref('SpaceSelect/SpaceName/').get();
//   return value.value;
// }
//
// FutureBuilder ShowSpaceSelectListView(BuildContext context) {
//   return FutureBuilder(
//       future: _getSpaceName(),
//       builder: (context , snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         else if (snapshot.hasError) {
//           return Text('${snapshot.error.toString()}');
//         }
//         else{
//           var jsonStr = jsonDecode(jsonEncode(snapshot.data));
//
//           List<Map<String, dynamic>> JsonList = [];
//           for (Map<String, dynamic> i in jsonStr) {
//             JsonList.add(i);
//           }
//           return ListView.builder(
//               itemCount: JsonList.length,
//               itemBuilder: (context, index) {
//                 return Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.menu),
//                       onPressed: () {
//                         Navigator.pushNamed(context, SpaceListScreen.routename);
//                       },
//                     ),
//                     Text("${jsonStr[index]['name']}")
//                   ],
//                 );
//               });
//         }
//       });
// }