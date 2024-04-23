import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/my_list_view.dart';
import '../../../../components/ui/rounded_container.dart';
import '../../../../components/ui/text_view.dart';
import '../../controllers/loan_controller.dart';
import '../detail_entry_widget.dart';

class SecuredLoanDetailView extends GetView<LoanController> {
  const SecuredLoanDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return MyListView(
      scroll: true,
      children: [
        DetailEntryWidget(
            title: "Account Holder Name",
            value: controller.selectedAccount.value.accountName!.capitalize!),
        const DetailEntryWidget(title: "Purpose", value: "Secured Loan"),
        DetailEntryWidget(
            title: "Sanctioned Amount",
            value: "${controller.selectedAccount.value.loanMaster!.amount!}/-"),
        DetailEntryWidget(
            title: "Balance",
            value:
                "${controller.selectedAccount.value.loanMaster!.lcbalance}/-"),
        DetailEntryWidget(
            title: "Rate Of Interest",
            value: "${controller.selectedAccount.value.loanMaster!.intRate}%"),
        DetailEntryWidget(
            title: "Installment Amount",
            value:
                "${controller.selectedAccount.value.loanMaster!.instAmount}/-"),
        DetailEntryWidget(
            title: "Tenure",
            value:
                "${controller.selectedAccount.value.loanMaster!.installment} months"),
        DetailEntryWidget(
            title: "Total Interest (Remaining Unpaid)",
            value:
                "${controller.selectedAccount.value.loanMaster!.currentInterest}/-"),
        const DetailEntryWidget(title: "Account Status", value: "Active"),
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
    );
  }
}
