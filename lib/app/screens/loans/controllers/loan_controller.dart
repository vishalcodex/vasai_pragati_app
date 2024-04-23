import 'package:get/get.dart';

import '../../../models/account_details.dart';
import '../../../models/account_model.dart';
import '../../../models/subgroup_model.dart';
import '../../../repositories/accounts_repository.dart';
import '../../../repositories/subgroup_repository.dart';
import '../../../routes/app_routes.dart';

class LoanController extends GetxController {
  late AccountsRepository _accountsRepository;
  late SubgroupRepository _subgroupRepository;
  LoanController() {
    _accountsRepository = AccountsRepository();
    _subgroupRepository = SubgroupRepository();
  }

  @override
  void onInit() {
    super.onInit();
    fetchSubgroupList();
  }

  RxList<Subgroup> loansList = <Subgroup>[].obs;

  fetchSubgroupList() async {
    await _subgroupRepository.fetchSubgroups("loans").then((value) {
      loansList.value = value.data;
      loansList.refresh();
    });
  }

  void onLoanServiceClicked(Subgroup element) {
    showTransactions.value = false;
    selectedAccount.value = Account();
    fetchAccounts(element);
    Get.toNamed(Routes.LOAN_DETAILS, arguments: {"page_name": element});
  }

  RxList<Account> accounts = <Account>[].obs;
  // RxList<Transaction> transactions = <Transaction>[].obs;
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

  fetchAccountDetails(Account account) async {
    await _accountsRepository.fetchAccountDetails(account).then((value) {
      accountDetails.value = value.data;

      accountDetails.refresh();
    });
  }

  RxString fromDate = "".obs;
  RxString toDate = "".obs;
  RxBool isLoading = false.obs;

  void downloadStatement(pageName) {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(Routes.CONGRATS, arguments: {
        "message": "Dear user your statement has been downloaded successfully."
      });
      isLoading.value = false;
      Future.delayed(const Duration(seconds: 2), () {
        Get.back();
        Get.back();
      });
    });
  }
}
