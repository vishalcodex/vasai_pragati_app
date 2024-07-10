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
    showTransactions.value = true;
    pageName = Subgroup().obs;
    pageName.value = element;

    accounts.value = [];
    selectedAccount.value = Account();
    fetchAccounts(element);
    pageName.refresh();
    if ([
      "3", //"FD",
      "4", //"DD",
      "8", //"RD",
    ].contains(element.subgroupId!.trim())) {
      Get.toNamed(Routes.MULTIPLE_AACOUNTS);
    } else {
      Get.toNamed(Routes.DEPOSIT_DETAILS);
    }
  }

  RxBool isLoading = false.obs;
  RxBool noAccounts = false.obs;
  RxList<Account> accounts = <Account>[].obs;
  RxList<Transaction> transactions = <Transaction>[].obs;
  Rx<Account> selectedAccount = Account().obs;
  Rx<AccountDetails> accountDetails = AccountDetails().obs;

  RxBool showTransactions = false.obs;

  fetchAccounts(Subgroup subgroup) async {
    isLoading.value = true;
    noAccounts.value = false;
    await _accountsRepository.fetchMyAccounts(subgroup).then((value) {
      isLoading.value = false;
      accounts.value = value.data;
      if (accounts.isNotEmpty) {
        selectedAccount.value = accounts[0];
        selectedAccount.refresh();
        fetchAccountDetails(selectedAccount.value);
      } else {
        noAccounts.value = true;
      }
    });
  }

  fetchAccountTransaction(Account account) async {
    await _accountsRepository
        .fetchAccountTransactions(account: account)
        .then((value) {});
  }

  fetchAccountDetails(Account account) async {
    isLoading.value = true;
    await _accountsRepository.fetchAccountDetails(account).then((value) {
      isLoading.value = false;
      accountDetails.value = value.data;
    });
  }

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
      amt += double.parse(element.balance ?? "0");
    }
    return amt.toStringAsFixed(0);
  }

  void toClosedAccounts() {
    Get.toNamed(Routes.CLOSED_ACCOUNTS);
  }
}
