import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/etc/ReserveTextClass.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/NavigationMenu.dart';
import 'package:seegong_flutter/screens/ReservationResult.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';
import 'package:seegong_flutter/viewModel/CalendarVIewModel.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);
  static const routename = '/ReservationScreen';

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  var t1 = SpecificParameter(
    imgurl: 'images/icons/wws.jpeg',
    SpaceName: '작은 천사들 교육장',
    Spaceintroduction: '회의실 혹은 강의실로 사용할 수 있습니다.',
  );

  // 미사용 변수?
  // String AlertMessageFromSeegong = "3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가";
  // String RefundPolicyInformation = "이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // var SmallFontSize = size.width / 30; // 미사용 변수?

    return Scaffold(
      appBar:  Appbarseegong,
      drawer: NavigationMenu(),
      body: SafeArea(
        child: Column(
          children: [
            GetBuilder<CalendarViewModel>(
              init: CalendarViewModel(),
              builder: (_) {
                return Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(23.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('${t1.SpaceName}', style: TextStyle(fontSize: size.width / 22, fontWeight: FontWeight.w700, letterSpacing: -1),),
                                  Text('${t1.price}', style: TextStyle(fontSize: size.width / 22,fontWeight: FontWeight.w700, letterSpacing: -1),),
                                  Text('${_.reserveDate.TotalRentTIme}', style: TextStyle(fontSize: size.width / 22,fontWeight: FontWeight.w700, letterSpacing: -1),),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 40,
                            ),

                            /// 공간 및 예약 정보
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadText(headText: '예약 내용'),
                                  DescriptBold(context: context, subject: '장소 이름', description: '작은 천사들'), /// tb_space -> space_name => 공간 고유번호가 아니므로 이후 사용하지 않음
                                  DescriptBold(context: context, subject: '가격', description: '300,000'), /// tb_space_price -> default_fee_r 혹은 tb_space -> free_yn => tb_space_receipt -> use_amount
                                  DescriptBold(context: context, subject: '시간', description: '2시간'), /// model에 있는 정보 끼우기 => 이 정보를 그대로 넣지 않고 model에 있는 정보를 사용
                                  DescriptBold(context: context, subject: '예약 날짜', description: '2022.12.25 (토)'), /// model에 있는 정보 끼우기 => tb_space_receipt -> use_date
                                  DescriptBold(context: context, subject: '예약 인원', description: '2명'), /// model에 있는 정보 끼우기 => tb_space_receipt -> use_count
                                ],
                              ),
                            ),

                            SizedBox(height: 20,),


                            /// 사용자 정보
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadText(headText: '에약자 정보'),
                                SizedBox(height: 15,),
                                ReserveTextFiled(textformSubject: '이름', textformHint: '이름을 입력하세요'), /// tb_space_receipt -> user_nm
                                ReserveTextFiled(textformSubject: '연락처', textformHint: '연락처를 입력하세요'), /// tb_space_receipt -> mobilephone
                                ReserveTextFiled(textformSubject: '이메일', textformHint: '이메일을 입력하세요'), /// tb_space_receipt -> email
                                ReserveTextFiled(textformSubject: '사용목적', textformHint: '사용목적을 입력하세요'), /// tb_space_receipt -> use_purpose
                                ReserveTextFiled(textformSubject: '요청사항', textformHint: '요청사항을 입력하세요', maxline: 5,), /// tb_space_receipt -> remark
                              ],
                            ),
                            SizedBox(height: 35,),

                            /// tb_space -> base_pay_info 사용?
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadText(headText: '환불시 주의사항'),
                                DescriptCaution(descrpitText: '3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가'),
                              ],
                            ),SizedBox(height: 30,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadText(headText: '예약시 주의사항'),
                                DescriptCaution(descrpitText: '이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.'),
                                SizedBox(height: 35,),
                              ],
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () { /// todo: model에 넣고 파베로 전송하는 로직 필요
                          Navigator.pushNamed(context, ResultScreen.routename);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: ColorButton(buttonText:'에약 신청하기',),
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ],
        ),
      ),

    );
  }
}