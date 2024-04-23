import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/deposit_controller.dart';

// ignore: must_be_immutable
class DepositScreen extends GetView<DepositController> {
  const DepositScreen({Key? key}) : super(key: key);

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
          child: CustomAppBar(pageName: "Deposits"),
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
                  text: "Your Deposits",
                  color: ColorPallete.secondary,
                  fontSize: 16,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 10 * fem,
                ),
                Expanded(
                  child: Obx(
                    () => controller.depositList.isEmpty
                        ? GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            mainAxisSpacing: 5 * fem,
                            crossAxisSpacing: 5 * fem,
                            childAspectRatio: 1,
                            children: [1, 2, 3, 4, 5, 6, 7]
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
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            mainAxisSpacing: 5 * fem,
                            crossAxisSpacing: 5 * fem,
                            childAspectRatio: 1,
                            children: controller.depositList
                                .map((element) => InkWell(
                                      onTap: () {
                                        controller
                                            .onDepositServiceClicked(element);
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Center(
                                                  child: Image.asset(
                                                    "assets/ui/deposits.png",
                                                    height: 35 * fem,
                                                    width: 35 * fem,
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   height: 10 * fem,
                                                // ),
                                                Center(
                                                  child: TextView(
                                                    text: element.subgroupName!
                                                        .capitalize!,
                                                    color:
                                                        ColorPallete.secondary,
                                                    weight: FontWeight.w600,
                                                    fontSize: 12,
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
