import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vasai_pragati/app/services/auth_service.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
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
                SizedBox(
                  height: 10 * fem,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0 * fem, vertical: 5 * fem),
                  child: MyListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              spreadRadius: 5,
                              blurRadius: 10,
                              color: ColorPallete.grey.withOpacity(0.5))
                        ]),
                        child: RoundedContainer(
                          radius: 10,
                          color: ColorPallete.theme,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0 * fem, horizontal: 15 * fem),
                            child: MyListView(
                              children: [
                                SizedBox(
                                  height: 5 * fem,
                                ),
                                const TextView(
                                  text: "Overall Summary",
                                  fontSize: 14,
                                  color: ColorPallete.secondary,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 10 * fem,
                                ),
                                _getEntry("No. Of Account", "5"),
                                _getEntry(
                                    "Account Name",
                                    Get.find<AuthService>()
                                            .user
                                            .value
                                            .accountName ??
                                        ""),
                                _getEntry("Amount", "₹ 5,00,000"),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getEntry(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: TextView(
              text: title,
              fontSize: 14,
              color: ColorPallete.secondary,
              overflow: TextOverflow.ellipsis,
              maxlines: 1,
            ),
          ),
          Expanded(
            flex: 3,
            child: TextView(
              text: value.capitalize!,
              fontSize: 14,
              color: ColorPallete.primary,
              alignment: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
