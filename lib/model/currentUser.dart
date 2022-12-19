class CurrentUser {
  String? userToken;
  String? email;
  String? userProfile;
  String? userName;
  String? gender;
  String? userageRange;
  String? birthday;

  CurrentUser(
      {this.userToken,
        this.email,
        this.userProfile,
        this.userName,
        this.gender,
        this.userageRange,
        this.birthday});

  CurrentUser.fromJson(Map<String, dynamic> json) {
    userToken = json['UserToken'];
    email = json['Email'];
    userProfile = json['UserProfile'];
    userName = json['UserName'];
    gender = json['gender'];
    userageRange = json['UserageRange'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserToken'] = this.userToken;
    data['Email'] = this.email;
    data['UserProfile'] = this.userProfile;
    data['UserName'] = this.userName;
    data['gender'] = this.gender;
    data['UserageRange'] = this.userageRange;
    data['birthday'] = this.birthday;
    return data;
  }
}