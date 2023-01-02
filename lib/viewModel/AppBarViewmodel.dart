import 'package:get/get.dart';
import 'package:seegong_flutter/screens/ReservationList.dart';
import 'package:seegong_flutter/screens/SpaceSelect.dart';

class AppBarViewMdoel extends GetxController {
  String NoticeUrl = "https://share.siheung.go.kr/board/board_list.do?gidx=0001&pageIndex=1&key=105000"; ///공지사항 URL
  String HelpUrl = "https://share.siheung.go.kr/contents/contents.do?gidx=130102&key=102000"; ///도움말 URL
  String Tel = "tel:0313106043"; ///문의 전화번호

  void getReservationList() {
    Get.to(() => ReservationList());
  }

  //메인화면으로 이동
  void getSpaceSelect() {
    Get.offAll(SpaceSelect());
  }

}