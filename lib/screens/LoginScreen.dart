import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:seegong_flutter/kakao_auth_module.dart';
import 'package:seegong_flutter/model/controller.dart';
import 'package:seegong_flutter/model/currentUser.dart';
import 'package:seegong_flutter/screens/Reservation.dart';
import 'package:seegong_flutter/screens/ReservationResult.dart';
import 'package:seegong_flutter/screens/SpaceListScreen.dart';
import 'package:seegong_flutter/screens/SpaceSelect.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  final kakaoAuth = KakaoAuthModule(KakaoLogin());
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final currentUserController = Get.put(UserController());

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
                      child:
                      GestureDetector(
                        onTap: () async{
                          print(kakaoAuth.isLogined);
                        },
                        child: const Text(
                          "로그인하여 시작하세요",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      // TODO Add Google login button
                      // TODO Follow Google's design guide
                    ),
                    /*Image.network(
                        viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
                    Text(
                      '${viewModel.isLogined}',
                      style: Theme.of(context).textTheme.headline4,
                    ),*/
                    ElevatedButton(
                      onPressed: () async {
                        await kakaoAuth.login();
                        //setState(() {});
                        if(kakaoAuth.isLogined) {
                          User user = await UserApi.instance.me();
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
                          // var value = await ref.orderByValue().equalTo('path').get();
                          // print('값이 있음?');
                          // print(value.value);
                          currentUserController.updateUser(
                              userToken: '${user.id}',
                              email: '${user.kakaoAccount?.email}',
                              userName: '${user.kakaoAccount?.profile?.nickname}',
                              userPforile: '${user.kakaoAccount?.profile?.profileImageUrl}',
                              gender: '${user.kakaoAccount?.gender}',
                              userageRange: '${user.kakaoAccount?.ageRange}',
                              birthday: '${user.kakaoAccount?.birthday}');
                          Navigator.pushNamed(context, SpaceSelect.routename);
                        }
                      },
                      child: const Text('Login'),
                    ),/*
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, SpaceSelect.routename);
                        //setState(() {});
                      },
                      child: const Text('Login생략'),
                    ),*/
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}