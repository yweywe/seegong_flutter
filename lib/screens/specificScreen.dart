
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/etc/ReserveTextClass.dart';
import 'package:seegong_flutter/etc/color.dart';
import 'package:seegong_flutter/etc/shadow.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/Reservation.dart';
import 'package:seegong_flutter/viewModel/CalendarVIewModel.dart';
import 'package:seegong_flutter/viewModel/MapViewModel.dart';
import 'package:seegong_flutter/viewModel/Widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:time_range/time_range.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'NavigationMenu.dart';

class SpecificScreen extends StatefulWidget {
  const SpecificScreen({Key? key}) : super(key: key);
  static const routename = '/SpecificScreen';

  @override
  State<SpecificScreen> createState() => _SpecificScreenState();
}

class _SpecificScreenState extends State<SpecificScreen> {


  var t1 = SpecificParameter(
    imgurl: 'images/icons/wws.jpeg',
    SpaceName: '작은 천사들 교육장',
    Spaceintroduction: '회의실 혹은 강의실로 사용할 수 있습니다.',
  );

  String AlertMessageFromSeegong = "3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가";
  String RefundPolicyInformation = "이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarseegong,
      drawer: NavigationMenu(),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('${t1.imgurl}')
                )
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                //장소 명, 장소 소개
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${t1.SpaceName}', // 작은 천사들 교육장 / 장소 명
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1.5
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //위
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xff033780),
                                    ),
                                    SizedBox(width: 3,),
                                    Text(
                                      '경기 고양시 일산동구 위시티4로 45 3층',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff666666)
                                      ),
                                    )
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Color(0xff033780),
                                    ),
                                    SizedBox(width: 3,),

                                    Text(
                                      '010-0000-0000',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff666666)
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 15,),


                    SizedBox(height: 5,),

                    GetBuilder<CalendarViewModel>(
                      init: CalendarViewModel(),
                      builder: (_) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 100,
                              child: GestureDetector(
                                onTap: (){
                                  _.SpecificCalenderView(context); // 날짜 선택
                                },
                                child: TextIf(context, '희망 날짜', _.reserveDate.DataTimeEditingController, 15)
                              ),
                            ),
                            Expanded(flex: 5, child: SizedBox()),
                            Expanded(
                              flex: 100,
                              child: GestureDetector(
                                onTap: (){
                                  _.setUsageTime(context);
                                },
                                child: TextIf( context, '시작 시간 선택', _.reserveDate.InitTime, 15)
                              ),
                            ),
                            Expanded(flex: 5, child: SizedBox()),
                            Expanded(
                              flex: 100,
                              child: GestureDetector(
                                onTap: (){
                                  _.setUsageTime(context);
                                },
                                child: TextIf( context, '종료 시간 선택', _.reserveDate.EndTime, 15)
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                    SizedBox(height: 60,),
                  ],
                ),

                /* 오시는 길 부분 */
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadText(headText: '오시는 길'),
                    //구글 맵 들어갈 자리
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: GMap(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //color: Colors.black,
                    ),
                    SizedBox(height: 40,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadText(headText: '공간 소개'),
                            DescriptLight(subject: '한줄 소개',description: '공간 소개'),
                            DescriptLight(subject: '영업 시간',description: '0900 ~ 1600'),
                            DescriptLight(subject: '휴무일', description: '주말 휴무'),
                          ],
                        ), SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadText(headText: '환불시 주의사항'),
                            DescriptCaution(descrpitText: '3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가'),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadText(headText: '환불시 주의사항'),
                            DescriptCaution(descrpitText: '이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.'),
                            SizedBox(height: 20,),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          /*예약하기 버튼*/
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: GestureDetector(
              child: ColorButton(buttonText: '예약하기'),
              onTap: () {
                Navigator.pushNamed(context, ReservationScreen.routename);
              },
            ),
          ),



        ],
      ),
    );
  }

}

class SpecificParameter {
  String? imgurl;
  String? SpaceName;
  String? Spaceintroduction;
  String? OpeningsHours;
  String? Holiday;
  //Room Item 어떻게 할 것인지?
  String? RoomItem;

  int? price;
  String? SpaceOwnerName;
  String? SpaceLocation;
  String? SpaceOwnerCompanyNumber;
  String? SpaceOnwerCompanyPhoneNumber;

  SpecificParameter({
    this.price = 100000,
    this.imgurl = 'images/imgs/wws.jpeg',
    this.SpaceName = '???',
    this.Spaceintroduction,
    this.OpeningsHours = '9:00 ~ 1900',
    this.Holiday = '토 일',
    this.RoomItem = '',
    this.SpaceOwnerName ='김김김',
    this.SpaceLocation = '경기도 시흥시 시재로 19성윤빌딩 5층 502호',
    this.SpaceOwnerCompanyNumber = '12345678900',
    this.SpaceOnwerCompanyPhoneNumber = '01062495493'
  });
}






class ToReservArgument {
  TextEditingController DataTimeEditingController; // DateTimepciker
  TextEditingController InitTimeEditngController;
  TextEditingController EndTimeEditingController;
  TextEditingController TotalRentTIme;
  ToReservArgument(
      this.DataTimeEditingController,
      this.InitTimeEditngController,
      this.EndTimeEditingController,
      this.TotalRentTIme
      );
}

