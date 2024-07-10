import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/account_details.dart';
import '../models/account_model.dart';
import '../models/account_transaction.dart';
import '../models/interest_certificate_model.dart';
import '../models/locker_model.dart';
import '../models/subgroup_model.dart';
import '../models/api_response.dart';
import '../providers/api_provider.dart';

class AccountsRepository {
  late ApiProvider apiProvider;

  AccountsRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchMyAccounts(Subgroup subgroup) async {
    return await apiProvider
        .makeAPICall("POST", "accounts", subgroup.toJson())
        .then((value) async {
      if (value.status == Status.COMPLETED) {
        List<Account> accounts =
            (value.data as List).map((e) => Account.fromJson(e)).toList();

        if (!["FD", "RD"].contains(subgroup.aliasName.toString().trim())) {
          accounts =
              accounts.length > 4 ? accounts.getRange(0, 4).toList() : accounts;
          for (var account in accounts) {
            await fetchAccountTransactions(account: account).then((value) {
              if (value.status == Status.COMPLETED) {
                account.transactions =
                    (value.data as AccountTransaction).transactions;
              } else {
                account.transactions = [];
              }
            });
          }
        }
        value.data = accounts;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchAccountDetails(Account account) async {
    return await apiProvider.makeAPICall("POST", "account-details",
        {"account_id": account.accountId}).then((value) {
      if (value.status == Status.COMPLETED) {
        AccountDetails account = AccountDetails.fromJson(value.data);
        value.data = account;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchInterestCertificates() async {
    return await apiProvider
        .makeAPICall("GET", "fdinterest-certificates", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        List<InterestCertificate> certificates =
            (value.data["statements"] as List)
                .map((e) => InterestCertificate.fromJson(e))
                .toList();
        value.data = certificates;
      }
      return value;
    });
  }

  Future<ApiResponse> downloadCertificate(data) async {
    return await apiProvider
        .downloadPdf("POST", "fdinterest-certificate", data)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        // List<InterestCertificate> certificates =
        //     (value.data["statements"] as List)
        //         .map((e) => InterestCertificate.fromJson(e))
        //         .toList();
        // value.data = certificates;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchLockers() async {
    return await apiProvider.makeAPICall("GET", "lockers", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        List<Locker> lockers = (value.data["lockers"] as List)
            .map((e) => Locker.fromJson(e))
            .toList();
        value.data = lockers;
      }
      return value;
    });
  }

  //  Future<ApiResponse> fetchAccountTransactions(Account account) async {
  //   var body = {
  //     "account_id": account.accountId,
  //     "per_page": 10,
  //     "from_date": DateFormat("yyyy-MM-dd")
  //         .format(DateTime.now().subtract(const Duration(days: 30))),
  //     "to_date": DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //   };
  //   return await apiProvider
  //       .makeAPICall("POST", "account/transactions", body)
  //       .then((value) {
  //     if (value.status == Status.COMPLETED) {
  //       List<Transaction> accounts = (value.data["data"] as List)
  //           .map((e) => Transaction.fromJson(e))
  //           .toList();
  //       value.data = accounts;
  //     }
  //     return value;
  //   });
  // }

  Future<ApiResponse> fetchAccountTransactions(
      {required Account account, String? fromDate, String? toDate}) async {
    var body = {
      "account_id": account.accountId,
      // "per_page": 10,
    };
    if (fromDate != null) {
      body["from_date"] = DateFormat("yyyy-MM-dd")
          .format(DateFormat("dd/MM/yy").parse(fromDate));
    }
    if (toDate != null) {
      body["to_date"] =
          DateFormat("yyyy-MM-dd").format(DateFormat("dd/MM/yy").parse(toDate));
    }
    return await apiProvider
        .makeAPICall("POST", "all-account-details", body)
        .then((value) {
      if (value.status == Status.COMPLETED) {
        value.data = AccountTransaction.fromJson(value.data);
      }
      return value;
    });
  }
}
