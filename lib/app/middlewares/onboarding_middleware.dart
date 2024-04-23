import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../services/auth_service.dart';

class OnBoardingMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();
    print("Token : " + (authService.token ?? ""));
    // if (authService.showOnboarding) {
    //   return const RouteSettings(name: Routes.GET_STARTED);
    // } else
    if (authService.token == null) {
      return RouteSettings(
        name: authService.toRegister ? Routes.SIGN_IN : Routes.AUTH,
      );
    } else if (route! != Routes.HOME) {
      return const RouteSettings(name: Routes.HOME);
    }
    return null;
  }
}
