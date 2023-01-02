import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:seegong_flutter/model/currentUser.dart';
import 'package:seegong_flutter/screens/LoginScreen.dart';
import 'package:seegong_flutter/screens/SpaceSelect.dart';
import 'package:seegong_flutter/viewModel/CalendarVIewModel.dart';
import 'package:seegong_flutter/viewModel/SpaceViewModel.dart';

class CurrentUserViewModel extends GetxController{
  late Rx<CurrentUser> user = new CurrentUser().obs;

  void delLiveData() {
    Get.delete<CalendarViewModel>();
    Get.delete<SpaceViewModel>();
  }


  //로그아웃
  void logout() async{
    await UserApi.instance.logout();
    delLiveData();
    Get.offAll(LoginScreen());
  }

  void returnMainScreen() {
    delLiveData();
    Get.offAll(SpaceSelect());

  }

  //토큰 확인
  Future<bool> isToken() async{
    return await AuthApi.instance.hasToken();
  }

  ///CheckApp if App have token -> go SpaceSelectScreen
  Future<dynamic> checkTokeninAPP() async{
    if (await isToken()) {
      User user = await UserApi.instance.me(); //Kakao auth User
      validLogin(user);
      Get.offAll(SpaceSelect());
    }
    else {
      return '123';
    }
  }

  ///KakaoLogin()
  void kakaoLogin() async{
    //토큰 조회
    if (await isToken()) {
      try {
        AccessTokenInfo tokenInfo =
        await UserApi.instance.accessTokenInfo();
        print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');

      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료 $error');
        } else {
          print('토큰 정보 조회 실패 $error');
        }
        //토큰이 만료되거나 토큰 정보 조회 실패시(휴대폰 내장 토큰 검사)
        try {
          // 카카오 계정으로 재로그인
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('로그인 성공 ${token.accessToken}');
        } catch (error) {
          print('로그인 실패 $error');
        }
      }
    } else {
      //앱에서 토큰을 발급받지 않았을 경우
      print('발급된 토큰 없음');
      try {
        //카카오 로그인 실행
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();

        User user = await UserApi.instance.me(); //Kakao auth User
        validLogin(user);
        await setNewUserToFirebase(user);
        Get.offAll(SpaceSelect());
        print('로그인 성공 ${token.accessToken}');
      } catch (error) {
        print('로그인 실패 $error');
      }
    }
  }


  ///Post new membert imformation to server(FirebaseRealtimeDatabase)
  setNewUserToFirebase(User user) async{
    var ref = FirebaseDatabase.instance.ref('userToken');
    ref.update(
        {
          "${user.id}" : {
            'email' : "${user.kakaoAccount?.email.toString()}",
            "UserProfile": "${user.kakaoAccount?.profile?.profileImageUrl.toString()}",
            "UserName": "${user.kakaoAccount?.profile?.nickname.toString()}",
            "gender": "${user.kakaoAccount?.gender.toString()}",
            "UserageRange": "${user.kakaoAccount?.ageRange.toString()}",
            "birthday": "${user.kakaoAccount?.birthday.toString()}"
          }
        }
    );
  }


  ///Create New Current User(While Using App)
  void validLogin(User user) {
    updateCurrentUser(
        userToken: '${user.id}',
        email: '${user.kakaoAccount?.email}',
        userName: '${user.kakaoAccount?.profile?.nickname}',
        userPforile: '${user.kakaoAccount?.profile?.profileImageUrl}',
        gender: '${user.kakaoAccount?.gender}',
        userageRange: '${user.kakaoAccount?.ageRange}',
        birthday: '${user.kakaoAccount?.birthday}');
  }
  updateCurrentUser(
      {
        required String userToken,
        required String email,
        required String userName,
        required String userPforile,
        required String gender,
        required String userageRange,
        required String birthday}) {
    user.update((val) {
      user.value.userToken = userToken;
      user.value.email = email;
      user.value.userName = userName;
      user.value.userProfile = userPforile;
      user.value.gender = gender;
      user.value.userageRange = userageRange;
      user.value.birthday = birthday;
    });
  }
}