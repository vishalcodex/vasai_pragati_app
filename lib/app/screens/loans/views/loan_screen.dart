import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
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
                        ? MyListView(
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
                                            height: 45 * fem,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          )
                        : MyListView(
                            scroll: true,
                            children: [
                              MyListView(
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
                                                    EdgeInsets.all(15.0 * fem),
                                                child: Row(
                                                  children: [
                                                    TextView(
                                                      text: element
                                                          .subgroupName!
                                                          .capitalize!,
                                                      color: ColorPallete
                                                          .secondary,
                                                      fontSize: 16,
                                                    ),
                                                    const Spacer(),
                                                    Transform.flip(
                                                      flipX: true,
                                                      child: Image.asset(
                                                        "assets/ui/back.png",
                                                        color: ColorPallete
                                                            .primary,
                                                        height: 25 * fem,
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
                            ],
                          ),
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
