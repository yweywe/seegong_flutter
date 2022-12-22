import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seegong_flutter/screens/Reservation.dart';
import 'package:seegong_flutter/screens/ReservationResult.dart';
import 'package:seegong_flutter/screens/SpaceListScreen.dart';
import 'SpaceSelect.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/glob_top_img_none.png',
                ),
                Divider(height: 64, color: Colors.transparent),
                Container(
                  width: 295,
                  height: 45,
                  child: OutlinedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/icons/kakao_small.png'),
                        Text(
                          "카카오 로그인",
                          style: TextStyle(color: Colors.black),
                        ),
                        Image.asset('images/icons/angle-right.png'),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 230, 23, 1),
                    ),
                    onPressed: null,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:15),
                  width: 295,
                  height: 45,
                  child: OutlinedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/icons/google_small.png'),
                        Text(
                          "구글 로그인",
                          style: TextStyle(color: Colors.black),
                        ),
                        Image.asset('images/icons/angle-right.png'),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: null,
                  ),
                ),
                /// 기존 코드
                /*
                SizedBox(
                  width: 295,
                  height: 55,
                  child: IconButton(
                    //icon: SvgPicture.asset("images/icons/login_cent_btn_kakao.svg"),
                    icon: Image.asset("images/icons/login_cent_btn_kakao.png"),
                    onPressed: () {
                      // Todo: 카카오 로그인 기능 결합
                      Navigator.pushNamed(context, SpaceSelect.routename);
                    },
                    // iconSize: 295,
                  ),
                ),
                SizedBox(
                  width: 295,
                  height: 55,
                  child: IconButton(
                    //icon: SvgPicture.asset("images/icons/login_cent_btn_google.svg"),
                    icon: Image.asset("images/icons/login_cent_btn_google.png"),
                    onPressed: () {
                      // Todo: 카카오 로그인 기능 결합
                      Navigator.pushNamed(context, SpaceSelect.routename);
                    },
                    // iconSize: 295,
                  ),
                ),
                */
                Divider(height: 48, color: Colors.transparent),
                Column(
                  children: [
                    Text(
                      "또는",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(102, 102, 102, 0.5)),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "이메일로 로그인하기",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              color: Color.fromRGBO(102, 102, 102, 1)),
                        ))
                  ],
                ),
                Divider(height: 80, color: Colors.transparent),
                SvgPicture.asset(
                  "images/imgs/glob_bott_img_shtuklogo.svg",
                  width: 206,
                  height: 33,
                ),
                // ElevatedButton(
                //   child: const Text('Google Login Button'),
                //   onPressed: () {
                //     // Navigator.pushNamed(context, ResultScreen.routename);
                //
                //     // Todo: 결과화면 제작 완료시 밑의 네비게이터로 전환
                //     Navigator.pushNamed(context, SpaceSelect.routename);
                //   },
                // ),
                //
                // ElevatedButton(onPressed: () async{
                //   DatabaseReference ref = FirebaseDatabase.instance.ref("SpaceSelect/SpaceName");
                //   await ref.set({
                //     "0" : {
                //       "name" : "강의실"
                //     },
                //     "1" : {
                //       "name" : "잔디구장"
                //     },
                //     "2" : {
                //       "name" : "연습실 학원"
                //     },
                //     "3" : {
                //       "name" : "풋살장"
                //     },
                //     "4" : {
                //       "name" : "모임터 카페"
                //     }
                //   });
                // }, child: Text('세팅')),
              ],
            )
          ],
        )),
      ),
    );
  }
}
