import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoAuthModule {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  KakaoAuthModule(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }

  /// 디버그용
  Future printInfo() async {
    /*
    try {

      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
      User user = await UserApi.instance.me();
      print('토큰 정보 보기 성공'
          '\n회원정보: ${tokenInfo.id}'
          '\n만료시간: ${tokenInfo.expiresIn} 초');
    } catch (error) {
      print('토큰 정보 보기 실패 $error');
    }
    */
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}' // AccessTokenInfo.id와 동일한 값
          '\n프로필링크: ${user.kakaoAccount?.profile?.profileImageUrl}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
          '\n이메일: ${user.kakaoAccount?.email}'
          '\n성별: ${user.kakaoAccount?.gender}'
          '\n연령대: ${user.kakaoAccount?.ageRange}'
          '\n생일: ${user.kakaoAccount?.birthday}');
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
  }
}

abstract class SocialLogin {
  Future<bool> login();
  Future<bool> logout();
}

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        return true;
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return false;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          return true;
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
          return false;
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        return true;
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
        return false;
      }
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
