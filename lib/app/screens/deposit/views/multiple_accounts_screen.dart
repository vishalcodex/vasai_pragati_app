import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/deposit_controller.dart';
import '../widgets/fixed_deposit_alert.dart';

// ignore: must_be_immutable
class MultipleAccountsScreen extends GetView<DepositController> {
  const MultipleAccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(0, 50 * fem),
          child: CustomAppBar(
              pageName:
                  "${controller.pageName.value.subgroupName!.capitalize!} Accounts"),
        ),
        backgroundColor: ColorPallete.theme,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10 * fem,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
              //   child: const Row(
              //     children: [
              //       TextView(
              //         text: "Your Accounts :",
              //         color: ColorPallete.secondary,
              //         fontSize: 16,
              //         weight: FontWeight.w700,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 5 * fem,
              ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RoundedContainer(
                        radius: 10,
                        borderColor: ColorPallete.secondary,
                        child: Padding(
                          padding: EdgeInsets.all(10.0 * fem),
                          child: MyListView(
                            children: [
                              const Center(
                                child: TextView(
                                  text: "Total Number of Accounts",
                                  color: ColorPallete.secondary,
                                  fontSize: 14,
                                  weight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              Center(
                                child: TextView(
                                  text: "${controller.accounts.length}",
                                  color: ColorPallete.secondary,
                                  fontSize: 18,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      RoundedContainer(
                        radius: 10,
                        borderColor: ColorPallete.secondary,
                        child: Padding(
                          padding: EdgeInsets.all(10.0 * fem),
                          child: MyListView(
                            children: [
                              const Center(
                                child: TextView(
                                  text: "Total Deposited Amount",
                                  color: ColorPallete.secondary,
                                  fontSize: 14,
                                  weight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              Center(
                                child: TextView(
                                  text: "₹ ${controller.getTotalAmount()} /-",
                                  color: ColorPallete.secondary,
                                  fontSize: 18,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10 * fem,
              ),
              Expanded(
                child: Obx(
                  () => controller.accounts.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: MyListView(
                            children: [
                              1,
                              2,
                              3,
                            ]
                                .map((e) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0 * fem,
                                          vertical: 5 * fem),
                                      child: RoundedContainer(
                                        radius: 0,
                                        child: Shimmer.fromColors(
                                          baseColor:
                                              Colors.grey.withOpacity(0.2),
                                          highlightColor: Colors.white,
                                          child: RoundedContainer(
                                            radius: 10,
                                            color: ColorPallete.grey,
                                            height: 100 * fem,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
                      : MyListView(
                          scroll: true,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0 * fem, vertical: 5 * fem),
                              child: MyListView(
                                children: controller.accounts
                                    .map((element) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0 * fem,
                                              vertical: 7.5 * fem),
                                          child: Container(
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0, 5 * fem),
                                                blurRadius: 10,
                                                spreadRadius: 2,
                                                color: ColorPallete.grey
                                                    .withOpacity(0.2),
                                              )
                                            ]),
                                            child: RoundedContainer(
                                              radius: 10,
                                              color: ColorPallete.theme,
                                              borderColor:
                                                  Colors.grey.withOpacity(0.2),
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.all(15.0 * fem),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const TextView(
                                                          text:
                                                              "Account No. : ",
                                                          color: ColorPallete
                                                              .secondary,
                                                          fontSize: 16,
                                                        ),
                                                        TextView(
                                                          text: element
                                                              .fdMaster!
                                                              .accountId!
                                                              .capitalize!,
                                                          color: ColorPallete
                                                              .primary,
                                                          fontSize: 16,
                                                        ),
                                                        const Spacer(),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5 * fem,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const TextView(
                                                          text:
                                                              "Account Name : ",
                                                          color: ColorPallete
                                                              .secondary,
                                                          fontSize: 16,
                                                        ),
                                                        TextView(
                                                          text: element
                                                              .accountName!
                                                              .capitalize!,
                                                          color: ColorPallete
                                                              .primary,
                                                          fontSize: 16,
                                                        ),
                                                        const Spacer(),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5 * fem,
                                                    ),
                                                    // Row(
                                                    //   children: [
                                                    //     const TextView(
                                                    //       text:
                                                    //           "Maturity Date : ",
                                                    //       color: ColorPallete
                                                    //           .secondary,
                                                    //       fontSize: 16,
                                                    //     ),
                                                    //     TextView(
                                                    //       text: controller.formatDate(
                                                    //           element.fdMaster!
                                                    //               .dateMatur!,
                                                    //           format:
                                                    //               "yyyy-MM-dd"),
                                                    //       color: ColorPallete
                                                    //           .primary,
                                                    //       fontSize: 16,
                                                    //     ),
                                                    //     const Spacer(),
                                                    //   ],
                                                    // ),
                                                    // SizedBox(
                                                    //   height: 5 * fem,
                                                    // ),
                                                    Row(
                                                      children: [
                                                        const TextView(
                                                          text:
                                                              "Maturity Amount : ",
                                                          color: ColorPallete
                                                              .secondary,
                                                          fontSize: 16,
                                                        ),
                                                        TextView(
                                                          text:
                                                              "₹ ${element.fdMaster!.maturAmt!}/-",
                                                          color: ColorPallete
                                                              .primary,
                                                          fontSize: 16,
                                                        ),
                                                        const Spacer(),
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
                                                            // controller
                                                            //     .onFDAccountSelected(
                                                            //         element);

                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return FixedDepositDetailsAlert(
                                                                  account:
                                                                      element,
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child:
                                                              RoundedContainer(
                                                            radius: 10,
                                                            color: ColorPallete
                                                                .primary,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          15.0 *
                                                                              fem,
                                                                      vertical:
                                                                          10 *
                                                                              fem),
                                                              child:
                                                                  const TextView(
                                                                text:
                                                                    "View More",
                                                                color:
                                                                    ColorPallete
                                                                        .theme,
                                                                fontSize: 14,
                                                                weight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
