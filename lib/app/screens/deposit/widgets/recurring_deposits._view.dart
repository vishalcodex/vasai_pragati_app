import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/deposit_controller.dart';

class RecurringDepositsView extends GetView<DepositController> {
  const RecurringDepositsView({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return MyListView(
      children: [
        SizedBox(
          height: 5 * fem,
        ),
        RoundedContainer(
          radius: 0,
          color: ColorPallete.theme,
          child: MyListView(
            children: [
              SizedBox(
                height: 15 * fem,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                child: const TextView(
                  text: "Account Details",
                  fontSize: 16,
                  color: ColorPallete.secondary,
                  weight: FontWeight.w700,
                ),
              ),

              //Account Details
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10 * fem, horizontal: 20 * fem),
                  child: RoundedContainer(
                    radius: 10,
                    // borderColor: ColorPallete.grey.withOpacity(0.5),
                    child: MyListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: TextView(
                                  text: "Date Of Opening :",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child:
                                    controller.selectedAccount.value.openDate ==
                                            null
                                        ? RoundedContainer(
                                            radius: 0,
                                            child: Shimmer.fromColors(
                                              baseColor:
                                                  Colors.grey.withOpacity(0.2),
                                              highlightColor: Colors.white,
                                              child: RoundedContainer(
                                                radius: 5,
                                                color: ColorPallete.grey,
                                                height: 15 * fem,
                                              ),
                                            ),
                                          )
                                        : TextView(
                                            text: DateFormat("dd MMM yy")
                                                .format(DateFormat("yyyy-MM-dd")
                                                    .parse(controller
                                                        .selectedAccount
                                                        .value
                                                        .fdMaster!
                                                        .openDate!)),
                                            alignment: TextAlign.right,
                                            color: ColorPallete.secondary,
                                            fontSize: 16,
                                          ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: TextView(
                                  text: "Amount :",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child:
                                    controller.selectedAccount.value.balance ==
                                            null
                                        ? RoundedContainer(
                                            radius: 0,
                                            child: Shimmer.fromColors(
                                              baseColor:
                                                  Colors.grey.withOpacity(0.2),
                                              highlightColor: Colors.white,
                                              child: RoundedContainer(
                                                radius: 5,
                                                color: ColorPallete.grey,
                                                height: 15 * fem,
                                              ),
                                            ),
                                          )
                                        : TextView(
                                            text:
                                                "₹ ${controller.selectedAccount.value.fdMaster!.amount}",
                                            alignment: TextAlign.right,
                                            color: ColorPallete.secondary,
                                            fontSize: 16,
                                          ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: TextView(
                                  text: "As Of Date :",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                ),
                              ),
                              Expanded(
                                child: controller
                                            .selectedAccount.value.accountId ==
                                        null
                                    ? RoundedContainer(
                                        radius: 0,
                                        child: Shimmer.fromColors(
                                          baseColor:
                                              Colors.grey.withOpacity(0.2),
                                          highlightColor: Colors.white,
                                          child: RoundedContainer(
                                            radius: 5,
                                            color: ColorPallete.grey,
                                            height: 15 * fem,
                                          ),
                                        ),
                                      )
                                    : TextView(
                                        text: DateFormat("dd MMM yy").format(
                                            DateFormat("yyyy-MM-dd").parse(
                                                controller.selectedAccount.value
                                                    .fdMaster!.asofDate!)),
                                        alignment: TextAlign.right,
                                        color: ColorPallete.secondary,
                                        fontSize: 16,
                                      ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: TextView(
                                  text: "Date Of Maturity :",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: controller.selectedAccount.value
                                            .operationMode ==
                                        null
                                    ? RoundedContainer(
                                        radius: 0,
                                        child: Shimmer.fromColors(
                                          baseColor:
                                              Colors.grey.withOpacity(0.2),
                                          highlightColor: Colors.white,
                                          child: RoundedContainer(
                                            radius: 5,
                                            color: ColorPallete.grey,
                                            height: 15 * fem,
                                          ),
                                        ),
                                      )
                                    : TextView(
                                        text: DateFormat("dd MMM yy").format(
                                            DateFormat("yyyy-MM-dd").parse(
                                                controller.selectedAccount.value
                                                    .fdMaster!.dateMatur!)),
                                        alignment: TextAlign.right,
                                        color: ColorPallete.secondary,
                                        fontSize: 16,
                                      ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: TextView(
                                  text: "Rate Of Interest :",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                ),
                              ),
                              Expanded(
                                child: controller
                                            .selectedAccount.value.accountId ==
                                        null
                                    ? RoundedContainer(
                                        radius: 0,
                                        child: Shimmer.fromColors(
                                          baseColor:
                                              Colors.grey.withOpacity(0.2),
                                          highlightColor: Colors.white,
                                          child: RoundedContainer(
                                            radius: 5,
                                            color: ColorPallete.grey,
                                            height: 15 * fem,
                                          ),
                                        ),
                                      )
                                    : TextView(
                                        text:
                                            "${controller.selectedAccount.value.fdMaster!.intRate!}%",
                                        alignment: TextAlign.right,
                                        color: ColorPallete.secondary,
                                        fontSize: 16,
                                      ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: TextView(
                                  text: "Installments :",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: controller.selectedAccount.value
                                            .accountName ==
                                        // .fdMaster!.installment ==
                                        null
                                    ? RoundedContainer(
                                        radius: 0,
                                        child: Shimmer.fromColors(
                                          baseColor:
                                              Colors.grey.withOpacity(0.2),
                                          highlightColor: Colors.white,
                                          child: RoundedContainer(
                                            radius: 5,
                                            color: ColorPallete.grey,
                                            height: 15 * fem,
                                          ),
                                        ),
                                      )
                                    : TextView(
                                        text:
                                            "₹ ${controller.selectedAccount.value.fdMaster?.installment ?? "1,200"}",
                                        alignment: TextAlign.right,
                                        color: ColorPallete.secondary,
                                        fontSize: 16,
                                      ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: TextView(
                                  text: "Maturity Amount :",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child:
                                    controller.selectedAccount.value.balance ==
                                            null
                                        ? RoundedContainer(
                                            radius: 0,
                                            child: Shimmer.fromColors(
                                              baseColor:
                                                  Colors.grey.withOpacity(0.2),
                                              highlightColor: Colors.white,
                                              child: RoundedContainer(
                                                radius: 5,
                                                color: ColorPallete.grey,
                                                height: 15 * fem,
                                              ),
                                            ),
                                          )
                                        : TextView(
                                            text:
                                                "₹ ${controller.selectedAccount.value.fdMaster!.maturAmt}",
                                            alignment: TextAlign.right,
                                            color: ColorPallete.secondary,
                                            fontSize: 16,
                                          ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
