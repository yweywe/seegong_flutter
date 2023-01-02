
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:seegong_flutter/model/tb_space.dart';

tb_space tb = new tb_space(
  space_no: "1",
  space_se: "공유자원",
  space_name: "작은 천사들",
  category_no: "3",
  space_manager: "엄영욱",
  contact_tel: "010-6249-5493",
  mobile_phone: "010-6249-5493",
  sms_receiveYn: "Y",
  sms_send_yn: "Y",
  zip: "14998",
  addr: "경기 시흥시 새재로 19 윤성빌딩 502호",
  addr_dong: "새재로 19 윤성빌딩",
  addr_detail: "502호",
  position_dong: "",
  athletic_yn: "N",
  sub_space_yn: "Y",
  manage_regident_yn: "Y",
  capacity: "30",
  coordinate_latitude: "123123",
  coordinate_longitude: "123123",
  free_yn: "Y",
  base_payInfo: "N",
  use_guide_yn: "Y",
  facility_status_yn: "Y",
  reserve_alertYn: "Y",
  user_observance_yn: "Y",
  rent_possible_yhing_yn: "Y",
  open_yn: "Y",
  reserve_yn: "Y",
  reg_date: "2010.05.05",
  detail_category_no: "1",
  reg_user: "seeso@naver.com",
  upd_date: "2010.05.05",
  upd_user: "wws"
);

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: ()async{
          DatabaseReference ref = FirebaseDatabase.instance.ref('tb_space');
          var temp = await ref.get();
          List<dynamic> value = temp.value as List<dynamic>;
          int index = value.length;
          ref.update({
            "$index" : jsonDecode(jsonEncode(tb))
          });
        },
        child: Text('눌러'),
      ),
    );
  }
}
