import 'transaction_model.dart';

class AccountDetails {
  String? accountNumber;
  String? openDate;
  String? balance;
  String? modeOfOperation;
  String? nomineeName;
  List<Transaction>? transactions;

  AccountDetails(
      {this.accountNumber,
      this.openDate,
      this.balance,
      this.modeOfOperation,
      this.nomineeName,
      this.transactions});

  AccountDetails.fromJson(Map<String, dynamic> json) {
    accountNumber = json['account_number'];
    openDate = json['open_date'];
    balance = json['balance'];
    modeOfOperation = json['mode_of_operation'];
    nomineeName = json['nominee_name'];
    if (json['transactions'] != null) {
      transactions = <Transaction>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_number'] = this.accountNumber;
    data['open_date'] = this.openDate;
    data['balance'] = this.balance;
    data['mode_of_operation'] = this.modeOfOperation;
    data['nominee_name'] = this.nomineeName;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
