import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'; // 나중에 삭제
import 'package:seegong_flutter/kakao_auth_module.dart';
import 'package:seegong_flutter/screens/LoginScreen.dart';
import 'package:seegong_flutter/screens/ReservationList.dart';

/// 네비게이션 메뉴 표시 전용 위젯
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    Key? key,
  }) : super(key: key);

  get kakaoAuth => KakaoAuthModule(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// 상단부 계정 헤더
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/imgs/wws.jpeg'),
              ),
              accountEmail: Text('test@gmail.com'),
              accountName: Text('testName'),
              onDetailsPressed: () {
                print('press details');
                Navigator.pop(context);
              },
              decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
            ),

            /// 본문 아이콘 나열
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('공지사항'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('도움말'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("예약내역"),
              onTap: () {
                Navigator.pushNamed(context, ReservationList.routename);
                //Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text("문의하기"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            /// 로그아웃 버튼 시작
            Divider(height: 32, color: Colors.transparent, thickness: 32),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
              child: ElevatedButton(
                onPressed: () async {
                  await kakaoAuth.logout();
                  if (!kakaoAuth.isLogined) {
                    Navigator.pushNamed(context, '/');
                  }
                  //setState(() {});
                },
                child: Text("로그아웃"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
              ),
            ),

            /// 디버그
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
              child: ElevatedButton(
                onPressed: () async {
                  kakaoAuth.printInfo();
                  //setState(() {});
                },
                child: Text("디버그 : 카카오 정보 출력"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
