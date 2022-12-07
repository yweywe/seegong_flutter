import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seegong_flutter/screens/Reservation.dart';
import 'package:seegong_flutter/screens/ReservationResult.dart';
import 'package:seegong_flutter/screens/SpaceListScreen.dart';
import 'SpaceSelect.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

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
                const Text(
                  "공유 플랫폼 시소",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Text(
                  "당신과 시흥을 잇습니다",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                  padding: EdgeInsets.only(top: 250),
                  child: const Text(
                    "로그인하여 시작하세요",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  child: const Text('Kakao Login Button'),
                  onPressed: () async {
                    // 카카오 로그인 구현 예제

                    // 카카오톡 실행 가능 여부 확인
                    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
                    var loginState = false;
                    if (await isKakaoTalkInstalled()) {
                      try {
                        await UserApi.instance.loginWithKakaoTalk();
                        print('카카오톡으로 로그인 성공');
                        loginState = true;
                      } catch (error) {
                        print('카카오톡으로 로그인 실패 $error');

                        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                        if (error is PlatformException &&
                            error.code == 'CANCELED') {
                          return;
                        }
                        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                        try {
                          await UserApi.instance.loginWithKakaoAccount();
                          print('카카오계정으로 로그인 성공');
                          loginState = true;
                        } catch (error) {
                          print('카카오계정으로 로그인 실패 $error');
                        }
                      }
                    } else {
                      try {
                        await UserApi.instance.loginWithKakaoAccount();
                        print('카카오계정으로 로그인 성공');
                        loginState = true;
                      } catch (error) {
                        print('카카오계정으로 로그인 실패 $error');
                      }
                    }
                    // Todo: 결과화면 제작 완료시 밑의 네비게이터로 전환
                    if (loginState == true) {
                      // Navigator.pushNamed(context, ResultScreen.routename);
                      Navigator.pushNamed(context, SpaceSelect.routename);
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      DatabaseReference ref = FirebaseDatabase.instance
                          .ref("SpaceSelect/SpaceName");
                      await ref.set({
                        "0": {"name": "강의실"},
                        "1": {"name": "잔디구장"},
                        "2": {"name": "연습실 학원"},
                        "3": {"name": "풋살장"},
                        "4": {"name": "모임터 카페"}
                      });
                      Navigator.pushNamed(context, SpaceSelect.routename);
                    },
                    child: Text('세팅')),
              ],
            )
          ],
        )),
      ),
    );
  }
}

abstract class SocialLogin {
  Future<bool> login();
  Future<bool> logout();
}

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}
