import 'package:marquee/marquee.dart';

import '../../../../common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/ui/custom_drawer.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../../../models/ads_model.dart';
import '../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';
import '../widgets/acc_card .dart';

// ignore: must_be_immutable
class MainScreen extends GetView<HomeController> {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          key: controller.scaffoldKey,
          extendBody: true,
          backgroundColor: ColorPallete.theme,
          appBar: AppBar(
            backgroundColor: ColorPallete.theme,
            leading: InkWell(
              onTap: () {
                controller.scaffoldKey.currentState!.openDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: ColorPallete.primary,
              ),
            ),
            title: const TextView(
              text: "Home",
              color: ColorPallete.secondary,
              fontSize: 18,
              weight: FontWeight.bold,
            ),
            actions: [
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
              //   child: Image.asset(
              //     "assets/ui/search.png",
              //     height: 25 * fem,
              //     width: 25 * fem,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0 * fem),
                child: Image.asset(
                  "assets/ui/notification.png",
                  height: 25 * fem,
                  width: 25 * fem,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0 * fem, vertical: 7.5 * fem),
                child: Image.asset("assets/ui/logo.png"),
              )
            ],
          ),
          body: RoundedContainer(
            radius: 0,
            // height: MediaQuery.of(context).size.height,
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: ColorPallete.primary,
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () {
                              controller.homeRefresh();
                              return Future.value();
                            },
                            child: MyListView(
                              scroll: true,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0 * fem),
                                  child: MyListView(
                                    children: [
                                      SizedBox(
                                        height: 25 * fem,
                                      ),
                                      //Header
                                      RoundedContainer(
                                        radius: 0,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: MyListView(
                                                children: [
                                                  TextView(
                                                    text:
                                                        "Welcome, ${controller.user.value.accountName?.split(" ")[1].capitalize!} !",
                                                    color:
                                                        ColorPallete.secondary,
                                                    fontSize: 18,
                                                    weight: FontWeight.bold,
                                                  ),
                                                  SizedBox(
                                                    height: 5 * fem,
                                                  ),
                                                  const TextView(
                                                    text: "Good Morning.",
                                                    color:
                                                        ColorPallete.secondary,
                                                    fontSize: 14,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Image.asset(
                                              "assets/ui/logo.png",
                                              height: 50 * fem,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20 * fem,
                                      ),
                                      AccCard(
                                          memberNo:
                                              controller.user.value.membregNo,
                                          branchId: controller
                                              .user.value.branchName
                                              .toString()
                                              .trim()
                                              .capitalize!,
                                          accountId:
                                              controller.user.value.sbaccountId,
                                          balance:
                                              controller.user.value.balance),
                                      SizedBox(
                                        height: 15 * fem,
                                      ),
                                      Divider(
                                        height: 5 * fem,
                                        thickness: 5 * fem,
                                        color:
                                            ColorPallete.grey.withOpacity(0.2),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5 * fem),
                                        child: RoundedContainer(
                                          radius: 0,
                                          height: 30,
                                          child: Center(
                                            child: Marquee(
                                              text: controller.notice.value,
                                              style: TextStyle(
                                                  fontSize: 15 * ffem,
                                                  fontWeight: FontWeight.bold),
                                              scrollAxis: Axis.horizontal,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              blankSpace: 20.0 * fem,
                                              // velocity: 50.0,
                                              // pauseAfterRound:
                                              //     const Duration(seconds: 0),
                                              // startPadding: 10.0 * fem,
                                              // accelerationDuration:
                                              //     const Duration(seconds: 1),
                                              // accelerationCurve: Curves.linear,
                                              // decelerationDuration:
                                              //     const Duration(
                                              //         milliseconds: 500),
                                              // decelerationCurve: Curves.easeOut,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 5 * fem,
                                        thickness: 5 * fem,
                                        color:
                                            ColorPallete.grey.withOpacity(0.2),
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      if (controller.ads.isNotEmpty)
                                        RoundedContainer(
                                          radius: 0,
                                          height: 150,
                                          child: PageView.builder(
                                            controller:
                                                controller.pageController,
                                            onPageChanged: (value) {
                                              controller
                                                  .selectedAd.value = (value %
                                                      controller.ads.length) +
                                                  1;
                                              controller.selectedAd.refresh();
                                              Future.delayed(
                                                  const Duration(seconds: 4),
                                                  () {
                                                controller.pageController
                                                    .nextPage(
                                                        duration:
                                                            const Duration(
                                                                seconds: 1),
                                                        curve: Curves.linear);
                                              });
                                            },
                                            itemBuilder: (context, index) {
                                              var adNo =
                                                  index % controller.ads.length;
                                              Ads e = controller.ads
                                                  .elementAt(adNo);
                                              return InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      Routes.ADVERTISEMENT,
                                                      arguments: e);
                                                },
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.all(5.0 * fem),
                                                  child: RoundedContainer(
                                                    radius: 10,
                                                    clip: Clip
                                                        .antiAliasWithSaveLayer,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                                spreadRadius:
                                                                    0.5 * fem,
                                                                blurRadius:
                                                                    5 * fem,
                                                                offset: Offset(
                                                                    0, 0 * fem),
                                                                color: ColorPallete
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.1))
                                                          ]),
                                                      child: Image.network(
                                                        e.image!,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      SizedBox(
                                        height: 5 * fem,
                                      ),
                                      if (controller.ads.isNotEmpty)
                                        RoundedContainer(
                                          radius: 0,
                                          height: 7.5,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children:
                                                controller.ads.map((element) {
                                              bool isSelected = element.id ==
                                                  controller.selectedAd.value;
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.5 * fem),
                                                child: RoundedContainer(
                                                  color: isSelected
                                                      ? ColorPallete.primary
                                                      : ColorPallete.grey
                                                          .withOpacity(0.5),
                                                  radius: 5,
                                                  height: 10,
                                                  width: isSelected ? 20 : 10,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      SizedBox(
                                        height: 15 * fem,
                                      ),
                                      Divider(
                                        height: 5 * fem,
                                        thickness: 5 * fem,
                                        color:
                                            ColorPallete.grey.withOpacity(0.2),
                                      ),
                                      SizedBox(
                                        height: 15 * fem,
                                      ),
                                      // Services
                                      const Row(
                                        children: [
                                          TextView(
                                            text: "Quick Banking",
                                            color: ColorPallete.secondary,
                                            fontSize: 18,
                                            weight: FontWeight.bold,
                                          ),
                                          Spacer(),
                                          // TextView(
                                          //   text: "Explore",
                                          //   color: ColorPallete.primary,
                                          //   fontSize: 14,
                                          //   weight: FontWeight.bold,
                                          // ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20 * fem,
                                      ),
                                      GridView.count(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10 * fem,
                                        crossAxisSpacing: 10 * fem,
                                        childAspectRatio: 1,
                                        children:
                                            controller.services.map((element) {
                                          // bool isSelected = element["title"] ==
                                          //     controller.selectedService.value;
                                          return InkWell(
                                            onTap: () {
                                              // controller.isGridView.value =
                                              //     false;
                                              controller.selectedService.value =
                                                  element["title"];
                                              controller.goToService();
                                            },
                                            child: RoundedContainer(
                                              radius: 15,
                                              color: ColorPallete.primary
                                                  .withOpacity(0.1),
                                              child: Center(
                                                child: MyListView(
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        element["image"],
                                                        height: 35 * fem,
                                                        width: 35 * fem,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10 * fem,
                                                    ),
                                                    Center(
                                                      child: TextView(
                                                        text: element["title"],
                                                        color: ColorPallete
                                                            .secondary,
                                                        weight: FontWeight.w600,
                                                        // fontSize: 10,
                                                        alignment:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                    ],
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
          drawer: CustomDrawer(),
        ),
      ),
    );
  }
}
