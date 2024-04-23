import 'package:vasai_pragati/app/models/loan_master_model.dart';
import 'package:vasai_pragati/app/models/transaction_model.dart';

class Account {
  String? vchCode;
  String? accountId;
  String? branchId;
  String? accountName;
  String? actype;
  String? nomineeId;
  String? acno;
  String? introducerName;
  String? introducerAcno;
  String? operationMode;
  String? remarks;
  String? openDate;
  String? acclosed;
  String? closeDate;
  String? userId;
  String? time;
  String? authorisedBy;
  String? authorisedTime;
  String? customerId;
  String? balance;
  String? openingBalance;
  String? nomineeName;
  String? nomineeRelation;
  String? nomineeAddress;
  String? nomineeMinor;
  String? specimenName;
  String? agentCode;
  String? subgroupId;
  String? sid;
  String? agentcode;
  String? cclimit;
  String? fdloan;
  String? nOMINEEBDATE;
  String? nOMINEEMAJORDATE;
  String? zoneId;
  String? cityId;
  String? areaId;
  String? pARENTID;
  String? accountName2;
  String? accountName3;
  String? accountName4;
  String? address1;
  String? address2;
  String? address3;
  String? verification;
  String? active;
  String? mark;
  String? smsactive;
  String? mOBNO;
  String? isactivecheck;
  String? mEMBREGNO;
  String? uNIQUEID;
  String? uID;
  String? minaccId;
  String? minaccBal;
  String? spsbacc;
  String? mismatch;
  String? ddsStatus;
  String? ccStatus;
  String? subsubgroupId;
  String? validmember;
  FDMaster? fdMaster;
  LoanMaster? loanMaster;
  List<Transaction> transactions = [];

  Account(
      {vchCode,
      accountId,
      branchId,
      accountName,
      actype,
      nomineeId,
      acno,
      introducerName,
      introducerAcno,
      operationMode,
      remarks,
      openDate,
      acclosed,
      closeDate,
      userId,
      time,
      authorisedBy,
      authorisedTime,
      customerId,
      balance,
      openingBalance,
      nomineeName,
      nomineeRelation,
      nomineeAddress,
      nomineeMinor,
      specimenName,
      agentCode,
      subgroupId,
      sid,
      agentcode,
      cclimit,
      fdloan,
      nOMINEEBDATE,
      nOMINEEMAJORDATE,
      zoneId,
      cityId,
      areaId,
      pARENTID,
      accountName2,
      accountName3,
      accountName4,
      address1,
      address2,
      address3,
      verification,
      active,
      mark,
      smsactive,
      mOBNO,
      isactivecheck,
      mEMBREGNO,
      uNIQUEID,
      uID,
      minaccId,
      minaccBal,
      spsbacc,
      mismatch,
      ddsStatus,
      ccStatus,
      subsubgroupId,
      validmember,
      fdMaster});

