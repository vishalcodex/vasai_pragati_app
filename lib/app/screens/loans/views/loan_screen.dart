import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/loan_controller.dart';

// ignore: must_be_immutable
class LoanScreen extends GetView<LoanController> {
  const LoanScreen({Key? key}) : super(key: key);

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
          child: CustomAppBar(pageName: "Loans"),
        ),
        backgroundColor: ColorPallete.theme,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10 * fem,
                ),
                const TextView(
                  text: "Your Loans",
                  color: ColorPallete.secondary,
                  fontSize: 16,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 10 * fem,
                ),
                Expanded(
                  child: Obx(
                    () => controller.loansList.isEmpty
                        ? GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            mainAxisSpacing: 5 * fem,
                            crossAxisSpacing: 5 * fem,
                            childAspectRatio: 1,
                            children: [1, 2, 3, 4, 5]
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
                                            height: 45 * fem,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          )
                        : GridView.count(
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            mainAxisSpacing: 5 * fem,
                            crossAxisSpacing: 5 * fem,
                            childAspectRatio: 1,
                            children: controller.loansList
                                .map((element) => InkWell(
                                      onTap: () {
                                        controller
                                            .onLoanServiceClicked(element);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0 * fem,
                                            vertical: 5 * fem),
                                        child: RoundedContainer(
                                          radius: 10,
                                          color: ColorPallete.primary
                                              .withOpacity(0.1),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(12.50 * fem),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Image.asset(
                                                    "assets/ui/loans.png",
                                                    height: 50 * fem,
                                                    width: 50 * fem,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20 * fem,
                                                ),
                                                Center(
                                                  child: TextView(
                                                    text: element.subgroupName!
                                                        .capitalize!
                                                        .replaceAll(" Loans",
                                                            "\nLoans"),
                                                    color:
                                                        ColorPallete.secondary,
                                                    weight: FontWeight.w600,
                                                    fontSize: 14,
                                                    maxlines: 2,
                                                    alignment: TextAlign.center,
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),

                    // controller.loansList.isEmpty
                    //     ? MyListView(
                    //         children: [
                    //           1,
                    //           2,
                    //           3,
                    //         ]
                    //             .map((e) => Padding(
                    //                   padding: EdgeInsets.symmetric(
                    //                       horizontal: 5.0 * fem,
                    //                       vertical: 5 * fem),
                    //                   child: RoundedContainer(
                    //                     radius: 0,
                    //                     child: Shimmer.fromColors(
                    //                       baseColor:
                    //                           Colors.grey.withOpacity(0.2),
                    //                       highlightColor: Colors.white,
                    //                       child: RoundedContainer(
                    //                         radius: 10,
                    //                         color: ColorPallete.grey,
                    //                         height: 45 * fem,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ))
                    //             .toList(),
                    //       )
                    //     : MyListView(
                    //         scroll: true,
                    //         children: [
                    //           MyListView(
                    //             children: controller.loansList
                    //                 .map((element) => InkWell(
                    //                       onTap: () {
                    //                         controller
                    //                             .onLoanServiceClicked(element);
                    //                       },
                    //                       child: Padding(
                    //                         padding: EdgeInsets.symmetric(
                    //                             horizontal: 5.0 * fem,
                    //                             vertical: 5 * fem),
                    //                         child: RoundedContainer(
                    //                           radius: 10,
                    //                           color: ColorPallete.primary
                    //                               .withOpacity(0.1),
                    //                           child: Padding(
                    //                             padding:
                    //                                 EdgeInsets.all(15.0 * fem),
                    //                             child: Row(
                    //                               children: [
                    //                                 TextView(
                    //                                   text: element
                    //                                       .subgroupName!
                    //                                       .capitalize!,
                    //                                   color: ColorPallete
                    //                                       .secondary,
                    //                                   fontSize: 16,
                    //                                 ),
                    //                                 const Spacer(),
                    //                                 Transform.flip(
                    //                                   flipX: true,
                    //                                   child: Image.asset(
                    //                                     "assets/ui/back.png",
                    //                                     color: ColorPallete
                    //                                         .primary,
                    //                                     height: 25 * fem,
                    //                                   ),
                    //                                 )
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ))
                    //                 .toList(),
                    //           ),
                    //         ],
                    //       ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
