class Notification {
  int? id;
  String? trnDate;
  String? membregNo;
  String? notification;

  Notification({this.id, this.trnDate, this.membregNo, this.notification});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trnDate = json['trn_date'];
    membregNo = json['membreg_no'];
    notification = json['notification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trn_date'] = this.trnDate;
    data['membreg_no'] = this.membregNo;
    data['notification'] = this.notification;
    return data;
  }
}
