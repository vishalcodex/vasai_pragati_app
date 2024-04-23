import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';

class AccCard extends StatelessWidget {
  final String? memberNo;
  final String? accHolder;
  final String? accountNo;
  final String? balance;
  const AccCard(
      {super.key,
      required this.memberNo,
      required this.accHolder,
      required this.accountNo,
      required this.balance});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return RoundedContainer(
      radius: 10,
      color: Color(0xff13153B),
      height: 150,
      child: Stack(
        children: [
          Positioned(
            left: 10 * fem,
            top: 10 * fem,
            child: Image.asset(
              "assets/ui/card_logo.png",
              width: 125 * fem,
            ),
          ),
          Center(
            child: Image.asset(
              "assets/ui/saving_card_bg.png",
              color: ColorPallete.theme,
              width: 200 * fem,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0 * fem),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedContainer(
                  radius: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Image.asset(
                      //   "assets/ui/card_logo.png",
                      //   width: 125 * fem,
                      // ),
                      const Spacer(),
                      Expanded(
                        child: TextView(
                          text: accHolder!.capitalize ?? "",
                          fontSize: 12,
                          color: ColorPallete.theme,
                          alignment: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                RoundedContainer(
                  radius: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextView(
                        text: "A/C No.",
                        fontSize: 14,
                        color: ColorPallete.grey.withOpacity(0.8),
                        weight: FontWeight.w400,
                      ),
                      SizedBox(
                        width: 10 * fem,
                      ),
                      TextView(
                        text: accountNo ?? "000000000000",
                        fontSize: 18,
                        color: ColorPallete.theme,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                RoundedContainer(
                  radius: 0,
                  child: MyListView(
                    children: [
                      TextView(
                        text: "A/C Balance",
                        fontSize: 14,
                        color: ColorPallete.grey.withOpacity(0.8),
                      ),
                      SizedBox(
                        height: 5 * fem,
                      ),
                      TextView(
                        text: "₹ ${balance ?? "0.00"}",
                        fontSize: 24,
                        color: ColorPallete.theme,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
