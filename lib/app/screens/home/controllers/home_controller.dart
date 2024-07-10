import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/account_summary_model.dart';
import '../../../models/ads_model.dart';
import '../../../models/notification_model.dart' as nf;
import '../../../models/api_response.dart';
import '../../../models/interest_model.dart';
import '../../../models/profile_model.dart';
import '../../../models/subgroup_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/feature_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../deposit/controllers/deposit_controller.dart';
import '../../loans/controllers/loan_controller.dart';

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

  RxString greetings = "Morning".obs;

  void updateUser() async {
    await _userRepository.fetchUserDetails().then((value) async {
      if (value.status == Status.COMPLETED) {
        await Get.find<AuthService>().saveUser(value.data).then((v) {
          user.value = value.data;
          user.refresh();
        });
      } else {
        // Get.find<AuthService>().removeCurrentUser();
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
    {
      "title": "Fixed Deposit Calculator",
      "image": "assets/ui/deposits.png",
      "color": 0xff6AE7CF
    },
    {
      "title": "Recurring Deposit Calculator",
      "image": "assets/ui/deposits.png",
      "color": 0xff6AE7CF
    },
  ].obs;

  RxString selectedService = "Deposit".obs;

  getGreetings() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  fetchFeatures() async {
    greetings.value = getGreetings();
    greetings.refresh();

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
    Future.delayed(const Duration(seconds: 4), () {
      pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.linear);
    });

    fetchSummary(selectedSummary.value);
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
      case "Fixed Deposit Calculator":
        Get.toNamed(Routes.FD_CALCI);
        break;
      case "Recurring Deposit Calculator":
        Get.toNamed(Routes.RD_CALCI);
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

  //FD & RD Calculator
  RxString customerType = "Normal".obs;
  RxString tenureType = "YY/MM/DD".obs;
  RxDouble fdAmount = 5000.0.obs;

  Rx<Interest> fdInterest = Interest(actype: "FD").obs;
  void fetchFDInterest() async {
    isLoading.value = true;
    fdInterest.value = Interest(actype: "FD");
    await _featureRepository.fetchRateOfInterest({
      "actype": "FD",
      "category": customerType.value == "Normal" ? "G" : "S",
      "period": "$tenure",
      "wef": DateFormat("MM-dd-yyyy").format(DateTime.now())
    }).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        fdInterest.value = value.data[0];
        fdInterest.refresh();
      }
    });
  }

  Rx<Interest> rdInterest = Interest(actype: "RD").obs;
  void fetchRDInterest() async {
    isLoading.value = true;
    rdInterest.value = Interest(actype: "RD");
    await _featureRepository.fetchRateOfInterest({
      "actype": "RD",
      "category": customerType.value == "Normal" ? "G" : "S",
      "period": "$tenure",
      "wef": DateFormat("MM-dd-yyyy").format(DateTime.now())
    }).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        rdInterest.value = value.data[0];
        rdInterest.refresh();
      }
    });
  }

  //OVERALL SUMMARY
  RxList<AccountSummary> selectedAccountSummary = <AccountSummary>[].obs;
  RxString selectedSummary = "Deposit".obs;

  void fetchSummary(String e) async {
    isLoading.value = true;
    await _featureRepository.fetchSummary().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        selectedAccountSummary.value = (value.data as List<AccountSummary>)
            .where((element) => element.subgroupName!
                .toLowerCase()
                .contains(e == "Deposit" ? "deposits" : "loan"))
            .toList();
        selectedAccountSummary.refresh();
      }
    });
  }

  void onSummaryTabSelected(String e) {
    selectedSummary.value = e;
    fetchSummary(e);
  }

  void onSummarySelected(AccountSummary summary) {
    Subgroup subgroup = Subgroup(
        subgroupId: summary.subgroupId, subgroupName: summary.subgroupName);
    if (selectedSummary.value == "Deposit") {
      DepositController controller;
      Get.put(DepositController());
      controller = Get.find<DepositController>();
      controller.onDepositServiceClicked(subgroup);
    } else {
      LoanController controller;
      Get.put(LoanController());
      controller = Get.find<LoanController>();
      controller.onLoanServiceClicked(subgroup);
    }
  }

  // NOTIFICATIONS
  RxList<nf.Notification> notifications = <nf.Notification>[].obs;
  void fetchNotifications() async {
    isLoading.value = true;
    await _featureRepository.fetchNotifiactions().then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        notifications.value = value.data;
        notifications.refresh();
      }
    });
  }

  double getFDMaturityAmount() {
    double value = fdAmount.value *
        pow(1 + (double.parse(fdInterest.value.interest ?? "0.0") / 100) / 4,
            4 * tenure.value / 12);
    return value;
  }
}
