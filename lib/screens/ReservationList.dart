import 'package:flutter/material.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/NavigationMenu.dart';

class ReservationList extends StatelessWidget{
  const ReservationList({Key? key}) : super(key: key);
  static final routename = '/ReservationList';
  @override
  Widget build(BuildContext context){
    List<Map<dynamic, dynamic>> testList = [
      {
        "title": "장소명",
        "description" : "장소 소개",
        "state" : "이용완료",
        "detail" : "예약 상세",
        "startDate" : "날짜 및 시작시간",
        "endDate" : "날짜 및 종료 시간",
        "img_url": "images/imgs/wws.jpeg"
      },
      {
        "title": "장소명",
        "description" : "장소 소개",
        "state" : "이용완료",
        "detail" : "예약 상세",
        "startDate" : "날짜 및 시작시간",
        "endDate" : "날짜 및 종료 시간",
        "img_url": "images/imgs/wws.jpeg"
      },
    ];

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: Appbarseegong,
      drawer: NavigationMenu(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: testList.length,
                itemBuilder: (context, idx){
                  return GestureDetector(
                    onTap: (){
                      print("hello");
                    },
                    //{
                    //  Navigator.pushNamed(context, SpecificScreen.routename);
                    //},
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(testList[idx]["state"]),
                              Text(testList[idx]["detail"])
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: 150,
                                child: Image.asset(testList[idx]["img_url"], fit: BoxFit.cover,),
                              ),
                              Container(
                                child:Column(
                                  children: [
                                    Text(testList[idx]["title"]),
                                    Text(testList[idx]["description"]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(testList[idx]["startDate"]),
                              Text(testList[idx]["endDate"]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
