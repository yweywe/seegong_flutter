

class tb_space {
  String? space_no;
  String? space_se;
  String? space_name;
  String? category_no;
  String? detail_category_no;
  String? space_manager;
  String? contact_tel;
  String? mobile_phone;
  String? sms_receiveYn;
  String? sms_send_yn;
  String? zip;
  String? addr;
  String? addr_dong;
  String? addr_detail;
  String? position_dong;
  String? athletic_yn;
  String? sub_space_yn;
  String? manage_regident_yn;
  String? capacity;
  String? coordinate_latitude;
  String? coordinate_longitude;
  String? free_yn;
  String? base_payInfo;
  String? use_guide_yn;
  String? facility_status_yn;
  String? reserve_alertYn;
  String? user_observance_yn;
  String? rent_possible_yhing_yn;
  String? open_yn;
  String? reserve_yn;
  String? reg_date;
  String? reg_user;
  String? upd_date;
  String? upd_user;
  String? space_image;

  tb_space(
      {this.space_no,
        this.space_se,
        this.space_name,
        this.category_no,
        this.detail_category_no,
        this.space_manager,
        this.contact_tel,
        this.mobile_phone,
        this.sms_receiveYn,
        this.sms_send_yn,
        this.zip,
        this.addr,
        this.addr_dong,
        this.addr_detail,
        this.position_dong,
        this.athletic_yn,
        this.sub_space_yn,
        this.manage_regident_yn,
        this.capacity,
        this.coordinate_latitude,
        this.coordinate_longitude,
        this.free_yn,
        this.base_payInfo,
        this.use_guide_yn,
        this.facility_status_yn,
        this.reserve_alertYn,
        this.user_observance_yn,
        this.rent_possible_yhing_yn,
        this.open_yn,
        this.reserve_yn,
        this.reg_date,
        this.reg_user,
        this.upd_date,
        this.upd_user,
        this.space_image,
      });

  tb_space.fromJson(Map<String, dynamic> json) {
    space_no = json['space_no'];
    space_se = json['space_se'];
    space_name = json['space_name'];
    category_no = json['category_no'];
    detail_category_no = json['detail_category_no'];
    space_manager = json['space_manager'];
    contact_tel = json['contact_tel'];
    mobile_phone = json['mobile_phone'];
    sms_receiveYn = json['sms_receive_yn'];
    sms_send_yn = json['sms_send_yn'];
    zip = json['zip'];
    addr = json['addr'];
    addr_dong = json['addr_dong'];
    addr_detail = json['addr_detail'];
    position_dong = json['position_dong'];
    athletic_yn = json['athletic_yn'];
    sub_space_yn = json['sub_space_yn'];
    manage_regident_yn = json['manage_regident_yn'];
    capacity = json['capacity'];
    coordinate_latitude = json['coordinate_latitude'];
    coordinate_longitude = json['coordinate_longitude'];
    free_yn = json['free_yn'];
    base_payInfo = json['base_pay_info'];
    use_guide_yn = json['use_guide_yn'];
    facility_status_yn = json['facility_status_yn'];
    reserve_alertYn = json['reserve_alert_yn'];
    user_observance_yn = json['user_observance_yn'];
    rent_possible_yhing_yn = json['rent_possible_thing_yn'];
    open_yn = json['open_yn'];
    reserve_yn = json['reserve_yn'];
    reg_date = json['reg_date'];
    reg_user = json['reg_user'];
    upd_date = json['upd_date'];
    upd_user = json['upd_user'];
    space_image = json['space_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['space_no'] = this.space_no;
    data['space_se'] = this.space_se;
    data['space_name'] = this.space_name;
    data['category_no'] = this.category_no;
    data['detail_category_no'] = this.detail_category_no;
    data['space_manager'] = this.space_manager;
    data['contact_tel'] = this.contact_tel;
    data['mobile_phone'] = this.mobile_phone;
    data['sms_receive_yn'] = this.sms_receiveYn;
    data['sms_send_yn'] = this.sms_send_yn;
    data['zip'] = this.zip;
    data['addr'] = this.addr;
    data['addr_dong'] = this.addr_dong;
    data['addr_detail'] = this.addr_detail;
    data['position_dong'] = this.position_dong;
    data['athletic_yn'] = this.athletic_yn;
    data['sub_space_yn'] = this.sub_space_yn;
    data['manage_regident_yn'] = this.manage_regident_yn;
    data['capacity'] = this.capacity;
    data['coordinate_latitude'] = this.coordinate_latitude;
    data['coordinate_longitude'] = this.coordinate_longitude;
    data['free_yn'] = this.free_yn;
    data['base_pay_info'] = this.base_payInfo;
    data['use_guide_yn'] = this.use_guide_yn;
    data['facility_status_yn'] = this.facility_status_yn;
    data['reserve_alert_yn'] = this.reserve_alertYn;
    data['user_observance_yn'] = this.user_observance_yn;
    data['rent_possible_thing_yn'] = this.rent_possible_yhing_yn;
    data['open_yn'] = this.open_yn;
    data['reserve_yn'] = this.reserve_yn;
    data['reg_date'] = this.reg_date;
    data['reg_user'] = this.reg_user;
    data['upd_date'] = this.upd_date;
    data['upd_user'] = this.upd_user;
    data['space_image'] = this.space_image;
    return data;
  }
}
