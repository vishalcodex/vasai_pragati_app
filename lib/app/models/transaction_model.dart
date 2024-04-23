class Transaction {
  String? vchType;
  String? vchCode;
  String? accountId;
  String? branchId;
  String? subgroupId;
  String? crdb;
  String? trnNo;
  String? trnType;
  String? trnDate;
  String? srno;
  String? shNarration;
  String? doctype;
  String? chqNo;
  String? amount;
  String? balance;
  String? printed;
  String? println;
  String? cramount;
  String? dramount;
  String? mark;
  String? plno;
  String? interest;
  String? pendingint;
  String? noticefee;
  String? penalty;
  String? recovery;
  String? surcharge;
  String? allot;
  String? fent;
  String? recno;
  String? actype;
  String? acno;
  String? nARRATION;
  String? oLDVCHCODE;
  String? relativeaccountId;
  String? currentInterest;
  String? pOSTED;
  String? rowedit;
  String? altsubgroupId;
  String? viewspeciman;

  Transaction(
      {this.vchType,
      this.vchCode,
      this.accountId,
      this.branchId,
      this.subgroupId,
      this.crdb,
      this.trnNo,
      this.trnType,
      this.trnDate,
      this.srno,
      this.shNarration,
      this.doctype,
      this.chqNo,
      this.amount,
      this.balance,
      this.printed,
      this.println,
      this.cramount,
      this.dramount,
      this.mark,
      this.plno,
      this.interest,
      this.pendingint,
      this.noticefee,
      this.penalty,
      this.recovery,
      this.surcharge,
      this.allot,
      this.fent,
      this.recno,
      this.actype,
      this.acno,
      this.nARRATION,
      this.oLDVCHCODE,
      this.relativeaccountId,
      this.currentInterest,
      this.pOSTED,
      this.rowedit,
      this.altsubgroupId,
      this.viewspeciman});

  Transaction.fromJson(Map<String, dynamic> json) {
    vchType = json['vch_type'];
    vchCode = json['vch_code'];
    accountId = json['account_id'];
    branchId = json['branch_id'];
    subgroupId = json['subgroup_id'];
    crdb = json['crdb'];
    trnNo = json['trn_no'];
    trnType = json['trn_type'];
    trnDate = json['trn_date'];
    srno = json['srno'];
    shNarration = json['sh_narration'];
    doctype = json['doctype'];
    chqNo = json['chq_no'];
    amount = json['amount'];
    balance = json['balance'];
    printed = json['printed'];
    println = json['println'];
    cramount = json['cramount'];
    dramount = json['dramount'];
    mark = json['mark'];
    plno = json['plno'];
    interest = json['interest'];
    pendingint = json['pendingint'];
    noticefee = json['noticefee'];
    penalty = json['penalty'];
    recovery = json['recovery'];
    surcharge = json['surcharge'];
    allot = json['allot'];
    fent = json['fent'];
    recno = json['recno'];
    actype = json['actype'];
    acno = json['acno'];
    nARRATION = json['NARRATION'];
    oLDVCHCODE = json['OLDVCH_CODE'];
    relativeaccountId = json['relativeaccount_id'];
    currentInterest = json['currentInterest'];
    pOSTED = json['POSTED'];
    rowedit = json['rowedit'];
    altsubgroupId = json['altsubgroup_id'];
    viewspeciman = json['viewspeciman'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vch_type'] = this.vchType;
    data['vch_code'] = this.vchCode;
    data['account_id'] = this.accountId;
    data['branch_id'] = this.branchId;
    data['subgroup_id'] = this.subgroupId;
    data['crdb'] = this.crdb;
    data['trn_no'] = this.trnNo;
    data['trn_type'] = this.trnType;
    data['trn_date'] = this.trnDate;
    data['srno'] = this.srno;
    data['sh_narration'] = this.shNarration;
    data['doctype'] = this.doctype;
    data['chq_no'] = this.chqNo;
    data['amount'] = this.amount;
    data['balance'] = this.balance;
    data['printed'] = this.printed;
    data['println'] = this.println;
    data['cramount'] = this.cramount;
    data['dramount'] = this.dramount;
    data['mark'] = this.mark;
    data['plno'] = this.plno;
    data['interest'] = this.interest;
    data['pendingint'] = this.pendingint;
    data['noticefee'] = this.noticefee;
    data['penalty'] = this.penalty;
    data['recovery'] = this.recovery;
    data['surcharge'] = this.surcharge;
    data['allot'] = this.allot;
    data['fent'] = this.fent;
    data['recno'] = this.recno;
    data['actype'] = this.actype;
    data['acno'] = this.acno;
    data['NARRATION'] = this.nARRATION;
    data['OLDVCH_CODE'] = this.oLDVCHCODE;
    data['relativeaccount_id'] = this.relativeaccountId;
    data['currentInterest'] = this.currentInterest;
    data['POSTED'] = this.pOSTED;
    data['rowedit'] = this.rowedit;
    data['altsubgroup_id'] = this.altsubgroupId;
    data['viewspeciman'] = this.viewspeciman;
    return data;
  }
}
