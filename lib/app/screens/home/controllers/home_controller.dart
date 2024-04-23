import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/ads_model.dart';
import '../../../models/api_response.dart';
import '../../../models/profile_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/feature_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class HomeController extends GetxController {
  Rx<User> user = User().obs;
  Rx<Profile> profile = Profile().obs;
  // User(
  //         name: "Omkar Mhatre",
  //         email: "karomhatre@gmail.com",
  //         phoneNumber: "+919969383542")
  //     .obs;

  RxInt setTabIndex = 0.obs;
  RxBool isLiveAuction = true.obs;
  RxBool showMoreOptions = false.obs;
  List<String> moreOptions = ["Profile", "Logout"];
  RxString itemView = "LIST".obs;

  late var scaffoldKey = GlobalKey<ScaffoldState>();
  late UserRepository _userRepository;
  late FeatureRepository _featureRepository;

  HomeController() {
    _userRepository = UserRepository();
    _featureRepository = FeatureRepository();
  }

  RxBool searchedClicked = false.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;

    user.value = Get.find<AuthService>().user.value;
    user.listen((updatedUser) {
      Get.find<AuthService>().user.value = updatedUser;
    });

    super.onInit();
    setTabIndex.listen((p0) {});

    updateUser();
    fetchFeatures();
  }

  void updateUser() async {
    await _userRepository.fetchUserDetails().then((value) async {
      if (value.status == Status.COMPLETED) {
        await Get.find<AuthService>().saveUser(value.data).then((v) {
          user.value = value.data;
          user.refresh();
        });
      } else {
        Get.find<AuthService>().removeCurrentUser();
        Get.toNamed(Routes.AUTH);
      }
    });
  }

  void fetchProfile() async {
    await _userRepository.fetchProfileDetails().then((value) async {
      profile.value = value.data;
      profile.refresh();
    });
  }

  DateFormat formater = DateFormat("dd/MM/yy");
  String getWeekDay(String date) {
    DateTime dateTime = formater.parse(date);
    return DateFormat("EEE").format(dateTime);
  }

  String getDate(String date) {
    DateTime dateTime = formater.parse(date);
    return DateFormat("d").format(dateTime);
  }

  RxString notice = "".obs;

  RxList<Ads> ads = <Ads>[].obs;
  RxInt selectedAd = 1.obs;

  PageController pageController = PageController();

  RxBool isGridView = true.obs;

  RxList<Map<String, dynamic>> services = <Map<String, dynamic>>[
    {
      "title": "Deposits",
      "image": "assets/ui/deposits.png",
      "color": 0xff82C6F1
    },
    {
      "title": "Locker",
      "image": "assets/ui/insurance.png",
      "color": 0xff6AE7CF
    },
    {"title": "Loans", "image": "assets/ui/loans.png", "color": 0xffF6739E},
    {
      "title": "Interest Certificate",
      "image": "assets/ui/certificates.png",
      "color": 0xffF4B266
    },
    {
      "title": "EMI Calculator",
      "image": "assets/ui/interest.png",
      "color": 0xff6AE7CF
    },
    {"title": "Events", "image": "assets/ui/events.png", "color": 0xffcc82f1},
  ].obs;

  RxString selectedService = "Deposit".obs;

  fetchFeatures() async {
    await _featureRepository.fetchNotice().then((value) {
      if (value.status == Status.COMPLETED) {
        notice.value = value.data;
        notice.refresh();
      }
    });

    await _featureRepository.fetchSliders().then((value) {
      if (value.data != []) {
        ads.value = value.data;
      } else {}
    });
    ads.refresh();
    isLoading.value = false;
    Future.delayed(Duration(seconds: 4), () {
      pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.linear);
    });
  }

  void homeRefresh() {
    fetchFeatures();
  }

  void goToService() {
    switch (selectedService.value) {
      case "Deposits":
        Get.toNamed(Routes.DEPOSIT);
        break;
      case "Loans":
        Get.toNamed(Routes.LOAN);
        break;
      case "Interest Certificate":
        Get.toNamed(Routes.INTERESTS_CERTIFICATES);
        break;
      case "Events":
        Get.toNamed(Routes.EVENTS);
        break;
      case "Locker":
        Get.toNamed(Routes.LOCKER);
        break;
      case "EMI Calculator":
        Get.toNamed(Routes.EMI_CALCI);
        break;
      default:
    }
  }

  //EMI Calculator
  RxDouble amount = 0.0.obs;
  RxDouble interest = 5.0.obs;
  RxInt tenure = 5.obs;
  RxBool isYear = true.obs;

  String getLoanEMI() {
    var p = amount * (amount.toString().length >= 5 ? 1 : 100000);
    var r = interest / 12 / 100;
    var n = tenure * (isYear.value ? 12 : 1);
    return (p * r * pow((1 + r), n) / (pow((1 + r), n) - 1))
        .toPrecision(2)
        .toString();
  }

  String getTotalInterestPayable() {
    var p = amount * (amount.toString().length >= 5 ? 1 : 100000);
    var r = interest / 12 / 100;
    var n = tenure * (isYear.value ? 12 : 1);
    return ((p * r * pow((1 + r), n) / (pow((1 + r), n) - 1)) * n)
        .toPrecision(2)
        .toString();
  }
}
