class Subgroup {
  String? subgroupId;
  String? subgroupName;
  String? aliasName;

  Subgroup({this.subgroupId, this.subgroupName, this.aliasName});

  Subgroup.fromJson(Map<String, dynamic> json) {
    subgroupId = json['subgroup_id'];
    subgroupName = json['subgroup_name'];
    aliasName = json['alias_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subgroup_id'] = this.subgroupId;
    // data['subgroup_name'] = this.subgroupName;
    // data['alias_name'] = this.aliasName;
    return data;
  }
}
