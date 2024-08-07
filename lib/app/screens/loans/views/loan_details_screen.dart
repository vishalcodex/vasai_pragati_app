import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/subgroup_model.dart';
import '../../../routes/app_routes.dart';
import '../controllers/loan_controller.dart';
import '../widgets/cash_credit/cash_credit_loans_view.dart';
import '../widgets/deposit/deposit_loans_view.dart';
import '../widgets/gold/gold_loans_view.dart';
import '../widgets/over_draft/over_draft_loans_view.dart';
import '../widgets/personal/personal_loans_view.dart';
import '../widgets/secured/secured_loans_view.dart';

// ignore: must_be_immutable
class LoanDetailsScreen extends GetView<LoanController> {
  const LoanDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    Subgroup pageName = Get.arguments["page_name"] ?? "";
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(0, 50 * fem),
          child: CustomAppBar(
            pageName: pageName.subgroupName!.capitalize!,
          ),
        ),
        backgroundColor: ColorPallete.theme,
        body: SafeArea(
          child: RoundedContainer(
            radius: 0,
            color: ColorPallete.grey.withOpacity(0.25),
            child: Obx(
              () => controller.noAccounts.value
                  ? const Center(
                      child: TextView(
                        text: "No Accounts",
                        color: ColorPallete.grey,
                        weight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: MyListView(
                            scroll: true,
                            children: [
                              MyListView(
                                children: [
                                  pageName.subgroupId!.trim() == "11" // "LN1"
                                      ? const PersonalLoansView()
                                      : pageName.subgroupId!.trim() ==
                                              "12" // "LN2"
                                          ? const SecuredLoansView()
                                          : pageName.subgroupId!.trim() ==
                                                  "13" // "LN3"
                                              ? const GoldLoansView()
                                              : pageName.subgroupId!.trim() ==
                                                      "14" // "LN4"
                                                  ? const DepositLoansView()
                                                  : pageName.subgroupId!
                                                              .trim() ==
                                                          "17" // "LN4"
                                                      ? const OverDraftLoansView()
                                                      : pageName.subgroupId!
                                                                  .trim() ==
                                                              "18" // "LN4"
                                                          ? const CashCreditLoansView()
                                                          : Container(),
                                ],
                              ),
                              SizedBox(
                                height: 5 * fem,
                              ),
                              Obx(() => controller.selectedAccount.value
                                      .transactions.isNotEmpty
                                  ? RoundedContainer(
                                      radius: 0,
                                      color: ColorPallete.theme,
                                      child: MyListView(
                                        children: [
                                          SizedBox(
                                            height: 15 * fem,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller
                                                      .showTransactions.value =
                                                  !controller
                                                      .showTransactions.value;
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.0 * fem),
                                              child: Row(
                                                children: [
                                                  const TextView(
                                                    text: "Transactions",
                                                    fontSize: 16,
                                                    color:
                                                        ColorPallete.secondary,
                                                    weight: FontWeight.w700,
                                                  ),
                                                  const Spacer(),
                                                  Obx(() => Transform.rotate(
                                                        angle: controller
                                                                .showTransactions
                                                                .value
                                                            ? pi
                                                            : 0,
                                                        child: const Icon(
                                                          Icons
                                                              .arrow_drop_down_circle_outlined,
                                                          color: ColorPallete
                                                              .secondary,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10 * fem,
                                          ),
                                          // List Of Transactions
                                          Obx(
                                            () => AnimatedSize(
                                              duration: const Duration(
                                                seconds: 1,
                                              ),
                                              child:
                                                  controller.showTransactions
                                                          .value
                                                      ? Container(
                                                          child:
                                                              RoundedContainer(
                                                            radius: 0,
                                                            color: ColorPallete
                                                                .theme,
                                                            child: (controller
                                                                    .selectedAccount
                                                                    .value
                                                                    .transactions
                                                                    .isEmpty)
                                                                ? Padding(
                                                                    padding: EdgeInsets
                                                                        .all(50.0 *
                                                                            fem),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: ColorPallete
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  )
                                                                : MyListView(
                                                                    children: controller
                                                                        .selectedAccount
                                                                        .value
                                                                        .transactions
                                                                        .map(
                                                                            (e) {
                                                                      return double.parse(e.amount ?? "0") ==
                                                                              0
                                                                          ? const SizedBox
                                                                              .shrink()
                                                                          : Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: 5.0 * fem),
                                                                              child: MyListView(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.all(10.0 * fem),
                                                                                    child: RoundedContainer(
                                                                                      radius: 0,
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: MyListView(
                                                                                              children: [
                                                                                                TextView(
                                                                                                  text: DateFormat("dd MMM yyyy").format(DateFormat("yyyy-MM-dd").parse(e.trnDate!)),
                                                                                                  color: ColorPallete.primary,
                                                                                                  fontSize: 16,
                                                                                                  weight: FontWeight.w600,
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  height: 5 * fem,
                                                                                                ),
                                                                                                TextView(
                                                                                                  text: "${e.shNarration!} ${e.nARRATION!}",
                                                                                                  color: ColorPallete.grey,
                                                                                                  weight: FontWeight.w600,
                                                                                                ),
                                                                                                // SizedBox(
                                                                                                //   height: 5 * fem,
                                                                                                // ),
                                                                                                // TextView(
                                                                                                //   text: e.nARRATION!,
                                                                                                //   color: ColorPallete.grey,
                                                                                                //   weight: FontWeight.w600,
                                                                                                // ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            width: 5 * fem,
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                                            children: [
                                                                                              TextView(alignment: TextAlign.right, fontSize: 18, color: ColorPallete.secondary, text: e.amount!),
                                                                                              Padding(
                                                                                                padding: EdgeInsets.only(bottom: 1.0 * fem),
                                                                                                child: TextView(
                                                                                                  text: e.crdb == "C" ? " Cr" : " Dr",
                                                                                                  alignment: TextAlign.right,
                                                                                                  color: e.crdb == "C" ? Colors.green : ColorPallete.red,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.symmetric(horizontal: 5.0 * fem),
                                                                                    child: Divider(
                                                                                      thickness: 1 * fem,
                                                                                      height: 1 * fem,
                                                                                      color: ColorPallete.grey.withOpacity(0.2),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            );
                                                                    }).toList(),
                                                                  ),
                                                          ),
                                                        )
                                                      : const SizedBox.shrink(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10 * fem,
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox.shrink())
                            ],
                          ),
                        ),
                        Obx(
                          () => controller
                                  .selectedAccount.value.transactions.isNotEmpty
                              ? Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color:
                                          ColorPallete.grey.withOpacity(0.25),
                                      blurRadius: 10 * fem,
                                      spreadRadius: 1 * fem,
                                    )
                                  ]),
                                  child: Container(
                                    color: ColorPallete.theme,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0 * fem,
                                          vertical: 10 * fem),
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.STATEMENT,
                                              arguments: {
                                                "account": controller
                                                    .selectedAccount.value,
                                                "type": "LOAN"
                                              });
                                        },
                                        child: RoundedContainer(
                                          radius: 10,
                                          color: ColorPallete.primary,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0 * fem),
                                            child: const Center(
                                              child: TextView(
                                                text: "Download Statement",
                                                color: ColorPallete.theme,
                                                weight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
