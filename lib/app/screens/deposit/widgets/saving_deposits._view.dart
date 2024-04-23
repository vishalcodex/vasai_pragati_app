import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/deposit_controller.dart';
import 'acc_card .dart';

class SavingsView extends GetView<DepositController> {
  const SavingsView({super.key});

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
        Obx(
          () => RoundedContainer(
            radius: 0,
            height: 175,
            color: ColorPallete.theme,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0 * fem),
              child: controller.accounts.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
                      child: RoundedContainer(
                        radius: 15,
                        clip: Clip.antiAliasWithSaveLayer,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.2),
                          highlightColor: Colors.white,
                          child: RoundedContainer(
                            radius: 15,
                            color: ColorPallete.grey,
                            height: 155 * fem,
                          ),
                        ),
                      ),
                    )
                  : PageView(
                      padEnds: false,
                      controller: PageController(
                          initialPage: 0, viewportFraction: 0.925),
                      onPageChanged: (value) {
                        controller.selectedAccount.value =
                            controller.accounts.elementAt(value);
                        controller.selectedAccount.refresh();
                      },
                      children: controller.accounts.map((account) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.5 * fem),
                          child: AccCard(
                              memberNo: account.mEMBREGNO,
                              accHolder: account.accountName,
                              accountNo: account.accountId,
                              balance: account.balance),
                        );
                      }).toList(),
                    ),
            ),
          ),
        ),
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
                              const TextView(
                                text: "Account Name :",
                                color: ColorPallete.grey,
                                fontSize: 16,
                                weight: FontWeight.w400,
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
                              const TextView(
                                text: "Account Number :",
                                color: ColorPallete.grey,
                                fontSize: 16,
                                weight: FontWeight.w400,
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
                              const TextView(
                                text: "Mode Of Operation :",
                                color: ColorPallete.grey,
                                fontSize: 16,
                                weight: FontWeight.w400,
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
                                        text: controller.selectedAccount.value
                                            .operationMode!.capitalize!,
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
                              const TextView(
                                text: "Account Balance :",
                                color: ColorPallete.grey,
                                fontSize: 16,
                                weight: FontWeight.w400,
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
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextView(
                                text: "Nominee :",
                                color: ColorPallete.grey,
                                fontSize: 16,
                                weight: FontWeight.w400,
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
                                            .nomineeName!.capitalize!,
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
