import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/account_details.dart';
import '../../../models/account_model.dart';
import '../../../models/subgroup_model.dart';
import '../../../models/transaction_model.dart';
import '../../../repositories/accounts_repository.dart';
import '../../../repositories/subgroup_repository.dart';
import '../../../routes/app_routes.dart';

class DepositController extends GetxController {
  late AccountsRepository _accountsRepository;
  late SubgroupRepository _subgroupRepository;
  DepositController() {
    _accountsRepository = AccountsRepository();
    _subgroupRepository = SubgroupRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchSubgroupList();
  }

  RxList<Subgroup> depositList = <Subgroup>[].obs;

  fetchSubgroupList() async {
    await _subgroupRepository.fetchSubgroups("deposits").then((value) {
      depositList.value = value.data;
      depositList.refresh();
    });
  }

  Rx<Subgroup> pageName = Subgroup().obs;

  void onDepositServiceClicked(Subgroup element) {
    pageName = Subgroup().obs;
    pageName.value = element;

    accounts.value = [];
    selectedAccount.value = Account();
    fetchAccounts(element);
    pageName.refresh();
    if (element.aliasName!.trim() == "FD") {
      Get.toNamed(Routes.MULTIPLE_AACOUNTS);
    } else {
      Get.toNamed(Routes.DEPOSIT_DETAILS);
    }
  }

  RxList<Account> accounts = <Account>[].obs;
  RxList<Transaction> transactions = <Transaction>[].obs;
  Rx<Account> selectedAccount = Account().obs;
  Rx<AccountDetails> accountDetails = AccountDetails().obs;

  RxBool showTransactions = false.obs;

  fetchAccounts(Subgroup subgroup) async {
    await _accountsRepository.fetchMyAccounts(subgroup).then((value) {
      accounts.value = value.data;
      selectedAccount.value = accounts[0];
      selectedAccount.refresh();
      fetchAccountDetails(selectedAccount.value);
    });
  }

  fetchAccountTransaction(Account account) async {
    await _accountsRepository
        .fetchAccountTransactions(account: account)
        .then((value) {});
  }

  fetchAccountDetails(Account account) async {
    await _accountsRepository.fetchAccountDetails(account).then((value) {
      accountDetails.value = value.data;
    });
  }

  //SAVINGS
  RxList<String> customOptions =
      <String>["1 Month", "2 Months", "6 Months"].obs;
  RxString selectedOption = "".obs;
  RxString fromDate = "".obs;
  RxString toDate = "".obs;
  RxBool isLoading = false.obs;
  RxBool hasStatement = false.obs;

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.95);

  String formatDate(var date, {String? format}) {
    if (date.runtimeType == String) {
      return DateFormat("dd MMM yy").format(DateFormat(format).parse(date));
    } else {
      return DateFormat(format ?? "dd MMM yy").format(date);
    }
  }

  void onFDAccountSelected(Account element) {
    selectedAccount = Account().obs;
    selectedAccount.value = element;
    selectedAccount.refresh();
    Get.toNamed(Routes.DEPOSIT_DETAILS);
  }

  String getTotalAmount() {
    double amt = 0;
    for (var element in accounts) {
      amt += double.parse(element.fdMaster!.maturAmt ?? "0");
    }
    return amt.toString();
  }
}
