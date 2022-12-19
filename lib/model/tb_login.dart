class tb_login {
  String? userId;
  String? userPw;
  String? name;
  String? di;
  String? birthday;
  String? phone;
  String? gender;
  String? lastLogin;
  String? regIp;
  String? lastCert;
  String? wrongCnt;

  tb_login(
      {this.userId,
        this.userPw,
        this.name,
        this.di,
        this.birthday,
        this.phone,
        this.gender,
        this.lastLogin,
        this.regIp,
        this.lastCert,
        this.wrongCnt});

  tb_login.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userPw = json['user_pw'];
    name = json['name'];
    di = json['di'];
    birthday = json['birthday'];
    phone = json['phone'];
    gender = json['gender'];
    lastLogin = json['last_login'];
    regIp = json['reg_ip'];
    lastCert = json['last_cert'];
    wrongCnt = json['wrong_cnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_pw'] = this.userPw;
    data['name'] = this.name;
    data['di'] = this.di;
    data['birthday'] = this.birthday;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['last_login'] = this.lastLogin;
    data['reg_ip'] = this.regIp;
    data['last_cert'] = this.lastCert;
    data['wrong_cnt'] = this.wrongCnt;
    return data;
  }
}
