import 'transaction_model.dart';

class AccountTransaction {
  late List<Transaction> transactions;
  late Branch branch;

  AccountTransaction({required this.transactions, required this.branch});

  AccountTransaction.fromJson(Map<String, dynamic> json) {
    if (json['transactions'] != null) {
      transactions = <Transaction>[];
      json['transactions'].forEach((v) {
        transactions.add(Transaction.fromJson(v));
      });
    }
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : Branch();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactions'] = transactions.map((v) => v.toJson()).toList();
    data['branch'] = branch.toJson();
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
