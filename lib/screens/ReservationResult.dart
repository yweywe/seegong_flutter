import 'package:flutter/material.dart';
import 'package:seegong_flutter/etc/ReserveTextClass.dart';

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
    "space_id": 1,
    "space_name": "장소명",
    "address": "경기도 시흥시 새재로 19윤성빌딩 5층 502호",
    "address_dong": "정왕본동",
    "closed_date_str": "연중무휴",
    "start_time": "09:00",
    "end_time": "19:00",
    "firm_name": "작은천사들",
    "price_weekday": "30000",
    "refund_policy": "3일전: 환불가능 2일전: 80% 하루전: 50% 당일: 불가능",
    "refund_pretext": "이용당일 이후 관련 사항은 시설 관리자에게 직접 문의 바랍니다. 또한 결제 이후 취소도 시설 관리자와의 문의 이후 취소 가능합니다.",
    "reserve_warning": "3일전: 환불가능 2일전: 80% 하루전: 50% 당일: 불가능",
    "space_desc": "회의실 혹은 강의실로 사용 할 수 있습니다.",
    "space_desc2": "전동스크린, 빔프로젝터, 마이크, PC, 칠판, 와이파이, 냉온정수기, HMDI 제공, 음향시설, 레이저포인터, 공기청정기, 냉난방기시설 완비",
    "tell": "031-435-2000",
    "max_people": 30,
    "user_necessary": "사용후 정리 필수",
    "img_url": "images/imgs/wws.jpeg"
  };
  Map<String, dynamic> dummy_reserve_data = {
    "reserve_id": 0,
    "space_id": 1,
    "space_name": "장소이름텍스트",
    "is_approval": false,
    "request_date": "2022-11-09",
    "wait_period": "2022-11-10",
    "use_date": "2022-11-11",
    "start_time": "2:00",
    "end_time": "9:00",
    "people_count": 5,
    "user_name": "사용자이름텍스트",
    "purpose": """
    공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다.
    """,
    "request": """
    공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다.
    """,
    "tell": "010-0000-0000",
    "email": "test@test.com",
    "total_cost": 90000,
  };

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    double SmallFontSize = screenSize.width / 30;

    return Scaffold(
      appBar: Appbarseegong,

      /// 앱바
      drawer: NavigationMenu(),

      /// 내비게이션(햄버거) 메뉴
      body: SafeArea(
        child: Expanded(
          child: ListView(
            children: [
              /* 사진 보여주는 부분 */
              Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(dummy_space_data["img_url"]),
                    )
                ),
              ),
              SizedBox(height: 10,),

              /* 예약 내용 페이지 */
              Container(
                padding: const EdgeInsets.all(23.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadText(headText: '예약 내용'),
                    DescriptBold(context: context,
                      subject: '예약 번호',
                      description: 'C2163512653',),
                    DescriptBold(context: context,
                      subject: '장소 이름',
                      description: '작은 천사들',),
                    DescriptBold(
                      context: context, subject: '가격', description: '100,000',),
                    DescriptBold(
                      context: context, subject: '시간', description: '3시간',),
                    DescriptBold(context: context,
                      subject: '예약 날짜',
                      description: '2022.12.12. (월)',),
                    DescriptBold(
                      context: context, subject: '예약 인원', description: '3명',),
                    DescriptBold(
                      context: context, subject: '요청 사항', description: '',),
                  ],
                ),
              ),

              /* 예약자 정보 페이지*/
              Container(
                padding: const EdgeInsets.all(23.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadText(headText: '예약자 정보'),
                    DescriptBold(
                      context: context, subject: '이름', description: '엄영욱',),
                    DescriptBold(context: context,
                      subject: '전화 번호',
                      description: '010-4594-9926',),
                    DescriptBold(context: context,
                      subject: '이메일',
                      description: 'zotbob123@naver.com',),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(23.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadText(headText: '공간 정보'),
                    DescriptLight(subject: '공간 상호', description: '작은 천사들'),
                    DescriptLight(subject: '대표자 명', description: '누구누구'),
                    DescriptLight(subject: '소재지', description: '456213'),
                    DescriptLight(subject: '사업자 번호', description: '12312653'),
                    DescriptLight(subject: '연락처', description: '010-1235-1235'),

                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadText(headText: '환불시 주의사항'),
                    DescriptCaution(
                        descrpitText: '3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가'),
                  ],
                ),
              ), SizedBox(height: 30,),

              Container(
                padding: EdgeInsets.all(23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadText(headText: '예약시 주의사항'),
                    DescriptCaution(
                        descrpitText:
                            '이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.'),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadText(headText: '결제예정금액'),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '총 결제금액',
                          style: TextStyle(
                            color: Color(0xff434849)
                          ),
                        ),
                        Text(
                          '7000원',
                          style: TextStyle(
                              color: Color(0xffEE7500),
                            fontWeight: FontWeight.w700,
                            fontSize: 18
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ResultScreen.routename);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: ColorButton(buttonText:'에약 신청하기',),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}