import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/viewModel/LoginViewModel.dart';
import 'package:seegong_flutter/screens/ReservationList.dart';
import 'package:url_launcher/url_launcher.dart';

/// 네비게이션 메뉴 표시 전용 위젯
///
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    Key? key,
  }) : super(key: key);
  static const customDivider = const Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: const Divider(height: 1, color: const Color.fromRGBO(142, 142, 142, 1), thickness: 0.5),
  );
  @override
  Widget build(BuildContext context) {
    final currentUserController = Get.put(CurrentUserViewModel());

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// 상단부 계정 헤더
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('${currentUserController.user.value.userProfile}'),
              radius: 24,
            ),
            accountName: Text('${currentUserController.user.value.userName}', style: TextStyle(fontSize: 17, color: Colors.white),),
            accountEmail: Text('${currentUserController.user.value.email}', style: TextStyle(fontSize: 14, color: Color.fromRGBO(255, 255, 255, 0.4)),),
            onDetailsPressed: () {
              print('press details');
            },
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 55, 128, 1),
            ),
          ),
          Expanded(
            /// 공지사항 등 본문
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                /// 본문 아이콘 나열
                Column(
                  children: [
                    ListTile(
                      // leading: Icon(Icons.notifications),
                      title: Text('공지사항', style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.bold),),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    customDivider,
                    ListTile(
                      // leading: Icon(Icons.help),
                      title: Text('도움말', style: TextStyle(fontSize: 14, color: Color.fromRGBO(51 , 51, 51, 1), fontWeight: FontWeight.bold),),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    customDivider,
                    ListTile(
                      // leading: Icon(Icons.list),
                      title: Text("예약내역", style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.bold),),
                      onTap: (){
                        Navigator.pushNamed(context, ReservationList.routename);
                      },
                    ),
                    customDivider,
                    ListTile(
                      // leading: Icon(Icons.call),
                      title: Text("문의하기", style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 51, 51, 1), fontWeight: FontWeight.bold),),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                /// 로그인 버튼 시작
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 128.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          // todo: 로그아웃 기능 추가
                          currentUserController.logout();
                        },
                        child: Text("로그아웃", style: TextStyle(decoration: TextDecoration.underline)),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Color.fromRGBO(153, 153, 153, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
