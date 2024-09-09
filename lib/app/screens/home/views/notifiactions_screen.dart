import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vasai_pragati/app/components/ui/rounded_container.dart';
import 'package:vasai_pragati/app/components/ui/text_view.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../controllers/home_controller.dart';

class NotifiactionScreen extends GetView<HomeController> {
  const NotifiactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50 * fem),
        child: CustomAppBar(pageName: "Notifications"),
      ),
      backgroundColor: ColorPallete.theme,
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                controller.fetchNotifications();
                return Future.value();
              },
              child: MyListView(
                scroll: true,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0 * fem),
                    child: Obx(
                      () => controller.isLoading.value
                          ? MyListView(
                              children: [1, 2, 3].map(
                                (element) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: MyListView(
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor:
                                              Colors.grey.withOpacity(0.2),
                                          highlightColor: Colors.white,
                                          child: const Row(
                                            children: [
                                              RoundedContainer(
                                                radius: 5,
                                                height: 12,
                                                width: 100,
                                                color: ColorPallete.grey,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        RoundedContainer(
                                          radius: 10,
                                          clip: Clip.antiAliasWithSaveLayer,
                                          child: Shimmer.fromColors(
                                            baseColor:
                                                Colors.grey.withOpacity(0.2),
                                            highlightColor: Colors.white,
                                            child: RoundedContainer(
                                              radius: 15,
                                              color: ColorPallete.grey,
                                              height: 40 * fem,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
                            )
                          : controller.notifications.isEmpty
                              ? const SizedBox(
                                  height: 150,
                                  child: Center(
                                    child: TextView(
                                      text: "No Notifications",
                                      color: ColorPallete.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              : MyListView(
                                  children:
                                      controller.notifications.map((element) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: MyListView(
                                        children: [
                                          TextView(
                                            text: DateFormat("dd MMM yyyy")
                                                .format(DateFormat("yyyy-MM-dd")
                                                    .parse(element.trnDate
                                                        .toString())),
                                            fontSize: 12,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                spreadRadius: 5,
                                                blurRadius: 15,
                                                color: ColorPallete.grey
                                                    .withOpacity(0.25),
                                              ),
                                            ]),
                                            child: RoundedContainer(
                                              radius: 10,
                                              color: ColorPallete.theme,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: TextView(
                                                  text: element.notification
                                                      .toString(),
                                                  fontSize: 14,
                                                  weight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
