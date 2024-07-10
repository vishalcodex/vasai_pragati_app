class Locker {
  String? branchName;
  String? lockerId;
  String? keyNo;
  String? memberName;
  String? safeNo;
  String? category;
  String? dateFrom;
  String? linkDeposite;
  String? nomineeName;
  String? rent;
  String? modeOfOperation;
  String? joinMemberName;

  Locker(
      {this.branchName,
      this.lockerId,
      this.keyNo,
      this.memberName,
      this.safeNo,
      this.category,
      this.dateFrom,
      this.linkDeposite,
      this.nomineeName,
      this.rent,
      this.modeOfOperation,
      this.joinMemberName});

  Locker.fromJson(Map<String, dynamic> json) {
    branchName = json['branch_name'];
    lockerId = json['locker_id'];
    keyNo = json['key_no'];
    memberName = json['member_name'];
    safeNo = json['safe_no'];
    category = json['category'];
    dateFrom = json['date_from'];
    linkDeposite = json['link_deposite'];
    nomineeName = json['nominee_name'];
    rent = json['rent'];
    modeOfOperation = json['mode_of_operation'];
    joinMemberName = json['join_member_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_name'] = this.branchName;
    data['locker_id'] = this.lockerId;
    data['key_no'] = this.keyNo;
    data['member_name'] = this.memberName;
    data['safe_no'] = this.safeNo;
    data['category'] = this.category;
    data['date_from'] = this.dateFrom;
    data['link_deposite'] = this.linkDeposite;
    data['nominee_name'] = this.nomineeName;
    data['rent'] = this.rent;
    data['mode_of_operation'] = this.modeOfOperation;
    data['join_member_name'] = this.joinMemberName;
    return data;
  }
}
