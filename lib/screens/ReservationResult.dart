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
  Map<String, dynamic> dummy_space_data = {
    "space_id" : 1,
    "space_name": "장소명",
    "address": "경기도 시흥시 새재로 19윤성빌딩 5층 502호",
    "address_dong": "정왕본동",
    "closed_date_str" : "연중무휴",
    "start_time" : "09:00",
    "end_time" : "19:00",
    "firm_name" : "작은천사들",
    "price_weekday" : "30000",
    "refund_policy" : "3일전: 환불가능 2일전: 80% 하루전: 50% 당일: 불가능",
    "refund_pretext" : "이용당일 이후 관련 사항은 시설 관리자에게 직접 문의 바랍니다. 또한 결제 이후 취소도 시설 관리자와의 문의 이후 취소 가능합니다.",
    "reserve_warning" : "3일전: 환불가능 2일전: 80% 하루전: 50% 당일: 불가능",
    "space_desc" : "회의실 혹은 강의실로 사용 할 수 있습니다.",
    "space_desc2" : "전동스크린, 빔프로젝터, 마이크, PC, 칠판, 와이파이, 냉온정수기, HMDI 제공, 음향시설, 레이저포인터, 공기청정기, 냉난방기시설 완비",
    "tell" : "031-435-2000",
    "max_people" : 30,
    "user_necessary" : "사용후 정리 필수",
    "img_url": "images/imgs/wws.jpeg"
  };
  Map<String, dynamic> dummy_reserve_data = {
    "reserve_id" : 0,
    "space_id" : 1,
    "space_name" : "장소이름텍스트",
    "is_approval" : false,
    "request_date" : "2022-11-09",
    "wait_period" : "2022-11-10",
    "use_date" : "2022-11-11",
    "start_time" : "2:00",
    "end_time" : "9:00",
    "people_count" : 5,
    "user_name" : "사용자이름텍스트",
    "purpose" : """
    공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다.
    """,
    "request" : """
    공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다.
    """,
    "tell" : "010-0000-0000",
    "email" : "test@test.com",
    "total_cost" : 90000,
  };

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double SmallFontSize = screenSize.width / 30;

    return Scaffold(
      appBar: Appbarseegong, /// 앱바
      drawer: NavigationMenu(), /// 내비게이션(햄버거) 메뉴
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [
              /// 상세페이지 이미지 위젯 파트
              /// 데코레이션 바꿔서 페이지에 맞게 수정해야함
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(dummy_space_data["img_url"]),
                    )
                ),
              ),

              /// 상세 내용 컬럼
              Column(
                children: [
                  /// 예약정보, 예약번호 텍스트 컨테이너
                  titleContainer(context, screenSize, "예약 정보", "예약 번호: ${dummy_reserve_data["reserve_id"]}"),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          child: Column(
                              children: [
                                SizedBox(height: 10,),
                                /// 승인대기기한
                                normalTextRow(SmallFontSize, "승인 대기 기한", dummy_reserve_data["wait_period"]),
                                SizedBox(height: 4,),

                                /// 신청일
                                normalTextRow(SmallFontSize, "신청일", dummy_reserve_data["request_date"]),
                                SizedBox(height: 4,),

                                /// 사용 예정일
                                normalTextRow(SmallFontSize, "사용 예정일", dummy_reserve_data["use_date"]),
                                SizedBox(height: 4,),

                                /// 예약 시간
                                normalTextRow(SmallFontSize, "예약 시간", "${dummy_reserve_data["start_time"]} ~ ${dummy_reserve_data["end_time"]}"),
                                SizedBox(height: 4,),

                                /// 예약 인원
                                normalTextRow(SmallFontSize, "예약 인원", "${dummy_reserve_data["people_count"]}명"),
                                SizedBox(height: 4,),
                                
                                /// 사용 목적
                                normalTextRow(SmallFontSize, "사용 목적", dummy_reserve_data["purpose"]),
                                SizedBox(height: 4,),

                                /// 요청 사항
                                normalTextRow(SmallFontSize, "요청 사항", dummy_reserve_data["request"]),
                                SizedBox(height: 4,),

                                SizedBox(height: 10,),
                                ],
                          ),
                      ),
                  ),

                  /// 예약자 정보 컨테이너
                  titleContainer(context, screenSize, "예약자 정보", ""),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          /// 사용자 이름
                          normalTextRow(SmallFontSize, "이름", dummy_reserve_data["user_name"]),
                          SizedBox(height: 4,),
                          
                          /// 사용자 번호
                          normalTextRow(SmallFontSize, "번호", dummy_reserve_data["tell"]),
                          SizedBox(height: 4,),

                          /// 사용자 이메일
                          normalTextRow(SmallFontSize, "이메일", dummy_reserve_data["email"]),
                          SizedBox(height: 4,),

                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),

                  /// 환불 정보 컨테이너
                  titleContainer(context, screenSize, "환불 정보", ""),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),

                          /// 환불규정 앞내용
                          normalTextRow(SmallFontSize, dummy_space_data["refund_pretext"], ""),
                          SizedBox(height: 4,),

                          /// 환불규정 본내용
                          normalTextRow(SmallFontSize, dummy_space_data["refund_policy"], ""),
                          SizedBox(height: 4,),

                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),

                  /// 공간 정보 컨테이너
                  titleContainer(context, screenSize, "공간 정보", ""),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          /// 사용자 이름
                          normalTextRow(SmallFontSize, "공간상호", dummy_space_data["firm_name"]),
                          SizedBox(height: 4,),

                          /// 사용자 번호
                          normalTextRow(SmallFontSize, "대표자명", "대표자명맵자료형자리"),
                          SizedBox(height: 4,),

                          /// 사용자 이메일
                          normalTextRow(SmallFontSize, "소재지", dummy_space_data["address"]),
                          SizedBox(height: 4,),

                          /// 사용자 이메일
                          normalTextRow(SmallFontSize, "사업자번호", "000000000"),
                          SizedBox(height: 4,),

                          /// 사용자 이메일
                          normalTextRow(SmallFontSize, "연락처", dummy_space_data["tell"]),
                          SizedBox(height: 4,),

                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 32,),
                ],
              ),
            ],
          ),
        ),
      ),

      /// 메인화면 이동용 최하단 버튼
      bottomSheet: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
            ),
              onPressed: (){
                  print("버튼눌림 테스트");
                },
              child: Text("메인으로 가기", style: TextStyle(color: Colors.black87),)
          ),
        ),
      ),
    );
  }

  /// 제목 텍스트 칸을 만드는 데 사용
  Container titleContainer(BuildContext context, Size screenSize, String firstTitle, String secondTitle) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(firstTitle, style: TextStyle(fontSize: screenSize.width / 25, letterSpacing: -1),),
            secondTitle != "" ? Text(secondTitle, style: TextStyle(fontSize: screenSize.width / 25, letterSpacing: -1),) : SizedBox.shrink(), // secondTitle 여부에 따른 선택적 렌더링
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5)
      ),
    );
  }

  /// 일반적인 텍스트 칸을 만드는 데 사용
  Widget normalTextRow(double fontSize, String firstText, String secondText) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(firstText, style: TextStyle(fontSize: fontSize, letterSpacing: -1),)
          ),
          secondText != "" ? Flexible(
              child: Text(secondText, style: TextStyle(fontSize: fontSize, letterSpacing: -1),)
          ) : SizedBox.shrink(), // secondText 여부에 따른 선택적 렌더링
        ],
      );
  }
}
