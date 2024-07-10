import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/deposit_controller.dart';

// ignore: must_be_immutable
class ClosedAccountsScreen extends GetView<DepositController> {
  const ClosedAccountsScreen({Key? key}) : super(key: key);

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
          child: CustomAppBar(pageName: "Closed Accounts"),
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
                const Center(
                  child: TextView(
                    text: "No Accounts",
                    color: ColorPallete.grey,
                    weight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 10 * fem,
                ),
                // Expanded(
                //   child: Obx(
                //     () => controller.depositList.isEmpty
                //         ?  :  ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
