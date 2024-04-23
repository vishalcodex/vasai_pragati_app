import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../routes/app_routes.dart';
import '../controllers/deposit_controller.dart';
import '../widgets/current_deposits_view.dart';
import '../widgets/recurring_deposits._view.dart';
import '../widgets/saving_deposits._view.dart';
import '../widgets/fixed_double_mid_qid_deposits._view.dart';
import '../widgets/sumangal_daily_deposits._view.dart';

// ignore: must_be_immutable
class DepositDetailsScreen extends GetView<DepositController> {
  const DepositDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(0, 50 * fem),
          child: CustomAppBar(
            pageName: controller.pageName.value.subgroupName!.capitalize!,
            onBackPressed: () {
              controller.showTransactions.value = false;
              controller.showTransactions.refresh();

              Get.back();
            },
          ),
        ),
        backgroundColor: ColorPallete.theme,
        body: WillPopScope(
          onWillPop: () {
            controller.showTransactions.value = false;
            return Future.value(true);
          },
          child: SafeArea(
            child: RoundedContainer(
              radius: 0,
              color: ColorPallete.grey.withOpacity(0.25),
              child: Column(
                children: [
                  Expanded(
                    child: MyListView(
                      scroll: true,
                      children: [
                        MyListView(
                          children: [
                            controller.pageName.value.aliasName!.trim() == "SB"
                                ? const SavingsView()
                                : controller.pageName.value.aliasName!.trim() ==
                                        "CD"
                                    ? const CurrentDepositsView()
                                    : ["FD", "DD", "MIDS", "QIDS"].contains(
                                            controller.pageName.value.aliasName!
                                                .trim())
                                        ? const FixedDoubleMIDQIDDepositsView()
                                        : ["SMD", "DDS"].contains(controller
                                                .pageName.value.aliasName!
                                                .trim())
                                            ? const SumangalDailyDepositsView()
                                            : controller.pageName.value
                                                        .aliasName!
                                                        .trim() ==
                                                    "RD"
                                                ? RecurringDepositsView()
                                                : const MyListView(
                                                    scroll: true,
                                                    children: [],
                                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 5 * fem,
                        ),
                        if (![
                          "FD",
                          "DD",
                          "MIDS",
                          "QIDS"
                        ].contains(controller.pageName.value.aliasName!.trim()))
                          MyListView(
                            children: [
                              RoundedContainer(
                                radius: 0,
                                color: ColorPallete.theme,
                                child: InkWell(
                                  onTap: () {
                                    controller.showTransactions.value =
                                        !controller.showTransactions.value;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.0 * fem,
                                        vertical: 10 * fem),
                                    child: Row(
                                      children: [
                                        const TextView(
                                          text: "Transactions",
                                          fontSize: 16,
                                          color: ColorPallete.secondary,
                                          weight: FontWeight.w700,
                                        ),
                                        const Spacer(),
                                        Obx(() => Transform.rotate(
                                              angle: controller
                                                      .showTransactions.value
                                                  ? pi
                                                  : 0,
                                              child: const Icon(
                                                Icons
                                                    .arrow_drop_down_circle_outlined,
                                                color: ColorPallete.secondary,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => AnimatedSize(
                                  duration: const Duration(seconds: 1),
                                  child: controller.showTransactions.value
                                      ? Container(
                                          child: RoundedContainer(
                                            radius: 0,
                                            color: ColorPallete.theme,
                                            child:
                                                (controller
                                                        .selectedAccount
                                                        .value
                                                        .transactions
                                                        .isEmpty)
                                                    ? Padding(
                                                        padding: EdgeInsets.all(
                                                            50.0 * fem),
                                                        child: const Center(
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
                                                            .map((e) {
                                                          return double.parse(
                                                                      e.amount ??
                                                                          "0") ==
                                                                  0
                                                              ? const SizedBox
                                                                  .shrink()
                                                              : Padding(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          5.0 *
                                                                              fem),
                                                                  child:
                                                                      MyListView(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0 *
                                                                                fem),
                                                                        child:
                                                                            RoundedContainer(
                                                                          radius:
                                                                              0,
                                                                          child:
                                                                              Row(
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
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Row(
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
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 5.0 * fem),
                                                                        child:
                                                                            Divider(
                                                                          thickness:
                                                                              1 * fem,
                                                                          height:
                                                                              1 * fem,
                                                                          color: ColorPallete
                                                                              .grey
                                                                              .withOpacity(0.2),
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
                            ],
                          ),
                      ],
                    ),
                  ),
                  if (!["FD", "DD", "MIDS", "QIDS"]
                      .contains(controller.pageName.value.aliasName!.trim()))
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: ColorPallete.grey.withOpacity(0.25),
                          blurRadius: 10 * fem,
                          spreadRadius: 1 * fem,
                        )
                      ]),
                      child: Container(
                        color: ColorPallete.theme,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0 * fem, vertical: 10 * fem),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.STATEMENT, arguments: {
                                "account": controller.selectedAccount.value,
                                "type": "DEPOSIT"
                              });
                            },
                            child: RoundedContainer(
                              radius: 10,
                              height: 45,
                              color: ColorPallete.primary,
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 10.0 * fem),
                                child: const Center(
                                  child: TextView(
                                    text: "Download Statement",
                                    color: ColorPallete.theme,
                                    weight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
