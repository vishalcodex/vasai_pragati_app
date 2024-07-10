import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../models/account_model.dart';
import '../../../models/transaction_model.dart';

class LoanStatement {
  static Future<pw.Document> createStatement(
      Account account,
      List<Transaction> transactions,
      String fromDate,
      String toDate,
      double accBalance) async {
    var loadImage = await rootBundle.load('assets/ui/logo.png');
    pw.TextStyle style =
        const pw.TextStyle(fontSize: 9, color: PdfColors.black);
    pw.Document pdf = pw.Document();
    // Group list into 18 entries per page
    List<Transaction> temptrns = [];
    temptrns.addAll(transactions.reversed);
    int noEntries = 25;
    double noPages = (temptrns.length / noEntries).ceilToDouble();

    for (var i = 0; i < noPages; i++) {
      List<Transaction> selectedTransactions = [];
      selectedTransactions.addAll(temptrns.getRange(i * noEntries,
          i == (noPages - 1) ? temptrns.length : noEntries * (i + 1)));
      Transaction reduced = selectedTransactions.reduce((previousValue, element) => Transaction(
          interest: (double.parse(previousValue.interest ?? "0") +
                  double.parse(element.interest!))
              .toString(),
          penalty: (double.parse(previousValue.penalty ?? "0") +
                  double.parse(element.penalty!))
              .toString(),
          noticefee: (double.parse(previousValue.noticefee ?? "0") +
                  double.parse(element.noticefee!))
              .toString(),
          recovery: (double.parse(previousValue.recovery ?? "0") +
                  double.parse(element.recovery!))
              .toString(),
          surcharge:
              (double.parse(previousValue.surcharge ?? "0") + double.parse(element.surcharge!)).toString(),
          dramount: (double.parse(previousValue.dramount ?? "0") + double.parse(element.dramount!)).toString(),
          cramount: (double.parse(previousValue.cramount ?? "0") + double.parse(element.cramount!)).toString(),
          amount: (double.parse(previousValue.amount ?? "0") + double.parse(element.amount!)).toString()));
      pdf.addPage(
        pw.Page(
          margin: const pw.EdgeInsets.all(20),
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Container(
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.SizedBox(height: 15),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.SizedBox(
                            height: 30,
                            width: 30,
                            child: pw.Image(
                              pw.MemoryImage(loadImage.buffer.asUint8List(
                                  loadImage.offsetInBytes,
                                  loadImage.lengthInBytes)),
                            ),
                          ),
                          pw.Text(
                              "VASAI PRAGATI CO-OPERATIVE CREDIT SOCIETY LTD., ARNALA",
                              style: style.copyWith(
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(
                            height: 30,
                            width: 30,
                            // child: pw.Image(
                            //   pw.MemoryImage(loadImage.buffer.asUint8List(loadImage.offsetInBytes, loadImage.lengthInBytes)),
                            // ),
                          )
                        ]),
                    pw.SizedBox(height: 15),
                    //FROM, BRANCH, REPORT DATE
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text("From : ${fromDate.toString()}",
                              style: style),
                          pw.Text("Branch : ${account.branchId}", style: style),
                          pw.Text("Report Date", style: style)
                        ]),
                    pw.SizedBox(height: 5),
                    //TO, ACCOUNT, DATE
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text("To : ${toDate.toString()}", style: style),
                          pw.Text("Account Statement",
                              style: style.copyWith(
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text(
                              DateFormat("dd/MM/yyyy").format(DateTime.now()),
                              style: style)
                        ]),
                    pw.SizedBox(height: 7.5),
                    //, SANCT AMT, INST AMT
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Expanded(
                            child: pw.Text("", style: style),
                          ),
                          pw.Expanded(
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceAround,
                                children: [
                                  pw.Text("Sanct Amt",
                                      textAlign: pw.TextAlign.left,
                                      style: style),
                                  pw.Text(account.loanMaster!.amount!,
                                      textAlign: pw.TextAlign.left,
                                      style: style),
                                ]),
                          ),
                          pw.Expanded(
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceEvenly,
                                children: [
                                  pw.Expanded(
                                    flex: 2,
                                    child: pw.Text("Inst Amt",
                                        textAlign: pw.TextAlign.right,
                                        style: style),
                                  ),
                                  pw.Expanded(
                                    child: pw.Text(
                                        account.loanMaster!.instAmount!,
                                        textAlign: pw.TextAlign.right,
                                        style: style),
                                  )
                                ]),
                          ),
                        ]),
                    pw.SizedBox(height: 7.5),
                    //ACC NO, SANCT DATE, INST RATE
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Expanded(
                            child: pw.Text(
                                "Ac No. : ${account.loanMaster!.accountId}",
                                textAlign: pw.TextAlign.left,
                                style: style),
                          ),
                          pw.Expanded(
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceAround,
                                children: [
                                  pw.Text("SanctionDt",
                                      textAlign: pw.TextAlign.left,
                                      style: style),
                                  pw.Text(
                                    DateFormat("dd/MM/yyy").format(DateFormat("yyyy-MM-dd").parse( account.loanMaster!.sanctiondt!)) 
                                   ,
                                      textAlign: pw.TextAlign.left,
                                      style: style),
                                ]),
                          ),
                          pw.Expanded(
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceEvenly,
                                children: [
                                  pw.Expanded(
                                    flex: 2,
                                    child: pw.Text("Int Rate",
                                        textAlign: pw.TextAlign.right,
                                        style: style),
                                  ),
                                  pw.Expanded(
                                    child: pw.Text(account.loanMaster!.intRate!,
                                        textAlign: pw.TextAlign.right,
                                        style: style),
                                  )
                                ]),
                          ),
                        ]),

                    // pw.SizedBox(height: 15),
                    // //AC NO.
                    // pw.Row(children: [
                    //   pw.Text("Ac No. : ${account.acno}",
                    //       textAlign: pw.TextAlign.left, style: style),
                    // ]),
                    pw.SizedBox(height: 5),
                    // NAME
                    pw.Row(children: [
                      pw.Text(
                          "Acc. Holder Name : ${account.accountName!.toUpperCase()}",
                          textAlign: pw.TextAlign.left,
                          style: style),
                    ]),
                    pw.SizedBox(height: 5),
                    // NAME
                    pw.Row(children: [
                      pw.Text(
                          "Guaranter 1 : ${account.loanMaster?.gr1Name ?? ""}",
                          textAlign: pw.TextAlign.left,
                          style: style),
                    ]),
                    pw.SizedBox(height: 5),
                    // NAME
                    pw.Row(children: [
                      pw.Text(
                          "Guaranter 2 : ${account.loanMaster?.gr2Name ?? ""}",
                          textAlign: pw.TextAlign.left,
                          style: style),
                    ]),
                    pw.SizedBox(height: 5),
                    // NAME
                    pw.Row(children: [
                      pw.Text(
                          "Guaranter 3 : ${account.loanMaster?.gr3Name ?? ""}",
                          textAlign: pw.TextAlign.left,
                          style: style),
                    ]),
                    pw.SizedBox(height: 5),
                    // Overdue_amount
                    //  - Overdue_interest
                    //  - Surcharge
                    //  - Penalty
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Expanded(
                            flex: 3,
                            child: pw.Text(
                                "Overdue Amount : ${account.loanMaster!.overdue}",
                                textAlign: pw.TextAlign.left,
                                style: style),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Text(
                                "Overdue Months : ${account.loanMaster!.eOverduemonths}",
                                textAlign: pw.TextAlign.left,
                                style: style),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Text(
                                "Overdue Interest : ${account.loanMaster!.overdue}",
                                textAlign: pw.TextAlign.left,
                                style: style),
                          ),
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                                "Surcharge : ${account.loanMaster!.surchargerate ?? 0}",
                                textAlign: pw.TextAlign.left,
                                style: style),
                          ),
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                                "Penalty : ${account.loanMaster!.penalty ?? 0}",
                                textAlign: pw.TextAlign.left,
                                style: style),
                          ),
                          pw.Expanded(
                            flex: 2,
                            child: pw.Text(
                                "Notice Fee : ${account.loanMaster!.noticefee ?? 0}",
                                textAlign: pw.TextAlign.left,
                                style: style),
                          ),
                        ]),
                    pw.SizedBox(height: 15),
                    pw.Divider(color: PdfColors.black, thickness: 1, height: 1),
                    //HEADER
                    pw.Container(
                      padding: const pw.EdgeInsets.all(5),
                      child: pw.Row(children: [
                        pw.Expanded(
                          child: pw.Center(
                            child: pw.Text(
                              "Date",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        // pw.Expanded(
                        //   child: pw.Center(
                        //     child: pw.Text(
                        //       "Doc No.",
                        //       style: style,
                        //       textAlign: pw.TextAlign.left,
                        //     ),
                        //   ),
                        // ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Center(
                            child: pw.Text(
                              "Transaction",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Center(
                            child: pw.Text(
                              "Interest",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Center(
                            child: pw.Text(
                              "Penalty",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Center(
                            child: pw.Text(
                              "N. Fee",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Center(
                            child: pw.Text(
                              "Rec.",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Center(
                            child: pw.Text(
                              "Srchg",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Center(
                            child: pw.Text(
                              "Debit",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Center(
                            child: pw.Text(
                              "Credit",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Center(
                            child: pw.Text(
                              "Total",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 2,
                          child: pw.Center(
                            child: pw.Text(
                              "Balance",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    pw.Divider(color: PdfColors.black, thickness: 1, height: 1),
                    pw.Divider(color: PdfColors.black, thickness: 1, height: 1),
                    //DATE
                    pw.Expanded(
                        child: pw.ListView.builder(
                      itemCount: selectedTransactions.length,
                      // reverse: true,
                      itemBuilder: (context, index) {
                        Transaction element =
                            selectedTransactions.elementAt(index);

                        return pw.Container(
                          color: index % 2 == 1
                              ? PdfColors.grey200
                              : PdfColors.white,
                          // decoration: pw.BoxDecoration(
                          //     border: pw.Border.all(color: PdfColors.black)),
                          padding: const pw.EdgeInsets.symmetric(vertical: 5),
                          // margin: pw.EdgeInsets.symmetric(
                          //     vertical: index % 2 == 1 ? 5 : 0),
                          child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                //DATE
                                pw.Expanded(
                                  child: pw.Center(
                                    child: pw.Text(
                                        DateFormat("dd/MM/yy").format(
                                          DateFormat("yyyy-MM-dd")
                                              .parse(element.trnDate!),
                                        ),
                                        style: style.copyWith(fontSize: 9.5)),
                                  ),
                                ),
                                // pw.Expanded(
                                //   child: pw.Center(
                                //     child: pw.Text(
                                //        element.dramount!,
                                //         style: style),
                                //   ),
                                // ),
                                //TRANSACTION
                                pw.Expanded(
                                  flex: 2,
                                  child: pw.Padding(
                                    padding: const pw.EdgeInsets.only(left: 5),
                                    child: pw.Text(
                                      "${element.shNarration}: ${element.nARRATION}",
                                      textAlign: pw.TextAlign.left,
                                      style: style.copyWith(fontSize: 9.5),
                                    ),
                                  ),
                                ),
                                //INTEREST
                                pw.Expanded(
                                  child: pw.Text(
                                    element.interest!,
                                    textAlign: pw.TextAlign.center,
                                    style: style.copyWith(fontSize: 9.5),
                                  ),
                                ),
                                //PENALTY
                                pw.Expanded(
                                  child: pw.Text(
                                    element.penalty! == "0"
                                        ? ""
                                        : element.penalty!,
                                    textAlign: pw.TextAlign.center,
                                    style: style.copyWith(fontSize: 9.5),
                                  ),
                                ),
                                //NOTICE FEE
                                pw.Expanded(
                                  child: pw.Text(
                                    element.noticefee! == "0"
                                        ? ""
                                        : element.noticefee!,
                                    textAlign: pw.TextAlign.center,
                                    style: style.copyWith(fontSize: 9.5),
                                  ),
                                ),
                                //RECOVERY
                                pw.Expanded(
                                  child: pw.Text(
                                    element.recovery! == "0"
                                        ? ""
                                        : element.recovery!,
                                    textAlign: pw.TextAlign.center,
                                    style: style.copyWith(fontSize: 9.5),
                                  ),
                                ),
                                //SURCHARGE
                                pw.Expanded(
                                  child: pw.Text(
                                    element.surcharge! == "0"
                                        ? ""
                                        : element.surcharge!,
                                    textAlign: pw.TextAlign.center,
                                    style: style.copyWith(fontSize: 9.5),
                                  ),
                                ),
                                //DEBIT
                                pw.Expanded(
                                  flex: 2,
                                  child: pw.Center(
                                    child: pw.Text(
                                      element.dramount! == ".00"
                                          ? ""
                                          : element.dramount!,
                                      maxLines: 3,
                                      style: style.copyWith(fontSize: 9.5),
                                    ),
                                  ),
                                ),
                                //CREDIT
                                pw.Expanded(
                                  child: pw.Center(
                                    child: pw.Text(
                                      element.cramount! == ".00"
                                          ? ""
                                          : element.cramount!,
                                      maxLines: 3,
                                      style: style.copyWith(fontSize: 9.5),
                                    ),
                                  ),
                                ),
                                //TOTAL
                                pw.Expanded(
                                  flex: 2,
                                  child: pw.Center(
                                    child: pw.Text(
                                      element.total.toString(),
                                      maxLines: 3,
                                      style: style.copyWith(fontSize: 9.5),
                                    ),
                                  ),
                                ),
                                //BALANCE
                                pw.Expanded(
                                  flex: 2,
                                  child: pw.Center(
                                    child: pw.Text(
                                      element.balance.toString(),
                                      maxLines: 3,
                                      style: style.copyWith(fontSize: 9.5),
                                    ),
                                  ),
                                ),
                              ]),
                        );
                      },
                    )),
                    pw.Divider(color: PdfColors.black, thickness: 1, height: 1),
                    pw.SizedBox(height: 5),
                    pw.Row(children: [
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            "",
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      // pw.Expanded(
                      //   child: pw.Center(
                      //     child: pw.Text(
                      //       "Doc No.",
                      //       style: style,
                      //       textAlign: pw.TextAlign.left,
                      //     ),
                      //   ),
                      // ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Center(
                          child: pw.Text(
                            "Page Total :",
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.interest.toString() == "0.0"
                                ? ""
                                : reduced.interest.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.penalty.toString() == "0.0"
                                ? ""
                                : reduced.penalty.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.noticefee.toString() == "0.0"
                                ? ""
                                : reduced.noticefee.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.recovery.toString() == "0.0"
                                ? ""
                                : reduced.recovery.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.surcharge.toString() == "0.0"
                                ? ""
                                : reduced.surcharge.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Center(
                          child: pw.Text(
                            reduced.dramount.toString() == "0.0"
                                ? ""
                                : reduced.dramount.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.cramount.toString() == "0.0"
                                ? ""
                                : reduced.cramount.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Center(
                          child: pw.Text(
                            reduced.amount.toString() == "0.0"
                                ? ""
                                : reduced.amount.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Center(
                          child: pw.Text(
                            "",
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                    ]),
                    pw.SizedBox(height: 5),
                    pw.Row(children: [
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            "",
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      // pw.Expanded(
                      //   child: pw.Center(
                      //     child: pw.Text(
                      //       "Doc No.",
                      //       style: style,
                      //       textAlign: pw.TextAlign.left,
                      //     ),
                      //   ),
                      // ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Center(
                          child: pw.Text(
                            "Cum Total :",
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.interest.toString() == "0.0"
                                ? ""
                                : reduced.interest.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.penalty.toString() == "0.0"
                                ? ""
                                : reduced.penalty.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.noticefee.toString() == "0.0"
                                ? ""
                                : reduced.noticefee.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.recovery.toString() == "0.0"
                                ? ""
                                : reduced.recovery.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.surcharge.toString() == "0.0"
                                ? ""
                                : reduced.surcharge.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Center(
                          child: pw.Text(
                            reduced.dramount.toString() == "0.0"
                                ? ""
                                : reduced.dramount.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.cramount.toString() == "0.0"
                                ? ""
                                : reduced.cramount.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Center(
                          child: pw.Text(
                            reduced.amount.toString() == "0.0"
                                ? ""
                                : reduced.amount.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Center(
                          child: pw.Text(
                            "",
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                    ]),
                    pw.SizedBox(height: 5),
                    pw.Divider(color: PdfColors.black, thickness: 1, height: 1),
                    pw.SizedBox(height: 5),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                              "This statement is auto generated from Vasai Pragati Mobile App.",
                              style: style),
                          pw.Text("Page ${i + 1} of ${noPages.toInt()}",
                              style: style)
                        ])
                  ]),
            );
          },
        ),
      );
    }

    return pdf;
  }
}
