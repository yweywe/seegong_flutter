import 'package:flutter/material.dart';

import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/NavigationMenu.dart';

import '../etc/shadow.dart';

class ResultScreen extends StatefulWidget {
  static const routename = "/ResultScreen";
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double SmallFontSize = screenSize.width / 30;

    String imgAssetName = "images/imgs/wws.jpeg";

    return Scaffold(
      appBar: Appbarseegong, /// 앱바
      drawer: NavigationMenu(), /// 내비게이션(햄버거) 메뉴
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [
              /// 상세페이지 이미지 위젯 파트 돚거함:
              /// 데코레이션 바꿔서 페이지에 맞게 수정해야함
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadowVar
                    ],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(imgAssetName),
                    )
                ),
              ),

              Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                          child: Text('공간 정보', style: TextStyle(fontSize: screenSize.width / 25, letterSpacing: -1),),
                      ),
                      decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5)
                      ),
                  ),

                  Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          child: Column(
                              children: [
                                Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                              alignment: AlignmentDirectional.centerEnd,
                                              child: Text('공간 상호', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),))),
                                      Expanded(child: Container(),flex: 1,),
                                      Expanded(
                                          flex: 7,
                                          child: Text('${t1.SpaceName}', style: TextStyle(fontSize: SmallFontSize, letterSpacing: -1),)),

                                              ],
                                ),
                                SizedBox(height: 10,),
                                ],
                            ),
                        ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),

      /// 메인화면 이동용 최하단 버튼
      bottomSheet: SafeArea(
        child: Container(
          child: ElevatedButton(
              onPressed: (){print("버튼눌림 테스트");
                },
              child: Text("메인으로 가기")
          ),
        ),
      ),
    );
  }
}
