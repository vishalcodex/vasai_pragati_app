import 'dart:io';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vasai_pragati/app/models/account_transaction.dart';
import 'package:vasai_pragati/app/screens/statement/widgets/deposit_statement.dart';
import 'package:vasai_pragati/app/screens/statement/widgets/loan_statement.dart';

import '../../../models/account_model.dart';
import '../../../models/api_response.dart';
import '../../../models/transaction_model.dart';
import '../../../repositories/accounts_repository.dart';

class StatementController extends GetxController {
  late AccountsRepository _accountsRepository;
  StatementController() {
    _accountsRepository = AccountsRepository();
  }

  @override
  void onInit() {
    super.onInit();
    selectedAccount.value = Get.arguments["account"] as Account;
    type = Get.arguments["type"];
    selectedAccount.refresh();
  }

  Rx<Account> selectedAccount = Account().obs;

  String formatDate(var date, {String? format}) {
    if (date.runtimeType == String) {
      return DateFormat("dd MMM yy").format(DateFormat(format).parse(date));
    } else {
      return DateFormat(format ?? "dd MMM yy").format(date);
    }
  }

  RxList<String> customOptions =
      <String>["1 Month", "2 Months", "6 Months"].obs;
  RxString selectedOption = "".obs;
  RxString fromDate = "".obs;
  RxString toDate = "".obs;
  RxBool isLoading = false.obs;
  RxBool hasStatement = false.obs;
  RxList<Transaction> transactions = <Transaction>[].obs;

  void onStatementOptionChanged(String e) {
    transactions.value = [];
    selectedOption.value = e;
    hasStatement.value = false;
    fromDate.value = DateFormat("dd/MM/yyyy").format(DateTime.now().subtract(
        Duration(
            days: 30 *
                int.parse(
                    e.replaceAll("Month", "").replaceAll("s", "").trim()))));
    toDate.value = DateFormat("dd/MM/yyyy").format(DateTime.now());
    fromDate.refresh();
    toDate.refresh();
    selectedOption.refresh();
  }

  void fetchStatement() {
    transactions.value = [];
    isLoading.value = true;
    _accountsRepository
        .fetchAccountTransactions(
            account: selectedAccount.value,
            fromDate: fromDate.value,
            toDate: toDate.value)
        .then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        hasStatement.value = true;
        AccountTransaction accountTransaction = value.data;
        transactions.value = accountTransaction.transactions;
        selectedAccount.value.branchId = accountTransaction.branch.branchName!;
        transactions.refresh();
      } else {}
    });
  }

  double accBalance = 0.0;
  String type = "";

  Future downloadStatement() async {
    accBalance = double.parse(selectedAccount.value.balance!);
    isLoading.value = true;
    // final logoImage = (await rootBundle.load('assets/ui/statement_header.jpg'))
    //     .buffer
    //     .asUint8List();
    pw.Document pdf = type == "DEPOSIT"
        ? await DepositStatement.createStatement(selectedAccount.value,
            transactions, fromDate.value, toDate.value, accBalance)
        : type == "LOAN"
            ? await LoanStatement.createStatement(selectedAccount.value,
                transactions, fromDate.value, toDate.value, accBalance)
            : pw.Document();

    var fileName =
        "Statement:${DateFormat("ddMMyy").format(DateFormat("dd/MM/yy").parse(fromDate.value))}-${DateFormat("ddMMyy").format(DateFormat("dd/MM/yy").parse(toDate.value))}.pdf";
    final output = await getDownloadsDirectory();
    final file = File("${output!.path}/$fileName");
    await file.create().then((value) async {
      value.writeAsBytes(await pdf.save());
      isLoading.value = false;
      OpenFilex.open(value.path);
    });
  }
}
