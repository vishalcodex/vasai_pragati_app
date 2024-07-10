import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/color_pallete.dart';
import '../../../../components/ui/my_list_view.dart';
import '../../../../components/ui/rounded_container.dart';
import '../../../../components/ui/text_view.dart';
import '../../../deposit/widgets/acc_card .dart';
import '../../controllers/loan_controller.dart';
import '../details_alert.dart';

class SecuredLoansView extends GetView<LoanController> {
  const SecuredLoansView({super.key});

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
              child: controller.isLoading.value
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
                  text: "Loan Details",
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
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 5.0 * fem),
                                child: MyListView(
                                  children: [
                                    const TextView(
                                      text: "Acc. Holder Name :",
                                      color: ColorPallete.grey,
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: 5 * fem,
                                    ),
                                    controller.selectedAccount.value
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
                                            text: controller.selectedAccount
                                                .value.accountName!.capitalize!,
                                            alignment: TextAlign.left,
                                            color: ColorPallete.secondary,
                                            fontSize: 16,
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10 * fem,
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 5.0 * fem),
                                child: MyListView(
                                  children: [
                                    const TextView(
                                      text: "Purpose :",
                                      color: ColorPallete.grey,
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                      alignment: TextAlign.right,
                                    ),
                                    SizedBox(
                                      height: 5 * fem,
                                    ),
                                    controller.selectedAccount.value
                                                .accountId ==
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
                                        : const TextView(
                                            text: "Secured Loan",
                                            // controller
                                            //     .selectedAccount
                                            //     .value
                                            //     .accountId!,
                                            alignment: TextAlign.right,
                                            color: ColorPallete.secondary,
                                            fontSize: 16,
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10 * fem,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 5.0 * fem),
                                child: MyListView(
                                  children: [
                                    const TextView(
                                      text: "Sancation Date :",
                                      color: ColorPallete.grey,
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: 5 * fem,
                                    ),
                                    controller.selectedAccount.value
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
                                            text: DateFormat("dd MMM yyyy")
                                                .format(
                                              DateFormat("yyyy-MM-dd").parse(
                                                  controller.selectedAccount
                                                      .value.openDate!),
                                            ),
                                            alignment: TextAlign.left,
                                            color: ColorPallete.secondary,
                                            fontSize: 16,
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10 * fem,
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 5.0 * fem),
                                child: MyListView(
                                  children: [
                                    const TextView(
                                      text: "Sancation Amount :",
                                      color: ColorPallete.grey,
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                      alignment: TextAlign.right,
                                    ),
                                    SizedBox(
                                      height: 5 * fem,
                                    ),
                                    controller.selectedAccount.value
                                                .accountId ==
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
                                                "₹ ${controller.selectedAccount.value.loanMaster!.amount}",
                                            alignment: TextAlign.right,
                                            color: ColorPallete.secondary,
                                            fontSize: 16,
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10 * fem,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 5.0 * fem),
                                child: MyListView(
                                  children: [
                                    const TextView(
                                      text: "Balance :",
                                      color: ColorPallete.grey,
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: 5 * fem,
                                    ),
                                    controller.selectedAccount.value
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
                                            text:
                                                "₹ ${controller.selectedAccount.value.balance!}",
                                            alignment: TextAlign.left,
                                            color: ColorPallete.secondary,
                                            fontSize: 16,
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10 * fem,
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 5.0 * fem),
                                child: MyListView(
                                  children: [
                                    const TextView(
                                      text: "Rate Of Interest :",
                                      color: ColorPallete.grey,
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                      alignment: TextAlign.right,
                                    ),
                                    SizedBox(
                                      height: 5 * fem,
                                    ),
                                    controller.selectedAccount.value
                                                .accountId ==
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
                                                "${controller.selectedAccount.value.loanMaster!.intRate}%",
                                            alignment: TextAlign.right,
                                            color: ColorPallete.secondary,
                                            fontSize: 16,
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10 * fem,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const DetailsAlert(page: "Secured");
                                  },
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10.0 * fem),
                                child: const TextView(
                                  text: "View More",
                                  alignment: TextAlign.right,
                                  color: ColorPallete.primary,
                                  weight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
