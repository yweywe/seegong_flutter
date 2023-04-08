class tb_space_desc {
  String? spaceNo;
  String? descType;
  String? useYn;
  String? defaultTabYn;
  String? tabTitle;
  String? description;

  tb_space_desc(
      {this.spaceNo,
        this.descType,
        this.useYn,
        this.defaultTabYn,
        this.tabTitle,
        this.description});

  tb_space_desc.fromJson(Map<String, dynamic> json) {
    spaceNo = json['space_no'];
    descType = json['desc_type'];
    useYn = json['use_yn'];
    defaultTabYn = json['default_tab_yn'];
    tabTitle = json['tab_title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['space_no'] = this.spaceNo;
    data['desc_type'] = this.descType;
    data['use_yn'] = this.useYn;
    data['default_tab_yn'] = this.defaultTabYn;
    data['tab_title'] = this.tabTitle;
    data['description'] = this.description;
    return data;
  }
}