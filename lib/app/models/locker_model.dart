class Locker {
  String? vCHCODE;
  String? bRANCHID;
  String? mEMBREGNO;
  String? lOCKERID;
  String? lOCKERNO;
  String? lOCKERTYPE;
  String? dATEFROM;
  String? dATETO;
  String? sTATUS;
  String? aCTIVE;
  List<LockerData>? lockerData;
  Branch? branch;

  Locker(
      {this.vCHCODE,
      this.bRANCHID,
      this.mEMBREGNO,
      this.lOCKERID,
      this.lOCKERNO,
      this.lOCKERTYPE,
      this.dATEFROM,
      this.dATETO,
      this.sTATUS,
      this.aCTIVE,
      this.lockerData,
      this.branch});

  Locker.fromJson(Map<String, dynamic> json) {
    vCHCODE = json['VCH_CODE'];
    bRANCHID = json['BRANCH_ID'];
    mEMBREGNO = json['MEMBREG_NO'];
    lOCKERID = json['LOCKER_ID'];
    lOCKERNO = json['LOCKER_NO'];
    lOCKERTYPE = json['LOCKER_TYPE'];
    dATEFROM = json['DATEFROM'];
    dATETO = json['DATETO'];
    sTATUS = json['STATUS'];
    aCTIVE = json['ACTIVE'];
    if (json['locker_data'] != null) {
      lockerData = <LockerData>[];
      json['locker_data'].forEach((v) {
        lockerData!.add(new LockerData.fromJson(v));
      });
    }
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VCH_CODE'] = this.vCHCODE;
    data['BRANCH_ID'] = this.bRANCHID;
    data['MEMBREG_NO'] = this.mEMBREGNO;
    data['LOCKER_ID'] = this.lOCKERID;
    data['LOCKER_NO'] = this.lOCKERNO;
    data['LOCKER_TYPE'] = this.lOCKERTYPE;
    data['DATEFROM'] = this.dATEFROM;
    data['DATETO'] = this.dATETO;
    data['STATUS'] = this.sTATUS;
    data['ACTIVE'] = this.aCTIVE;
    if (this.lockerData != null) {
      data['locker_data'] = this.lockerData!.map((v) => v.toJson()).toList();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    return data;
  }
}

class LockerData {
  String? vCHCODE;
  String? tRNDATE;
  String? lOCKERID;
  String? tIMEIN;
  String? tIMEOUT;
  String? rEMARKS;
  String? userId;

  LockerData(
      {this.vCHCODE,
      this.tRNDATE,
      this.lOCKERID,
      this.tIMEIN,
      this.tIMEOUT,
      this.rEMARKS,
      this.userId});

  LockerData.fromJson(Map<String, dynamic> json) {
    vCHCODE = json['VCH_CODE'];
    tRNDATE = json['TRN_DATE'];
    lOCKERID = json['LOCKER_ID'];
    tIMEIN = json['TIME_IN'];
    tIMEOUT = json['TIME_OUT'];
    rEMARKS = json['REMARKS'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VCH_CODE'] = this.vCHCODE;
    data['TRN_DATE'] = this.tRNDATE;
    data['LOCKER_ID'] = this.lOCKERID;
    data['TIME_IN'] = this.tIMEIN;
    data['TIME_OUT'] = this.tIMEOUT;
    data['REMARKS'] = this.rEMARKS;
    data['user_id'] = this.userId;
    return data;
  }
}

class Branch {
  String? branchId;
  String? branchName;
  String? branchAddress;
  String? branchAlias;
  String? branchCode;
  String? bRACCOUNTID;

  Branch(
      {this.branchId,
      this.branchName,
      this.branchAddress,
      this.branchAlias,
      this.branchCode,
      this.bRACCOUNTID});

  Branch.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    branchAddress = json['Branch_address'];
    branchAlias = json['branch_alias'];
    branchCode = json['branch_code'];
    bRACCOUNTID = json['BR_ACCOUNT_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['branch_name'] = this.branchName;
    data['Branch_address'] = this.branchAddress;
    data['branch_alias'] = this.branchAlias;
    data['branch_code'] = this.branchCode;
    data['BR_ACCOUNT_ID'] = this.bRACCOUNTID;
    return data;
  }
}
