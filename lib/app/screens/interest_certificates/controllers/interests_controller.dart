import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../../models/interest_certificate_model.dart';
import '../../../models/onBoard_model.dart';
import '../../../repositories/accounts_repository.dart';

class InterestsController extends GetxController {
  RxList<OnBoard> onboardsScreens = <OnBoard>[].obs;

  RxInt selectedIndex = 0.obs;
  RxString quote = "".obs;
  PageController pageController = PageController();

  late AccountsRepository _accountsRepository;

  InterestsController() {
    _accountsRepository = AccountsRepository();
  }

  @override
  void onInit() {
    super.onInit();
    last10Years.value = List.generate(
        10,
        (index) =>
            ("${DateTime.now().year - index - 1}-${DateTime.now().year - index}"));
    selectedYear.value = last10Years.first;
    fetchCertificates();
  }

  RxList<String> last10Years = <String>[].obs;
  RxString selectedYear = "".obs;

  RxList<InterestCertificate> certificates = <InterestCertificate>[].obs;
  RxList<InterestCertificate> showingCertificates = <InterestCertificate>[].obs;

  fetchCertificates() async {
    await _accountsRepository.fetchInterestCertificates().then((value) {
      certificates.value = value.data;
      onYearChanged("${DateTime.now().year - 1}-${DateTime.now().year}");
      certificates.refresh();
    });
  }

  RxBool isLoading = false.obs;
  RxBool isSearching = false.obs;

  void downloadCertificate(InterestCertificate element) async {
    isLoading.value = true;
    await _accountsRepository.downloadCertificate(
        {"year_from": "2023", "year_to": "2024"}).then((value) async {
      Uint8List bytes = value.data;

      var fileName = "Certificate.pdf";
      final output = await getDownloadsDirectory();
      final file = File("${output!.path}/$fileName");
      await file.create().then((value) async {
        value.writeAsBytes(bytes);
        isLoading.value = false;
        OpenFilex.open(value.path);
      });
    });
  }

  void onYearChanged(String element) {
    isSearching.value = true;
    showingCertificates.value = [];
    showingCertificates.refresh();
    selectedYear.value = element;
    selectedYear.refresh();
    Future.delayed(const Duration(seconds: 1), () {
      showingCertificates.value =
          certificates.where((p0) => p0.financialYear! == element).toList();
      isSearching.value = false;
      showingCertificates.refresh();
    });
  }
}
