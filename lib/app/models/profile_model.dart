class Profile {
  String? vchCode;
  String? membregNo;
  String? divisionId;
  String? memberName;
  String? sex;
  String? localAdr1;
  String? localAdr2;
  String? localAdr3;
  String? permAdr1;
  String? permAdr2;
  String? permAdr3;
  String? regDate;
  String? entryFee;
  String? entryAge;
  String? birthDate;
  String? service;
  String? serAdr;
  String? contactNo;
  String? faxNo;
  String? sharesNo;
  String? sharesAmount;
  String? nomineeId;
  String? nomineeName;
  String? nomineeAdr;
  String? nomineeAge;
  String? nomineeRelation;
  String? nomineeDate;
  String? dtCancreg;
  String? reasons;
  String? transDate;
  String? noahTrans;
  String? referredBy;
  String? dirmeetno;
  String? meetDate;
  String? delRec;
  String? acclosed;
  String? closdate;
  String? area;
  String? age;
  String? actual;
  String? disable;
  String? customerId;
  String? sbaccountId;
  String? directorId;
  String? remarks;
  String? sbacNo;
  String? dividendId;
  String? linkaccountId;
  String? aCTIVEMEMBER;
  String? mobileNo;
  String? emailId;
  String? agmRegistered;
  String? userId;
  String? agmRegDate;
  String? registeredMobile;
  String? verified;
  String? dateOfExpiry;
  String? dataFinalised;
  String? dataFinalisedBy;
  String? pancardNo;
  String? aadharNo;
  String? death;

  Profile(
      {this.vchCode,
      this.membregNo,
      this.divisionId,
      this.memberName,
      this.sex,
      this.localAdr1,
      this.localAdr2,
      this.localAdr3,
      this.permAdr1,
      this.permAdr2,
      this.permAdr3,
      this.regDate,
      this.entryFee,
      this.entryAge,
      this.birthDate,
      this.service,
      this.serAdr,
      this.contactNo,
      this.faxNo,
      this.sharesNo,
      this.sharesAmount,
      this.nomineeId,
      this.nomineeName,
      this.nomineeAdr,
      this.nomineeAge,
      this.nomineeRelation,
      this.nomineeDate,
      this.dtCancreg,
      this.reasons,
      this.transDate,
      this.noahTrans,
      this.referredBy,
      this.dirmeetno,
      this.meetDate,
      this.delRec,
      this.acclosed,
      this.closdate,
      this.area,
      this.age,
      this.actual,
      this.disable,
      this.customerId,
      this.sbaccountId,
      this.directorId,
      this.remarks,
      this.sbacNo,
      this.dividendId,
      this.linkaccountId,
      this.aCTIVEMEMBER,
      this.mobileNo,
      this.emailId,
      this.agmRegistered,
      this.userId,
      this.agmRegDate,
      this.registeredMobile,
      this.verified,
      this.dateOfExpiry,
      this.dataFinalised,
      this.dataFinalisedBy,
      this.pancardNo,
      this.aadharNo,
      this.death});

  Profile.fromJson(Map<String, dynamic> json) {
    vchCode = json['vch_code'];
    membregNo = json['membreg_no'];
    divisionId = json['division_id'];
    memberName = json['member_name'];
    sex = json['sex'];
    localAdr1 = json['local_adr1'];
    localAdr2 = json['local_adr2'];
    localAdr3 = json['local_adr3'];
    permAdr1 = json['perm_adr1'];
    permAdr2 = json['perm_adr2'];
    permAdr3 = json['perm_adr3'];
    regDate = json['reg_date'];
    entryFee = json['entry_fee'];
    entryAge = json['entry_age'];
    birthDate = json['birth_date'];
    service = json['service'];
    serAdr = json['ser_adr'];
    contactNo = json['contact_no'];
    faxNo = json['fax_no'];
    sharesNo = json['shares_no'];
    sharesAmount = json['shares_amount'];
    nomineeId = json['nominee_id'];
    nomineeName = json['nominee_name'];
    nomineeAdr = json['nominee_adr'];
    nomineeAge = json['nominee_age'];
    nomineeRelation = json['nominee_relation'];
    nomineeDate = json['nominee_date'];
    dtCancreg = json['dt_cancreg'];
    reasons = json['reasons'];
    transDate = json['trans_date'];
    noahTrans = json['noah_trans'];
    referredBy = json['referred_by'];
    dirmeetno = json['dirmeetno'];
    meetDate = json['meet_date'];
    delRec = json['del_rec'];
    acclosed = json['acclosed'];
    closdate = json['closdate'];
    area = json['area'];
    age = json['age'];
    actual = json['actual'];
    disable = json['disable'];
    customerId = json['customer_id'];
    sbaccountId = json['sbaccount_id'];
    directorId = json['director_id'];
    remarks = json['remarks'];
    sbacNo = json['sbac_no'];
    dividendId = json['dividend_id'];
    linkaccountId = json['linkaccount_id'];
    aCTIVEMEMBER = json['ACTIVEMEMBER'];
    mobileNo = json['mobile_no'];
    emailId = json['email_id'];
    agmRegistered = json['agm_registered'];
    userId = json['user_id'];
    agmRegDate = json['agm_regDate'];
    registeredMobile = json['RegisteredMobile'];
    verified = json['Verified'];
    dateOfExpiry = json['Date_of_Expiry'];
    dataFinalised = json['DataFinalised'];
    dataFinalisedBy = json['DataFinalisedBy'];
    pancardNo = json['Pancard_no'];
    aadharNo = json['Aadhar_no'];
    death = json['Death'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vch_code'] = this.vchCode;
    data['membreg_no'] = this.membregNo;
    data['division_id'] = this.divisionId;
    data['member_name'] = this.memberName;
    data['sex'] = this.sex;
    data['local_adr1'] = this.localAdr1;
    data['local_adr2'] = this.localAdr2;
    data['local_adr3'] = this.localAdr3;
    data['perm_adr1'] = this.permAdr1;
    data['perm_adr2'] = this.permAdr2;
    data['perm_adr3'] = this.permAdr3;
    data['reg_date'] = this.regDate;
    data['entry_fee'] = this.entryFee;
    data['entry_age'] = this.entryAge;
    data['birth_date'] = this.birthDate;
    data['service'] = this.service;
    data['ser_adr'] = this.serAdr;
    data['contact_no'] = this.contactNo;
    data['fax_no'] = this.faxNo;
    data['shares_no'] = this.sharesNo;
    data['shares_amount'] = this.sharesAmount;
    data['nominee_id'] = this.nomineeId;
    data['nominee_name'] = this.nomineeName;
    data['nominee_adr'] = this.nomineeAdr;
    data['nominee_age'] = this.nomineeAge;
    data['nominee_relation'] = this.nomineeRelation;
    data['nominee_date'] = this.nomineeDate;
    data['dt_cancreg'] = this.dtCancreg;
    data['reasons'] = this.reasons;
    data['trans_date'] = this.transDate;
    data['noah_trans'] = this.noahTrans;
    data['referred_by'] = this.referredBy;
    data['dirmeetno'] = this.dirmeetno;
    data['meet_date'] = this.meetDate;
    data['del_rec'] = this.delRec;
    data['acclosed'] = this.acclosed;
    data['closdate'] = this.closdate;
    data['area'] = this.area;
    data['age'] = this.age;
    data['actual'] = this.actual;
    data['disable'] = this.disable;
    data['customer_id'] = this.customerId;
    data['sbaccount_id'] = this.sbaccountId;
    data['director_id'] = this.directorId;
    data['remarks'] = this.remarks;
    data['sbac_no'] = this.sbacNo;
    data['dividend_id'] = this.dividendId;
    data['linkaccount_id'] = this.linkaccountId;
    data['ACTIVEMEMBER'] = this.aCTIVEMEMBER;
    data['mobile_no'] = this.mobileNo;
    data['email_id'] = this.emailId;
    data['agm_registered'] = this.agmRegistered;
    data['user_id'] = this.userId;
    data['agm_regDate'] = this.agmRegDate;
    data['RegisteredMobile'] = this.registeredMobile;
    data['Verified'] = this.verified;
    data['Date_of_Expiry'] = this.dateOfExpiry;
    data['DataFinalised'] = this.dataFinalised;
    data['DataFinalisedBy'] = this.dataFinalisedBy;
    data['Pancard_no'] = this.pancardNo;
    data['Aadhar_no'] = this.aadharNo;
    data['Death'] = this.death;
    return data;
  }
}
