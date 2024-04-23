import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/locker_controller.dart';

// ignore: must_be_immutable
class LockerScreen extends GetView<LockerController> {
  const LockerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(0, 50 * fem),
            child: CustomAppBar(pageName: "Lockers"),
          ),
          backgroundColor: ColorPallete.theme,
          body: Column(
            children: [
              Expanded(
                child: Obx(
                  () => controller.lockers.isEmpty
                      ? MyListView(
                          children: [
                            1,
                            2,
                            3,
                          ]
                              .map((e) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0 * fem,
                                        vertical: 10 * fem),
                                    child: RoundedContainer(
                                      radius: 0,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.withOpacity(0.2),
                                        highlightColor: Colors.white,
                                        child: RoundedContainer(
                                          radius: 10,
                                          color: ColorPallete.grey,
                                          height: 60 * fem,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )
                      : MyListView(
                          scroll: true,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0 * fem),
                              child: MyListView(
                                children: controller.lockers.map((element) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0 * fem),
                                    child: InkWell(
                                      onTap: () {
                                        controller.showLockerDetails(element);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(boxShadow: [
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
                                          borderColor: ColorPallete.grey
                                              .withOpacity(0.2),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0 * fem),
                                            child: MyListView(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Expanded(
                                                        child: TextView(
                                                      text: "Locker No.",
                                                      fontSize: 14,
                                                      color: ColorPallete
                                                          .secondary,
                                                    )),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  10.0 * fem),
                                                      child: const TextView(
                                                          text: ":"),
                                                    ),
                                                    Expanded(
                                                        flex: 2,
                                                        child: TextView(
                                                          text:
                                                              element.lOCKERNO!,
                                                          fontSize: 14,
                                                        ))
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5 * fem,
                                                ),
                                                Row(
                                                  children: [
                                                    const Expanded(
                                                        child: TextView(
                                                      text: "Branch",
                                                      fontSize: 14,
                                                      color: ColorPallete
                                                          .secondary,
                                                    )),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  10.0 * fem),
                                                      child: const TextView(
                                                          text: ":"),
                                                    ),
                                                    Expanded(
                                                        flex: 2,
                                                        child: TextView(
                                                          text: element.branch!
                                                              .branchName!,
                                                          fontSize: 14,
                                                        ))
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5 * fem,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )
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
