import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/subgroup_model.dart';
import '../providers/api_provider.dart';

class SubgroupRepository {
  late ApiProvider apiProvider;

  SubgroupRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchSubgroups(String group) async {
    return await apiProvider
        .makeAPICall("GET", "subgroups/$group", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        List<Subgroup> subgroups =
            (value.data as List).map((e) => Subgroup.fromJson(e)).toList();
        value.data = subgroups;
      }
      return value;
    });
  }
}
