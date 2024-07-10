class Interest {
  String? actype;
  String? interest;
  String? periodFr;
  String? periodTo;
  String? months;
  String? wefFr;
  String? wefTo;
  String? rateper100;
  String? category;
  String? rECNO;
  String? subgroupId;

  Interest(
      {this.actype,
      this.interest,
      this.periodFr,
      this.periodTo,
      this.months,
      this.wefFr,
      this.wefTo,
      this.rateper100,
      this.category,
      this.rECNO,
      this.subgroupId});

  Interest.fromJson(Map<String, dynamic> json) {
    actype = json['actype'];
    interest = json['interest'];
    periodFr = json['period_fr'];
    periodTo = json['period_to'];
    months = json['months'];
    wefFr = json['wef_fr'];
    wefTo = json['wef_to'];
    rateper100 = json['rateper100'];
    category = json['category'];
    rECNO = json['RECNO'];
    subgroupId = json['subgroup_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actype'] = this.actype;
    data['interest'] = this.interest;
    data['period_fr'] = this.periodFr;
    data['period_to'] = this.periodTo;
    data['months'] = this.months;
    data['wef_fr'] = this.wefFr;
    data['wef_to'] = this.wefTo;
    data['rateper100'] = this.rateper100;
    data['category'] = this.category;
    data['RECNO'] = this.rECNO;
    data['subgroup_id'] = this.subgroupId;
    return data;
  }
}
