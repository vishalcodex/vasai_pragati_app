class InterestCertificate {
  String? financialYear;
  String? membregNo;
  String? accountId;
  String? amount;
  String? provision;
  String? interest;
  String? balance;
  String? recno;
  String? srno;

  InterestCertificate(
      {this.financialYear,
      this.membregNo,
      this.accountId,
      this.amount,
      this.provision,
      this.interest,
      this.balance,
      this.recno,
      this.srno});

  InterestCertificate.fromJson(Map<String, dynamic> json) {
    financialYear = json['Financial_Year'];
    membregNo = json['membreg_no'];
    accountId = json['Account_id'];
    amount = json['Amount'];
    provision = json['Provision'];
    interest = json['Interest'];
    balance = json['Balance'];
    recno = json['recno'];
    srno = json['srno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Financial_Year'] = this.financialYear;
    data['membreg_no'] = this.membregNo;
    data['Account_id'] = this.accountId;
    data['Amount'] = this.amount;
    data['Provision'] = this.provision;
    data['Interest'] = this.interest;
    data['Balance'] = this.balance;
    data['recno'] = this.recno;
    data['srno'] = this.srno;
    return data;
  }
}
