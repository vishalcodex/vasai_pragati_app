import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../models/account_model.dart';
import '../../../models/transaction_model.dart';

class DepositStatement {
  static Future<pw.Document> createStatement(
      Account account,
      List<Transaction> transactions,
      String fromDate,
      String toDate,
      double accBalance) async {
    var loadImage = await rootBundle.load('assets/ui/logo.png');
    pw.TextStyle style =
        const pw.TextStyle(fontSize: 10, color: PdfColors.black);
    pw.Document pdf = pw.Document();
    // Group list into 18 entries per page
    List<Transaction> temptrns = [];
    temptrns.addAll(transactions.reversed);
    int noEntries = 17;
    double noPages = (temptrns.length / noEntries).ceilToDouble();

    for (var i = 0; i < noPages; i++) {
      List<Transaction> selectedTransactions = [];
      selectedTransactions.addAll(temptrns.getRange(i * noEntries,
          i == (noPages - 1) ? temptrns.length : noEntries * (i + 1)));
      Transaction reduced = selectedTransactions.reduce(
          (previousValue, element) => Transaction(
              dramount: (double.parse(previousValue.dramount ?? "0") +
                      double.parse(element.dramount!))
                  .toString(),
              cramount: (double.parse(previousValue.cramount ?? "0") +
                      double.parse(element.cramount!))
                  .toString(),
              amount: (double.parse(previousValue.amount ?? "0") +
                      double.parse(element.amount!))
                  .toString()));
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
                    // pw.Image(
                    //   pw.MemoryImage(logoImage),
                    // ),
                    pw.SizedBox(height: 15),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.SizedBox(
                            height: 50,
                            width: 50,
                            // child: pw.Image(
                            //   pw.MemoryImage(loadImage.buffer.asUint8List(loadImage.offsetInBytes, loadImage.lengthInBytes)),
                            // ),
                          ),
                          pw.Text(
                              "VASAI PRAGATI CO-OPERATIVE CREDIT SOCIETY LTD., ARNALA",
                              style: style.copyWith(
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(
                            height: 30,
                            width: 30,
                            child: pw.Image(
                              pw.MemoryImage(loadImage.buffer.asUint8List(
                                  loadImage.offsetInBytes,
                                  loadImage.lengthInBytes)),
                            ),
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
                    pw.SizedBox(height: 15),
                    //AC NO.
                    pw.Row(children: [
                      pw.Text("Ac No. : ${account.acno}",
                          textAlign: pw.TextAlign.left, style: style),
                    ]),
                    pw.SizedBox(height: 5),
                    // NAME
                    pw.Row(children: [
                      pw.Text(
                          "Acc. Holder Name : ${account.accountName!.toUpperCase()}",
                          textAlign: pw.TextAlign.left,
                          style: style),
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
                              "Particulars",
                              style: style,
                              textAlign: pw.TextAlign.left,
                            ),
                          ),
                        ),
                        pw.Expanded(
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
                        accBalance = element.crdb! == "C"
                            ? accBalance + double.parse(element.amount!)
                            : accBalance - double.parse(element.amount!);
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
                                pw.Expanded(
                                  child: pw.Center(
                                    child: pw.Text(
                                        DateFormat("dd MMM yyyy").format(
                                          DateFormat("yyyy-MM-dd")
                                              .parse(element.trnDate!),
                                        ),
                                        style: style),
                                  ),
                                ),
                                // pw.Expanded(
                                //   child: pw.Center(
                                //     child: pw.Text(
                                //        element.dramount!,
                                //         style: style),
                                //   ),
                                // ),
                                pw.Expanded(
                                  child: pw.Text(
                                    element.shNarration!,
                                    textAlign: pw.TextAlign.center,
                                    style: style.copyWith(fontSize: 10),
                                  ),
                                ),
                                pw.Expanded(
                                  child: pw.Text(
                                    element.nARRATION!,
                                    textAlign: pw.TextAlign.left,
                                    style: style.copyWith(fontSize: 10),
                                  ),
                                ),
                                pw.Expanded(
                                  child: pw.Center(
                                    child: pw.Text(
                                      element.dramount! == ".00"
                                          ? ""
                                          : element.dramount!,
                                      maxLines: 3,
                                      style: style.copyWith(fontSize: 10),
                                    ),
                                  ),
                                ),
                                pw.Expanded(
                                  child: pw.Center(
                                    child: pw.Text(
                                      element.cramount! == ".00"
                                          ? ""
                                          : element.cramount!,
                                      maxLines: 3,
                                      style: style.copyWith(fontSize: 10),
                                    ),
                                  ),
                                ),
                                pw.Expanded(
                                  child: pw.Center(
                                    child: pw.Text(
                                      accBalance.toString(),
                                      maxLines: 3,
                                      style: style.copyWith(fontSize: 10),
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
                        child: pw.Text(
                          "Page Total -",
                          style: style,
                          textAlign: pw.TextAlign.left,
                        ),
                      ),

                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.dramount.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.cramount.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
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
                        child: pw.Text(
                          "Cumulative Total - ",
                          style: style,
                          textAlign: pw.TextAlign.left,
                        ),
                      ),

                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.dramount.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            reduced.cramount.toString(),
                            style: style,
                            textAlign: pw.TextAlign.left,
                          ),
                        ),
                      ),
                      pw.Expanded(
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
                    pw.Row(children: [
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
