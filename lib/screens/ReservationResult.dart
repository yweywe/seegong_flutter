import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/etc/ReserveTextClass.dart';

import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/NavigationMenu.dart';
import 'package:seegong_flutter/viewModel/LoginViewModel.dart';
import 'package:seegong_flutter/viewModel/SpaceViewModel.dart';


class ResultScreen extends StatefulWidget {
  static const routename = "/ResultScreen";
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(CurrentUserViewModel());
    return GetBuilder<SpaceViewModel>(
      init: new SpaceViewModel(),
      builder: (_) {
        return Scaffold(

          appBar: Appbarseegong,
          /// 앱바
          drawer: NavigationMenu(),

          /// 내비게이션(햄버거) 메뉴
          body: SafeArea(
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
                        image: NetworkImage("${_.currentSpace.space_image}"), // tb_space.space_image
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
                        description: '${_.userRecipt?.planSeq}',),
                      DescriptBold(context: context,
                        subject: '장소 이름',
                        description: '${_.currentSpace.space_name}',),
                      DescriptBold(
                        context: context, subject: '가격', description: '${_.currentSpace.free_yn}',),
                      DescriptBold(
                        context: context, subject: '시간', description: '${_.useTotalTIme}',),
                      DescriptBold(context: context,
                        subject: '예약 날짜',
                        description: '${_.userRecipt?.useDate}',),
                      DescriptBold(
                        context: context, subject: '예약 인원', description: '${_.userRecipt?.useCount}',),
                      DescriptBold(
                        context: context, subject: '요청 사항', description: '${_.userRecipt?.usePurpose}',),
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
                        context: context, subject: '이름', description: '${_.userRecipt?.userNm}',),
                      DescriptBold(context: context,
                        subject: '전화 번호',
                        description: '${_.userRecipt?.mobilephone}',),
                      DescriptBold(context: context,
                        subject: '이메일',
                        description: '${_.userRecipt?.email}',),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(23.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadText(headText: '공간 정보'),
                      DescriptLight(subject: '공간 상호', description: '${_.currentSpace.space_name}'),
                      DescriptLight(subject: '대표자 명', description: '${_.currentSpace.space_manager}'),
                      DescriptLight(subject: '소재지', description: '${_.currentSpace.addr}'),
                      DescriptLight(subject: '사업자 번호', description: '12312653'), //사업자 번호 못함
                      DescriptLight(subject: '연락처', description: '${_.currentSpace.mobile_phone}'),

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
                    navController.returnMainScreen();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: ColorButton(buttonText:'메인으로 돌아가기',),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}