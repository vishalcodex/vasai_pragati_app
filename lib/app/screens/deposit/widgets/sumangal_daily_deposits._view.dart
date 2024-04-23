import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/deposit_controller.dart';

class SumangalDailyDepositsView extends GetView<DepositController> {
  const SumangalDailyDepositsView({super.key});

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
                                  text: "Account Name :",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: controller.selectedAccount.value
                                            .accountName ==
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
                                        text: controller.selectedAccount.value
                                            .accountName!.capitalize!,
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
                                  text: "Account Number :",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                  weight: FontWeight.w400,
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
                                        text: controller
                                            .selectedAccount.value.accountId!,
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
                                  text: "Mode Of Operation :",
                                  color: ColorPallete.grey,
                                  fontSize: 16,
                                  weight: FontWeight.w400,
                                ),
                              ),
                              Expanded(
                                child: controller.selectedAccount.value
                                            .accountName ==
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
                                        text: controller.selectedAccount.value
                                                .operationMode?.capitalize ??
                                            "Single",
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
                                  text: "Account Balance :",
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
                                                "₹ ${controller.selectedAccount.value.balance!}",
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
