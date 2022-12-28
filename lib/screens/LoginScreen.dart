import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/viewModel/LoginViewModel.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final currentUserController = Get.put(CurrentUserViewModel());
    return Scaffold(
      body: FutureBuilder(
        future: currentUserController.checkTokeninAPP(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.hasError.toString()}'),);
          }
          else
            {
              return Center(
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/glob_top_img_none.png',
                        ),
                              {
                        Divider(height: 64, color: Colors.transparent),
                        Container(
                          width: 295,
                          height: 45,
                          child: OutlinedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('images/icons/kakao_small.png'),
                                GestureDetector(
                                  onTap: () {
                                    currentUserController.kakaoLogin();
                                  },
                                  child: Text(
                                    "카카오 로그인",
                                    style: TextStyle(color: Colors.black),
                                  ),
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
                          margin: EdgeInsets.only(top: 15),
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
                        Divider(height: 48, color: Colors.transparent),
                        Column(
                          children: [
                            Text(
                              "또는",
                              style: TextStyle(
                                  fontSize: 14, color: Color.fromRGBO(102, 102, 102, 0.5)),
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
                        )
                      ],
                    )),
              );
            }
        }
      ),
    );
  }
}
