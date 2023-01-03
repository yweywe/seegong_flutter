import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/model/ReservationDayDate.dart';
import 'package:seegong_flutter/model/ReservationTextEditing.dart';
import 'package:seegong_flutter/model/SpaceSelectItemList.dart';
import 'package:seegong_flutter/model/currentUser.dart';
import 'package:seegong_flutter/model/tb_space.dart';
import 'package:seegong_flutter/model/tb_space_receipt.dart';
import 'package:seegong_flutter/screens/Reservation.dart';
import 'package:seegong_flutter/screens/ReservationResult.dart';
import 'package:seegong_flutter/screens/specificScreen.dart';

class SpaceViewModel extends GetxController {
  String alertMessage = "3일전 환불 가능, 2일전 80%, 하루전 50%, 당일 환불 불가";
  String refundPolicyInformation = "이용당일 이후 관련사항은 시설관리자에게 직접 문의 바랍니다. 또한 결제이후 취소시, 시설 관리자와 문의 이후 취소 가능합니다.";
  List<tb_space> spaceListFromFB = [];
  int fbState = 0;
  var spaceItemList = SpaceSelectItemList();
  tb_space currentSpace = new tb_space();
  tb_space_receipt? userRecipt;
  ReseravationTextEditing inputText = new ReseravationTextEditing();


  var useTotalTIme;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    spaceListFromFB = [];
    fbState = 0;
    getSpaceListFromFB();
    currentSpace = new tb_space();
    userRecipt = new tb_space_receipt();
  }

  void matchReciptModel(tb_space space, ReservationDayDate date, CurrentUser user) {
    useTotalTIme = date.TotalRentTIme;
    userRecipt?.spaceNo = space.space_no;
    userRecipt?.receiptNo = "1";
    userRecipt?.planSeq = "${date.DataTimeEditingController}${date.TotalRentTIme}${inputText.name.text}";
    userRecipt?.useDate = "${date.DataTimeEditingController}";
    userRecipt?.useTimeBegin = "${date.InitTime}";
    userRecipt?.useTimeEnd = "${date.EndTime}";
    userRecipt?.userId = "${user.userToken}";
    userRecipt?.userNm = "${inputText.name.text}";
    userRecipt?.userSex = "${user.gender}";
    userRecipt?.email = "${inputText.email.text}";
    userRecipt?.mobilephone = "${inputText.mobilephone.text}"; //휴대폰 정보
    userRecipt?.useCount = "123"; //몇명 이용?
    userRecipt?.usePurpose = "${inputText.usePurpose.text}"; //이용 목적?
    userRecipt?.useAmount = "1234"; //얼마 내야함?
    userRecipt?.defaultFee = "1234"; //??
    userRecipt?.addFee = "1234"; //??
    userRecipt?.receiptStatus = "접수 대기";
    userRecipt?.agreeDate = ""; //승인 날짜
    userRecipt?.confirmRejectReason = ""; //거절 사유
    userRecipt?.remark = "${inputText.remark.text}"; //비고
  }
  void postUserRecipt(ReservationDayDate date, CurrentUser user) async{
    /*
    if (!(inputText.email.text == "") || !(inputText.name.text == "")
        || !(inputText.usePurpose.text.isEmpty == "") || !(inputText.mobilephone.text.isEmpty == ""))
     */
    if ((inputText.email.text.isEmpty) || (inputText.name.text.isEmpty)
      || (inputText.usePurpose.text.isEmpty) || (inputText.mobilephone.text.isEmpty) || (inputText.remark.text.isEmpty))
      {
        alertCheckReservationItem();
      }

    else {
      while (true) {
        DatabaseReference ref = FirebaseDatabase.instance.ref('/receipt');
        var temp = await ref.child('/countReservation').get();
        var value = jsonDecode(jsonEncode(temp.value));
        matchReciptModel(currentSpace, date, user);
        await ref.child('/tb_space_receipt').update(
            {"${value['num']}": jsonDecode(jsonEncode(userRecipt))}); //데이터 삽입

        await ref
            .child('/countReservation')
            .set({"num": "${int.parse(value['num']) + 1}"}); //num update

        var checkTemp =
            await ref.child('/tb_space_receipt/${value['num']}').get();
        var checkValue = jsonDecode(jsonEncode(checkTemp.value));
        if (checkValue['user_id'] == user.userToken) {
          print('정상 입력 완료');
          break;
        } //만약 동시 입력시 어떤 데이터가 읽혔는지 client쪽에서 확인하고, 만약 실패시 while룹을 돈다.

        print("실패했습니다.");
        await Future.delayed(Duration(seconds: 10));
      }

      Get.to(()=> ResultScreen()); //페이지 이동
    }
  }
  void getSpaceDetail(int index) {
    currentSpace = spaceListFromFB[index];
    Get.to(() => SpecificScreen());
  }
  void getReservation() {
    Get.to(() => ReservationScreen());
  }
  void alertCheckReservationItem() {
    Get.snackbar(
      '메시지', '예약 사항을 모두 입력하세요', backgroundColor: Colors.white,
    );
  }

  Future<void> getSpaceListFromFB() async{
    DatabaseReference ref = FirebaseDatabase.instance.ref('tb_space');
    var refValue = await ref.get();
    var value = jsonDecode(jsonEncode(refValue.value));
    for (Map<String, dynamic> i in value) {
      var tempValue = tb_space.fromJson(i);
      spaceListFromFB.add(tempValue);
    }
    fbState = 1;
    update();
  }


}
