class AccountSummary {
  String? subgroupId;
  String? totalAccounts;
  String? subgroupName;
  String? nbalance;

  AccountSummary(
      {this.subgroupId, this.totalAccounts, this.subgroupName, this.nbalance});

  AccountSummary.fromJson(Map<String, dynamic> json) {
    subgroupId = json['subgroup_id'];
    totalAccounts = json['Total_Accounts'];
    subgroupName = json['subgroup_name'];
    nbalance = json['Nbalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subgroup_id'] = this.subgroupId;
    data['Total_Accounts'] = this.totalAccounts;
    data['subgroup_name'] = this.subgroupName;
    data['Nbalance'] = this.nbalance;
    return data;
  }
}
