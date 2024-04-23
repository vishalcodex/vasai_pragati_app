import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/onBoard_model.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class OnBoardingController extends GetxController {
  RxList<OnBoard> onboardsScreens = <OnBoard>[].obs;

  RxInt selectedIndex = 0.obs;
  RxString quote = "".obs;
  PageController pageController = PageController();

  OnBoardingController() {}

  @override
  void onInit() {
    super.onInit();
    fetchOnboardingScreens();
  }

  void onBoardingFinished() {
    Get.find<AuthService>().setOnBoarding(true);
    Get.offAndToNamed(Routes.SIGN_IN);
  }

  void fetchOnboardingScreens() async {
    onboardsScreens.assignAll([
      {
        "id": "0",
        "title": "Easy, Fast & Trusted",
        "description":
            "Fast money transfer and gauranted safe transaction with others.",
        "image": "assets/ui/onboard/onboard_1.png"
      },
      {
        "id": "1",
        "title": "Saving Your Money",
        "description":
            "Track the progress of your savings and start a habit of saving with Vasai Pragati.",
        "image": "assets/ui/onboard/onboard_2.png"
      },
      {
        "id": "2",
        "title": "VPIN Login",
        "description": "Safely Log in using VPIN on Vasai Pragati.",
        "image": "assets/ui/onboard/onboard_3.png"
      }
    ].map((e) => OnBoard.fromJson(e)).toList());
    onboardsScreens.refresh();
  }
}
