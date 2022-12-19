class tb_except_day {
  String? spaceNo;
  String? seq;
  String? exceptTitle;
  String? exceptDate;
  String? alldayYn;
  String? startTime;
  String? endTime;

  tb_except_day(
      {this.spaceNo,
        this.seq,
        this.exceptTitle,
        this.exceptDate,
        this.alldayYn,
        this.startTime,
        this.endTime});

  tb_except_day.fromJson(Map<String, dynamic> json) {
    spaceNo = json['space_no'];
    seq = json['seq'];
    exceptTitle = json['except_title'];
    exceptDate = json['except_date'];
    alldayYn = json['allday_yn'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['space_no'] = this.spaceNo;
    data['seq'] = this.seq;
    data['except_title'] = this.exceptTitle;
    data['except_date'] = this.exceptDate;
    data['allday_yn'] = this.alldayYn;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
