import 'package:get/get.dart';
import 'package:seegong_flutter/model/currentUser.dart';

class UserController extends GetxController{

  var user = new CurrentUser().obs;

  updateUser(
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