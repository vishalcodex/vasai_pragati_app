import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vasai_pragati/app/components/ui/my_list_view.dart';
import 'package:vasai_pragati/app/models/account_model.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';

class FixedDepositDetailsAlert extends StatelessWidget {
  final Account account;
  const FixedDepositDetailsAlert({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0 * fem, vertical: 30 * fem),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 15.0 * fem, vertical: 10 * fem),
          child: MyListView(
            scroll: true,
            children: [
              DetailEntryWidget(
                  title: "Account No.", value: account.fdMaster!.accountId!),
              DetailEntryWidget(
                  title: "Account Name",
                  value: account.accountName!.capitalize!),
              DetailEntryWidget(
                  title: "Maturity Amount",
                  value: "₹ ${account.fdMaster!.maturAmt}"),
              DetailEntryWidget(
                  title: "Date Of Opening",
                  value: DateFormat("dd MMM yy").format(DateFormat("yyyy-MM-dd")
                      .parse(account.fdMaster!.openDate!))),
              DetailEntryWidget(
                  title: "Amount", value: "₹ ${account.fdMaster!.amount}"),
              DetailEntryWidget(
                  title: "As Of Date",
                  value: DateFormat("dd MMM yy").format(DateFormat("yyyy-MM-dd")
                      .parse(account.fdMaster!.asofDate!))),
              DetailEntryWidget(
                  title: "Date Of Maturity",
                  value: DateFormat("dd MMM yy").format(DateFormat("yyyy-MM-dd")
                      .parse(account.fdMaster!.dateMatur!))),
              DetailEntryWidget(
                  title: "Rate Of Interest",
                  value: "${account.fdMaster!.intRate!}%"),
              // DetailEntryWidget(
              //     title: "Provision Amount",
              //     value: "₹ ${account.fdMaster!.pROVISIONS}"),
              DetailEntryWidget(
                  title: "Nominee Name", value: "₹ ${account.nomineeName}"),
              SizedBox(
                width: 10 * fem,
              ),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: RoundedContainer(
                      radius: 15,
                      color: ColorPallete.primary,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0 * fem, vertical: 10 * fem),
                        child: const TextView(
                          text: "Close",
                          fontSize: 14,
                          color: ColorPallete.theme,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailEntryWidget extends StatelessWidget {
  final String title;
  final String value;
  const DetailEntryWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10 * fem),
      child: RoundedContainer(
        radius: 0,
        child: MyListView(
          children: [
            TextView(
              text: title,
              color: ColorPallete.secondary,
              fontSize: 14,
            ),
            SizedBox(
              height: 5 * fem,
            ),
            TextView(
              text: value,
              color: ColorPallete.primary,
              fontSize: 16,
              weight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
