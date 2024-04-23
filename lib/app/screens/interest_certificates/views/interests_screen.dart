import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/interests_controller.dart';

// ignore: must_be_immutable
class InterestsScreen extends GetView<InterestsController> {
  const InterestsScreen({Key? key}) : super(key: key);

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
            child: CustomAppBar(pageName: "Interest Certificates"),
          ),
          backgroundColor: ColorPallete.theme,
          body: Container(
            color: ColorPallete.grey.withOpacity(0.5),
            child: Column(
              children: [
                RoundedContainer(
                  radius: 0,
                  color: ColorPallete.theme,
                  child: MyListView(
                    children: [
                      SizedBox(
                        height: 10 * fem,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10 * fem),
                        child: const TextView(
                          text: "Select a Financial Year :",
                          color: ColorPallete.primary,
                          fontSize: 16,
                          weight: FontWeight.bold,
                        ),
                      ),
                      Obx(
                        () => RoundedContainer(
                          radius: 0,
                          height: 50,
                          color: ColorPallete.theme,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5 * fem, horizontal: 10 * fem),
                            child: MyListView(
                                isRow: true,
                                scroll: true,
                                children: controller.last10Years.map((element) {
                                  bool isSelected =
                                      element == controller.selectedYear.value;
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5 * fem,
                                        horizontal: 2.5 * fem),
                                    child: InkWell(
                                      onTap: () {
                                        controller.onYearChanged(element);
                                      },
                                      child: RoundedContainer(
                                        radius: 10,
                                        color: isSelected
                                            ? ColorPallete.primary
                                            : ColorPallete.theme,
                                        borderColor: isSelected
                                            ? null
                                            : ColorPallete.primary,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0 * fem,
                                              horizontal: 10 * fem),
                                          child: Center(
                                            child: TextView(
                                              text: element,
                                              color: isSelected
                                                  ? ColorPallete.theme
                                                  : ColorPallete.primary,
                                              weight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5 * fem,
                ),
                Expanded(
                  child: Obx(
                    () => controller.isSearching.value
                        ? RoundedContainer(
                            radius: 0,
                            color: ColorPallete.theme,
                            child: MyListView(
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
                                            baseColor:
                                                Colors.grey.withOpacity(0.2),
                                            highlightColor: Colors.white,
                                            child: RoundedContainer(
                                              radius: 10,
                                              color: ColorPallete.grey,
                                              height: 150 * fem,
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )
                        : controller.showingCertificates.isNotEmpty
                            ? Stack(
                                children: [
                                  RoundedContainer(
                                    radius: 0,
                                    color: ColorPallete.theme,
                                    child: MyListView(
                                      scroll: true,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0 * fem),
                                          child: MyListView(
                                            children: controller
                                                .showingCertificates
                                                .map((element) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.0 * fem),
                                                child: Container(
                                                  decoration:
                                                      BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                      offset:
                                                          Offset(0, 5 * fem),
                                                      blurRadius: 10,
                                                      spreadRadius: 2,
                                                      color: ColorPallete.grey
                                                          .withOpacity(0.2),
                                                    )
                                                  ]),
                                                  child: RoundedContainer(
                                                    radius: 10,
                                                    color: ColorPallete.theme,
                                                    borderColor: ColorPallete
                                                        .grey
                                                        .withOpacity(0.2),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          10.0 * fem),
                                                      child: MyListView(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              const Expanded(
                                                                child: TextView(
                                                                  text:
                                                                      "Account ID",
                                                                  fontSize: 14,
                                                                  color: ColorPallete
                                                                      .secondary,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10.0 *
                                                                                fem),
                                                                child:
                                                                    const TextView(
                                                                        text:
                                                                            ":"),
                                                              ),
                                                              Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      TextView(
                                                                    text: element
                                                                        .accountId!,
                                                                    fontSize:
                                                                        14,
                                                                  ))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5 * fem,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Expanded(
                                                                  child:
                                                                      TextView(
                                                                text:
                                                                    "Account Name",
                                                                fontSize: 14,
                                                                color: ColorPallete
                                                                    .secondary,
                                                              )),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10.0 *
                                                                                fem),
                                                                child:
                                                                    const TextView(
                                                                        text:
                                                                            ":"),
                                                              ),
                                                              Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        "Vishal M Shinde",
                                                                    fontSize:
                                                                        14,
                                                                  ))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5 * fem,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Expanded(
                                                                  child:
                                                                      TextView(
                                                                text:
                                                                    "FD Amount",
                                                                fontSize: 14,
                                                                color: ColorPallete
                                                                    .secondary,
                                                              )),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10.0 *
                                                                                fem),
                                                                child:
                                                                    const TextView(
                                                                        text:
                                                                            ":"),
                                                              ),
                                                              Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      TextView(
                                                                    text: element
                                                                        .amount!,
                                                                    fontSize:
                                                                        14,
                                                                  ))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5 * fem,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Expanded(
                                                                  child:
                                                                      TextView(
                                                                text:
                                                                    "Provisional Amount",
                                                                fontSize: 14,
                                                                color: ColorPallete
                                                                    .secondary,
                                                              )),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10.0 *
                                                                                fem),
                                                                child:
                                                                    const TextView(
                                                                        text:
                                                                            ":"),
                                                              ),
                                                              Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      TextView(
                                                                    text: element
                                                                        .provision!,
                                                                    fontSize:
                                                                        14,
                                                                  ))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5 * fem,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Expanded(
                                                                  child:
                                                                      TextView(
                                                                text:
                                                                    "Interest",
                                                                fontSize: 14,
                                                                color: ColorPallete
                                                                    .secondary,
                                                              )),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10.0 *
                                                                                fem),
                                                                child:
                                                                    const TextView(
                                                                        text:
                                                                            ":"),
                                                              ),
                                                              Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      TextView(
                                                                    text: element
                                                                        .interest!,
                                                                    fontSize:
                                                                        14,
                                                                  ))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 15 * fem,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .downloadCertificate(
                                                                          element);
                                                                },
                                                                child:
                                                                    RoundedContainer(
                                                                  radius: 10,
                                                                  color: ColorPallete
                                                                      .primary,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            15.0 *
                                                                                fem,
                                                                        vertical:
                                                                            7.5 *
                                                                                fem),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        const TextView(
                                                                          text:
                                                                              "Download",
                                                                          color:
                                                                              ColorPallete.theme,
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5 * fem,
                                                                        ),
                                                                        const Icon(
                                                                          Icons
                                                                              .file_download_outlined,
                                                                          color:
                                                                              ColorPallete.theme,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
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
                                  if (controller.isLoading.value)
                                    RoundedContainer(
                                      radius: 0,
                                      color: ColorPallete.grey.withOpacity(0.3),
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: ColorPallete.primary,
                                        ),
                                      ),
                                    )
                                ],
                              )
                            : RoundedContainer(
                                radius: 0,
                                child: Center(
                                  child: TextView(
                                    text: "No Certificates Available!",
                                    fontSize: 16,
                                    weight: FontWeight.bold,
                                  ),
                                ),
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
