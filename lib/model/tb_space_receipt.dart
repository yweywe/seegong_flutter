class tb_space_receipt {
  String? receiptNo;
  String? spaceNo;
  String? planSeq;
  String? useDate;
  String? useTimeBegin;
  String? useTimeEnd;
  String? userId;
  String? userNm;
  String? userBirthday;
  String? userSex;
  String? email;
  String? mobilephone;
  String? useCount;
  String? usePurpose;
  String? useAmount;
  String? defaultFee;
  String? addFee;
  String? receiptStatus;
  String? agreeDate;
  String? confirmRejectReason;
  String? remark;
  String? regDate;

  tb_space_receipt(
      {this.receiptNo,
        this.spaceNo,
        this.planSeq,
        this.useDate,
        this.useTimeBegin,
        this.useTimeEnd,
        this.userId,
        this.userNm,
        this.userBirthday,
        this.userSex,
        this.email,
        this.mobilephone,
        this.useCount,
        this.usePurpose,
        this.useAmount,
        this.defaultFee,
        this.addFee,
        this.receiptStatus,
        this.agreeDate,
        this.confirmRejectReason,
        this.remark,
        this.regDate});

  tb_space_receipt.fromJson(Map<String, dynamic> json) {
    receiptNo = json['receipt_no'];
    spaceNo = json['space_no'];
    planSeq = json['plan_seq'];
    useDate = json['use_date'];
    useTimeBegin = json['use_time_begin'];
    useTimeEnd = json['use_time_end'];
    userId = json['user_id'];
    userNm = json['user_nm'];
    userBirthday = json['user_birthday'];
    userSex = json['user_sex'];
    email = json['email'];
    mobilephone = json['mobilephone'];
    useCount = json['use_count'];
    usePurpose = json['use_purpose'];
    useAmount = json['use_amount'];
    defaultFee = json['default_fee'];
    addFee = json['add_fee'];
    receiptStatus = json['receipt_status'];
    agreeDate = json['agree_date'];
    confirmRejectReason = json['confirm_reject_reason'];
    remark = json['remark'];
    regDate = json['reg_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receipt_no'] = this.receiptNo;
    data['space_no'] = this.spaceNo;
    data['plan_seq'] = this.planSeq;
    data['use_date'] = this.useDate;
    data['use_time_begin'] = this.useTimeBegin;
    data['use_time_end'] = this.useTimeEnd;
    data['user_id'] = this.userId;
    data['user_nm'] = this.userNm;
    data['user_birthday'] = this.userBirthday;
    data['user_sex'] = this.userSex;
    data['email'] = this.email;
    data['mobilephone'] = this.mobilephone;
    data['use_count'] = this.useCount;
    data['use_purpose'] = this.usePurpose;
    data['use_amount'] = this.useAmount;
    data['default_fee'] = this.defaultFee;
    data['add_fee'] = this.addFee;
    data['receipt_status'] = this.receiptStatus;
    data['agree_date'] = this.agreeDate;
    data['confirm_reject_reason'] = this.confirmRejectReason;
    data['remark'] = this.remark;
    data['reg_date'] = this.regDate;
    return data;
  }
}
