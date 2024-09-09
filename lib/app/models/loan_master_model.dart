class LoanMaster {
  String? vchCode;
  String? accountId;
  String? branchId;
  String? subgroupId;
  String? actype;
  String? acno;
  String? openDate;
  String? amount;
  String? installment;
  String? instAmount;
  String? intRate;
  String? intAmt;
  String? sanctiondt;
  String? purpose;
  String? lastInstalment;
  String? currentInterest;
  String? previousInterest;
  String? moratoriumPeriod;
  String? installmentType;
  String? specialInterestRate;
  String? currentInterestRate;
  String? trAccountId;
  String? trType;
  String? trSubgroupId;
  String? divisionId;
  String? directorId;
  String? pendinginterest;
  String? lcbalance;
  String? aDDRESS1;
  String? aDDRESS2;
  String? aDDRESS3;
  String? nPA;
  String? surchargerate;
  String? aLLOTMENT;
  String? employeeId;
  String? npadate;
  String? marker;
  String? tempmark;
  String? dIRECTORNAME;
  String? overdue;
  String? severity;
  String? mark;
  String? gr1RegNo;
  String? gr1Name;
  String? gr2RegNo;
  String? gr2Name;
  String? gr3RegNo;
  String? gr3Name;
  String? previousIntRate31052015;
  String? instAmount2;
  String? membregNo;
  String? representative;
  String? head;
  String? assistant1;
  String? assistant2;
  String? eOverdue;
  String? eOverduemonths;
  String? eOut;
  String? penalty;
  String? noticefee;
  String? nom1RegNo;
  String? nom2RegNo;
  String? nom3RegNo;
  String? category;
  String? purposeOld;
  String? previousIntRate;
  String? lcategoryId;
  String? lcategory;
  String? rcategoryId;
  String? maturityDate;
  String? lawad;
  String? lawadDate;

  LoanMaster(
      {this.vchCode,
      this.accountId,
      this.branchId,
      this.subgroupId,
      this.actype,
      this.acno,
      this.openDate,
      this.amount,
      this.installment,
      this.instAmount,
      this.intRate,
      this.intAmt,
      this.sanctiondt,
      this.purpose,
      this.lastInstalment,
      this.currentInterest,
      this.previousInterest,
      this.moratoriumPeriod,
      this.installmentType,
      this.specialInterestRate,
      this.currentInterestRate,
      this.trAccountId,
      this.trType,
      this.trSubgroupId,
      this.divisionId,
      this.directorId,
      this.pendinginterest,
      this.lcbalance,
      this.aDDRESS1,
      this.aDDRESS2,
      this.aDDRESS3,
      this.nPA,
      this.surchargerate,
      this.aLLOTMENT,
      this.employeeId,
      this.npadate,
      this.marker,
      this.tempmark,
      this.dIRECTORNAME,
      this.overdue,
      this.severity,
      this.mark,
      this.gr1RegNo,
      this.gr2RegNo,
      this.gr3RegNo,
      this.previousIntRate31052015,
      this.instAmount2,
      this.membregNo,
      this.representative,
      this.head,
      this.assistant1,
      this.assistant2,
      this.eOverdue,
      this.eOverduemonths,
      this.eOut,
      this.penalty,
      this.noticefee,
      this.nom1RegNo,
      this.nom2RegNo,
      this.nom3RegNo,
      this.category,
      this.purposeOld,
      this.previousIntRate,
      this.lcategoryId,
      this.lcategory,
      this.rcategoryId,
      this.maturityDate,
      this.lawad,
      this.lawadDate});

  LoanMaster.fromJson(Map<String, dynamic> json) {
    vchCode = json['vch_code'];
    accountId = json['account_id'];
    branchId = json['branch_id'];
    subgroupId = json['subgroup_id'];
    actype = json['actype'];
    acno = json['acno'];
    openDate = json['openDate'];
    amount = json['Amount'];
    installment = json['Installment'];
    instAmount = json['inst_amount'];
    intRate = json['int_rate'];
    intAmt = json['int_amt'];
    sanctiondt = json['sanctiondt'];
    purpose = json['Purpose'];
    lastInstalment = json['lastInstalment'];
    currentInterest = json['currentInterest'];
    previousInterest = json['previousInterest'];
    moratoriumPeriod = json['moratorium_period'];
    installmentType = json['Installment_Type'];
    specialInterestRate = json['SpecialInterestRate'];
    currentInterestRate = json['currentInterestRate'];
    trAccountId = json['tr_account_id'];
    trType = json['tr_type'];
    trSubgroupId = json['tr_subgroup_id'];
    divisionId = json['division_id'];
    directorId = json['director_id'];
    pendinginterest = json['pendinginterest'];
    lcbalance = json['lcbalance'];
    aDDRESS1 = json['ADDRESS1'];
    aDDRESS2 = json['ADDRESS2'];
    aDDRESS3 = json['ADDRESS3'];
    nPA = json['NPA'];
    surchargerate = json['surchargerate'];
    aLLOTMENT = json['ALLOTMENT'];
    employeeId = json['employee_id'];
    npadate = json['npadate'];
    marker = json['marker'];
    tempmark = json['tempmark'];
    dIRECTORNAME = json['DIRECTOR_NAME'];
    overdue = json['overdue'];
    severity = json['severity'];
    mark = json['mark'];
    gr1RegNo = json['gr1_reg_no'];
    gr1Name = json['gr1_member_name'];
    gr2RegNo = json['gr2_reg_no'];
    gr2Name = json['gr2_member_name'];
    gr3RegNo = json['gr3_reg_no'];
    gr3Name = json['gr3_member_name'];
    previousIntRate31052015 = json['previous_int_rate_31052015'];
    instAmount2 = json['inst_amount2'];
    membregNo = json['membreg_no'];
    representative = json['representative'];
    head = json['head'];
    assistant1 = json['assistant1'];
    assistant2 = json['assistant2'];
    eOverdue = json['e_overdue'];
    eOverduemonths = json['e_overduemonths'];
    eOut = json['e_out'];
    penalty = json['penalty'];
    noticefee = json['noticefee'];
    nom1RegNo = json['nom1_reg_no'];
    nom2RegNo = json['nom2_reg_no'];
    nom3RegNo = json['nom3_reg_no'];
    category = json['category'];
    purposeOld = json['purpose_old'];
    previousIntRate = json['previous_int_rate'];
    lcategoryId = json['lcategory_id'];
    lcategory = json['lcategory'];
    rcategoryId = json['rcategory_id'];
    maturityDate = json['maturity_date'];
    lawad = json['lawad'];
    lawadDate = json['lawad_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vch_code'] = this.vchCode;
    data['account_id'] = this.accountId;
    data['branch_id'] = this.branchId;
    data['subgroup_id'] = this.subgroupId;
    data['actype'] = this.actype;
    data['acno'] = this.acno;
    data['openDate'] = this.openDate;
    data['Amount'] = this.amount;
    data['Installment'] = this.installment;
    data['inst_amount'] = this.instAmount;
    data['int_rate'] = this.intRate;
    data['int_amt'] = this.intAmt;
    data['sanctiondt'] = this.sanctiondt;
    data['Purpose'] = this.purpose;
    data['lastInstalment'] = this.lastInstalment;
    data['currentInterest'] = this.currentInterest;
    data['previousInterest'] = this.previousInterest;
    data['moratorium_period'] = this.moratoriumPeriod;
    data['Installment_Type'] = this.installmentType;
    data['SpecialInterestRate'] = this.specialInterestRate;
    data['currentInterestRate'] = this.currentInterestRate;
    data['tr_account_id'] = this.trAccountId;
    data['tr_type'] = this.trType;
    data['tr_subgroup_id'] = this.trSubgroupId;
    data['division_id'] = this.divisionId;
    data['director_id'] = this.directorId;
    data['pendinginterest'] = this.pendinginterest;
    data['lcbalance'] = this.lcbalance;
    data['ADDRESS1'] = this.aDDRESS1;
    data['ADDRESS2'] = this.aDDRESS2;
    data['ADDRESS3'] = this.aDDRESS3;
    data['NPA'] = this.nPA;
    data['surchargerate'] = this.surchargerate;
    data['ALLOTMENT'] = this.aLLOTMENT;
    data['employee_id'] = this.employeeId;
    data['npadate'] = this.npadate;
    data['marker'] = this.marker;
    data['tempmark'] = this.tempmark;
    data['DIRECTOR_NAME'] = this.dIRECTORNAME;
    data['overdue'] = this.overdue;
    data['severity'] = this.severity;
    data['mark'] = this.mark;
    data['gr1_reg_no'] = this.gr1RegNo;
    data['gr1'] = this.gr1Name;
    data['gr2_reg_no'] = this.gr2RegNo;
    data['gr2'] = this.gr2Name;
    data['gr3_reg_no'] = this.gr3RegNo;
    data['gr3'] = this.gr3Name;
    data['previous_int_rate_31052015'] = this.previousIntRate31052015;
    data['inst_amount2'] = this.instAmount2;
    data['membreg_no'] = this.membregNo;
    data['representative'] = this.representative;
    data['head'] = this.head;
    data['assistant1'] = this.assistant1;
    data['assistant2'] = this.assistant2;
    data['e_overdue'] = this.eOverdue;
    data['e_overduemonths'] = this.eOverduemonths;
    data['e_out'] = this.eOut;
    data['penalty'] = this.penalty;
    data['noticefee'] = this.noticefee;
    data['nom1_reg_no'] = this.nom1RegNo;
    data['nom2_reg_no'] = this.nom2RegNo;
    data['nom3_reg_no'] = this.nom3RegNo;
    data['category'] = this.category;
    data['purpose_old'] = this.purposeOld;
    data['previous_int_rate'] = this.previousIntRate;
    data['lcategory_id'] = this.lcategoryId;
    data['lcategory'] = this.lcategory;
    data['rcategory_id'] = this.rcategoryId;
    data['maturity_date'] = this.maturityDate;
    data['lawad'] = this.lawad;
    data['lawad_date'] = this.lawadDate;
    return data;
  }
}
