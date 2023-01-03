import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/NavigationMenu.dart';
import 'package:seegong_flutter/screens/SpaceListScreen.dart';
import 'package:seegong_flutter/viewModel/LoginViewModel.dart';

class ReservationList extends StatelessWidget{
  ReservationList({Key? key}) : super(key: key);
  static final routename = '/ReservationList';
  final currentUser = Get.put(CurrentUserViewModel());

  static const customDivider = const Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: const Divider(height: 1, color: const Color.fromRGBO(242, 244, 243, 1), thickness: 0.5),
  );

  @override
  Widget build(BuildContext context){


    return FutureBuilder(
      future: currentUser.getSpaceListFromFB(),
      builder: (context, snapshot) {
        return Scaffold(
          drawerEnableOpenDragGesture: false,
          appBar: Appbarseegong,
          drawer: NavigationMenu(),
          body:
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 24.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${currentUser.user.value.userName}님의 예약 내역입니다.", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(51, 51, 51, 1)),),
                      Divider(height: 12, color: Colors.transparent),
                      Text("총 예약내역 ${currentUser.reservList.length}건", style: TextStyle(fontSize: 14, color: Color.fromRGBO(92, 94, 91, 1)),),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: currentUser.reservList.length,
                    itemBuilder: (context, idx){
                      return GestureDetector(
                        onTap: (){
                          // 일단 SpaceList로 이동
                          // 추후 예약 결과 화면으로 수정 필요
                          Navigator.pushNamed(context, SpaceListScreen.routename);
                        },
                        //{
                        //  Navigator.pushNamed(context, SpecificScreen.routename);
                        //},
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                /// 이용여부, 예약상세 버튼
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("이용 예정"), // 이용여부
                                    Text("예약 상세 > ", style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              customDivider,
                              Row(
                                /// 장소 사진, 이름, 소개
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height / 6,
                                      width: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.asset('images/imgs/wws.jpeg', fit: BoxFit.cover,)
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ///장소 이름
                                          Text('${currentUser.reservList[idx].spaceNo}', style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.bold)),
                                          Divider(color: Colors.transparent, height: 12,),
                                          ///장소위치
                                          Text("${currentUser.reservList[idx].useDate}", style: TextStyle(fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1)),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white
                                ),
                                child: Row(
                                  /// 시작, 종료시간
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: Color.fromRGBO(245, 247, 246, 1),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            children: [
                                              Text("시작시간", style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.bold)),
                                              Divider(color: Colors.transparent, height: 8,),
                                              Text("${currentUser.reservList[idx].useTimeBegin}", style: TextStyle(fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1)),),
                                            ],
                                          ),
                                        )
                                      )
                                    ),
                                    Expanded(
                                      flex: 1,
                                        child: Container(
                                            color: Color.fromRGBO(245, 247, 246, 1),
                                            child: Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Column(
                                                children: [
                                                  Text("종료시간", style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.bold)),
                                                  Divider(color: Colors.transparent, height: 8,),
                                                  Text("${currentUser.reservList[idx].useTimeEnd}", style: TextStyle(fontSize: 14, color: Color.fromRGBO(102, 102, 102, 1)),),
                                                ],
                                              ),
                                            )
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          )
        );
      }
    );
  }
}