  Account.fromJson(Map<String, dynamic> json) {
    vchCode = json['vch_code'];
    accountId = json['Account_id'];
    branchId = json['branch_id'];
    accountName = json['Account_name'];
    actype = json['actype'];
    nomineeId = json['nominee_id'];
    acno = json['acno'];
    introducerName = json['IntroducerName'];
    introducerAcno = json['IntroducerAcno'];
    operationMode = json['operationMode'];
    remarks = json['Remarks'];
    openDate = json['OpenDate'];
    acclosed = json['Acclosed'];
    closeDate = json['closeDate'];
    userId = json['user_id'];
    time = json['time'];
    authorisedBy = json['AuthorisedBy'];
    authorisedTime = json['AuthorisedTime'];
    customerId = json['customer_id'];
    balance = json['Balance'];
    openingBalance = json['OpeningBalance'];
    nomineeName = json['nominee_name'];
    nomineeRelation = json['nominee_relation'];
    nomineeAddress = json['nominee_address'];
    nomineeMinor = json['nominee_minor'];
    specimenName = json['specimen_name'];
    agentCode = json['agent_code'];
    subgroupId = json['subgroup_id'];
    sid = json['sid'];
    agentcode = json['agentcode'];
    cclimit = json['cclimit'];
    fdloan = json['fdloan'];
    nOMINEEBDATE = json['NOMINEE_BDATE'];
    nOMINEEMAJORDATE = json['NOMINEE_MAJORDATE'];
    zoneId = json['zone_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    pARENTID = json['PARENT_ID'];
    accountName2 = json['account_name2'];
    accountName3 = json['account_name3'];
    accountName4 = json['account_name4'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    verification = json['verification'];
    active = json['active'];
    mark = json['mark'];
    smsactive = json['smsactive'];
    mOBNO = json['MOB_NO'];
    isactivecheck = json['isactivecheck'];
    mEMBREGNO = json['MEMBREG_NO'];
    uNIQUEID = json['UNIQUE_ID'];
    uID = json['UID'];
    minaccId = json['minacc_id'];
    minaccBal = json['minacc_bal'];
    spsbacc = json['spsbacc'];
    mismatch = json['mismatch'];
    ddsStatus = json['dds_status'];
    ccStatus = json['cc_status'];
    subsubgroupId = json['subsubgroup_id'];
    validmember = json['validmember'];

    if (json["fd_master"] != null) {
      fdMaster = FDMaster.fromJson(json['fd_master']);
    } else if (json["loan_master"] != null) {
      loanMaster = LoanMaster.fromJson(json['loan_master']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vch_code'] = vchCode;
    data['Account_id'] = accountId;
    data['branch_id'] = branchId;
    data['Account_name'] = accountName;
    data['actype'] = actype;
    data['nominee_id'] = nomineeId;
    data['acno'] = acno;
    data['IntroducerName'] = introducerName;
    data['IntroducerAcno'] = introducerAcno;
    data['operationMode'] = operationMode;
    data['Remarks'] = remarks;
    data['OpenDate'] = openDate;
    data['Acclosed'] = acclosed;
    data['closeDate'] = closeDate;
    data['user_id'] = userId;
    data['time'] = time;
    data['AuthorisedBy'] = authorisedBy;
    data['AuthorisedTime'] = authorisedTime;
    data['customer_id'] = customerId;
    data['Balance'] = balance;
    data['OpeningBalance'] = openingBalance;
    data['nominee_name'] = nomineeName;
    data['nominee_relation'] = nomineeRelation;
    data['nominee_address'] = nomineeAddress;
    data['nominee_minor'] = nomineeMinor;
    data['specimen_name'] = specimenName;
    data['agent_code'] = agentCode;
    data['subgroup_id'] = subgroupId;
    data['sid'] = sid;
    data['agentcode'] = agentcode;
    data['cclimit'] = cclimit;
    data['fdloan'] = fdloan;
    data['NOMINEE_BDATE'] = nOMINEEBDATE;
    data['NOMINEE_MAJORDATE'] = nOMINEEMAJORDATE;
    data['zone_id'] = zoneId;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    data['PARENT_ID'] = pARENTID;
    data['account_name2'] = accountName2;
    data['account_name3'] = accountName3;
    data['account_name4'] = accountName4;
    data['address1'] = address1;
    data['address2'] = address2;
    data['address3'] = address3;
    data['verification'] = verification;
    data['active'] = active;
    data['mark'] = mark;
    data['smsactive'] = smsactive;
    data['MOB_NO'] = mOBNO;
    data['isactivecheck'] = isactivecheck;
    data['MEMBREG_NO'] = mEMBREGNO;
    data['UNIQUE_ID'] = uNIQUEID;
    data['UID'] = uID;
    data['minacc_id'] = minaccId;
    data['minacc_bal'] = minaccBal;
    data['spsbacc'] = spsbacc;
    data['mismatch'] = mismatch;
    data['dds_status'] = ddsStatus;
    data['cc_status'] = ccStatus;
    data['subsubgroup_id'] = subsubgroupId;
    data['validmember'] = validmember;
    data['fd_master'] = fdMaster!.toJson();
    return data;
  }
}

class FDMaster {
  String? vchCode;
  String? accountId;
  String? branchId;
  String? actype;
  String? acno;
  String? customerId;
  String? openDate;
  String? amount;
  String? certificateNo;
  String? trAccountId;
  String? nofMonth;
  String? dateMatur;
  String? asofDate;
  String? maturAmt;
  String? intRate;
  String? category;
  String? printed;
  String? installment;
  String? interest;
  String? trType;
  String? trSubgroupId;
  String? subgroupId;
  String? pROVISIONS;
  String? renewalAccountId;
  String? dateofprint;
  String? noticeprint;
  String? pROV2015;
  String? rDINACTIVE;
  String? pROV2016;
  String? sCHEMECODE;
  String? reminderIssued;
  String? reminberAfterMaturity;

  FDMaster(
      {this.vchCode,
      this.accountId,
      this.branchId,
      this.actype,
      this.acno,
      this.customerId,
      this.openDate,
      this.amount,
      this.certificateNo,
      this.trAccountId,
      this.nofMonth,
      this.dateMatur,
      this.asofDate,
      this.maturAmt,
      this.intRate,
      this.category,
      this.printed,
      this.installment,
      this.interest,
      this.trType,
      this.trSubgroupId,
      this.subgroupId,
      this.pROVISIONS,
      this.renewalAccountId,
      this.dateofprint,
      this.noticeprint,
      this.pROV2015,
      this.rDINACTIVE,
      this.pROV2016,
      this.sCHEMECODE,
      this.reminderIssued,
      this.reminberAfterMaturity});

  FDMaster.fromJson(Map<String, dynamic> json) {
    vchCode = json['vch_code'];
    accountId = json['account_id'];
    branchId = json['branch_id'];
    actype = json['actype'];
    acno = json['acno'];
    customerId = json['customer_id'];
    openDate = json['openDate'];
    amount = json['Amount'];
    certificateNo = json['CertificateNo'];
    trAccountId = json['TrAccount_id'];
    nofMonth = json['NofMonth'];
    dateMatur = json['date_matur'];
    asofDate = json['asof_Date'];
    maturAmt = json['matur_amt'];
    intRate = json['int_rate'];
    category = json['category'];
    printed = json['printed'];
    installment = json['Installment'];
    interest = json['Interest'];
    trAccountId = json['tr_account_id'];
    trType = json['tr_type'];
    trSubgroupId = json['tr_subgroup_id'];
    subgroupId = json['subgroup_id'];
    pROVISIONS = json['PROVISIONS'];
    renewalAccountId = json['renewalAccount_id'];
    dateofprint = json['dateofprint'];
    noticeprint = json['noticeprint'];
    pROV2015 = json['PROV2015'];
    rDINACTIVE = json['RDINACTIVE'];
    pROV2016 = json['PROV2016'];
    sCHEMECODE = json['SCHEME_CODE'];
    reminderIssued = json['Reminder_Issued'];
    reminberAfterMaturity = json['Reminber_AfterMaturity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vch_code'] = this.vchCode;
    data['account_id'] = this.accountId;
    data['branch_id'] = this.branchId;
    data['actype'] = this.actype;
    data['acno'] = this.acno;
    data['customer_id'] = this.customerId;
    data['openDate'] = this.openDate;
    data['Amount'] = this.amount;
    data['CertificateNo'] = this.certificateNo;
    data['TrAccount_id'] = this.trAccountId;
    data['NofMonth'] = this.nofMonth;
    data['date_matur'] = this.dateMatur;
    data['asof_Date'] = this.asofDate;
    data['matur_amt'] = this.maturAmt;
    data['int_rate'] = this.intRate;
    data['category'] = this.category;
    data['printed'] = this.printed;
    data['Installment'] = this.installment;
    data['Interest'] = this.interest;
    data['tr_account_id'] = this.trAccountId;
    data['tr_type'] = this.trType;
    data['tr_subgroup_id'] = this.trSubgroupId;
    data['subgroup_id'] = this.subgroupId;
    data['PROVISIONS'] = this.pROVISIONS;
    data['renewalAccount_id'] = this.renewalAccountId;
    data['dateofprint'] = this.dateofprint;
    data['noticeprint'] = this.noticeprint;
    data['PROV2015'] = this.pROV2015;
    data['RDINACTIVE'] = this.rDINACTIVE;
    data['PROV2016'] = this.pROV2016;
    data['SCHEME_CODE'] = this.sCHEMECODE;
    data['Reminder_Issued'] = this.reminderIssued;
    data['Reminber_AfterMaturity'] = this.reminberAfterMaturity;
    return data;
  }
}
