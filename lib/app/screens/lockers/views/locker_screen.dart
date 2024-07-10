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
                  () => controller.isLoading.value
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
                                          height: 120 * fem,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )
                      : controller.lockers.isEmpty
                          ? const Center(
                              child: TextView(
                                text: "No Accounts",
                                color: ColorPallete.grey,
                                weight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            )
                          : RefreshIndicator(
                              onRefresh: () {
                                controller.fetchLockers();
                                return Future.value();
                              },
                              child: MyListView(
                                scroll: true,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0 * fem),
                                    child: MyListView(
                                      children:
                                          controller.lockers.map((element) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0 * fem),
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
                                              borderColor: ColorPallete.grey
                                                  .withOpacity(0.2),
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.all(10.0 * fem),
                                                child: MyListView(
                                                  children: [
                                                    EntryWidget(
                                                      title: "Branch",
                                                      value: element.branchName,
                                                    ),
                                                    EntryWidget(
                                                      title: "Locker No.",
                                                      value: element.lockerId,
                                                    ),
                                                    EntryWidget(
                                                      title: "Name",
                                                      value: element.memberName,
                                                    ),
                                                    SizedBox(
                                                      height: 10 * fem,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .showLockerDetails(
                                                                    element);
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
                                                                          7.5 *
                                                                              fem),
                                                              child:
                                                                  const TextView(
                                                                text:
                                                                    "View More",
                                                                fontSize: 14,
                                                                weight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    ColorPallete
                                                                        .theme,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EntryWidget extends StatelessWidget {
  final String title;
  final String? value;
  const EntryWidget({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.5 * fem),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: TextView(
            text: title,
            fontSize: 14,
            color: ColorPallete.secondary,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0 * fem),
            child: const TextView(text: ":"),
          ),
          Expanded(
              flex: 2,
              child: TextView(
                text: value?.capitalize ?? "N/A",
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ))
        ],
      ),
    );
  }
}
