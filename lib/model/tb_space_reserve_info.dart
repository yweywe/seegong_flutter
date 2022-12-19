class tb_space_reserve_info {
  String? spaceNo;
  String? defaultTime;
  String? lendStartTime;
  String? lendEndTime;
  String? weekLendStartTime;
  String? weekLendEndTime;

  tb_space_reserve_info(
      {this.spaceNo,
        this.defaultTime,
        this.lendStartTime,
        this.lendEndTime,
        this.weekLendStartTime,
        this.weekLendEndTime});

  tb_space_reserve_info.fromJson(Map<String, dynamic> json) {
    spaceNo = json['space_no'];
    defaultTime = json['default_time'];
    lendStartTime = json['lend_start_time'];
    lendEndTime = json['lend_end_time'];
    weekLendStartTime = json['week_lend_start_time'];
    weekLendEndTime = json['week_lend_end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['space_no'] = this.spaceNo;
    data['default_time'] = this.defaultTime;
    data['lend_start_time'] = this.lendStartTime;
    data['lend_end_time'] = this.lendEndTime;
    data['week_lend_start_time'] = this.weekLendStartTime;
    data['week_lend_end_time'] = this.weekLendEndTime;
    return data;
  }
}
