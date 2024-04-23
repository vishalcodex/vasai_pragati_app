import 'package:get/get.dart';

import '../services/auth_service.dart';

mixin ApiClient {
  // final globalService = Get.find<GlobalService>();
  final authService = Get.find<AuthService>();
  String? baseUrl;

  String getBaseUrl(String path) {
    if (!path.endsWith('/')) {
      path += '/';
    }
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    if (!baseUrl!.endsWith('/')) {
      return baseUrl! + '/' + path;
    }
    return baseUrl! + path;
  }
}
