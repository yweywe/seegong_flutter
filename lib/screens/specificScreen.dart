import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/etc/ReserveTextClass.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/viewModel/CalendarVIewModel.dart';
import 'package:seegong_flutter/viewModel/MapViewModel.dart';
import 'package:seegong_flutter/viewModel/SpaceViewModel.dart';
import 'package:seegong_flutter/viewModel/Widget.dart';
import 'NavigationMenu.dart';

class SpecificScreen extends StatefulWidget {
  const SpecificScreen({Key? key}) : super(key: key);
  static const routename = '/SpecificScreen';

  @override
  State<SpecificScreen> createState() => _SpecificScreenState();
}

class _SpecificScreenState extends State<SpecificScreen> {


  String AlertMessageFromSeegong = "3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가";
  String RefundPolicyInformation = "이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarViewModel>(
      init: new CalendarViewModel(),
      builder: (__) {
        return GetBuilder<SpaceViewModel>(
          init: new SpaceViewModel(),
          builder: (_) {
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
                            //image: AssetImage('${t1.imgurl}')
                            image: AssetImage('images/icons/wws.jpeg')
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
                                      '${_.currentSpace.space_name}', // 작은 천사들 교육장 / 장소 명
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
                                              '${_.currentSpace.addr}',
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
                                              '${_.currentSpace.mobile_phone}',
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
                            SizedBox(height: 20,),


                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 100,
                              child: GestureDetector(
                                  onTap: (){
                                    __.SpecificCalenderView(context); // 날짜 선택
                                  },
                                  child: TextIf(context, '희망 날짜', __.reserveDate.DataTimeEditingController, 15)
                              ),
                            ),
                            Expanded(flex: 5, child: SizedBox()),
                            Expanded(
                              flex: 100,
                              child: GestureDetector(
                                  onTap: (){
                                    __.setUsageTime(context);
                                  },
                                  child: TextIf( context, '시작 시간 선택', __.reserveDate.InitTime, 15)
                              ),
                            ),
                            Expanded(flex: 5, child: SizedBox()),
                            Expanded(
                              flex: 100,
                              child: GestureDetector(
                                  onTap: (){
                                    __.setUsageTime(context);
                                  },
                                  child: TextIf( context, '종료 시간 선택', __.reserveDate.EndTime, 15)
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 30,),
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
                                    DescriptLight(subject: '가격 / 시간', description: '${_.currentSpace.base_payInfo} / 1시간'),
                                  ],
                                ), SizedBox(height: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadText(headText: '환불시 주의사항'),
                                    DescriptCaution(descrpitText: '${_.alertMessage}'),
                                  ],
                                ),
                                SizedBox(height: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadText(headText: '환불시 주의사항'),
                                    DescriptCaution(descrpitText: '${_.refundPolicyInformation}'),
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
                        if (__.reserveDate.TotalRentTIme != "")
                          _.getReservation();
                        else
                          _.alertCheckReservationItem();
                      },
                    ),
                  ),



                ],
              ),
            );
          }
        );
      }
    );
  }

}
