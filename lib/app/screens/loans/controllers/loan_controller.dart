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
      loansList
          .add(Subgroup(subgroupId: "-1", subgroupName: "Close Loan Accounts"));
      loansList.refresh();
    });
  }

  void onLoanServiceClicked(Subgroup element) {
    showTransactions.value = true;
    selectedAccount.value = Account();
    fetchAccounts(element);
    Get.toNamed(Routes.LOAN_DETAILS, arguments: {"page_name": element});
  }

  RxBool isLoading = false.obs;
  RxBool noAccounts = false.obs;
  RxList<Account> accounts = <Account>[].obs;
  // RxList<Transaction> transactions = <Transaction>[].obs;
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

  fetchAccountDetails(Account account) async {
    isLoading.value = true;
    await _accountsRepository.fetchAccountDetails(account).then((value) {
      isLoading.value = false;
      accountDetails.value = value.data;

      accountDetails.refresh();
    });
  }
}
