import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/events_controller.dart';

// ignore: must_be_immutable
class EventsScreen extends GetView<EventsController> {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(0, 50 * fem),
            child: CustomAppBar(pageName: "Events"),
          ),
          backgroundColor: ColorPallete.theme,
          body: Column(
            children: [
              Expanded(
                child: MyListView(
                  scroll: true,
                  children: [
                    SizedBox(
                      height: 15 * fem,
                    ),
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                        child: controller.isLoading.value
                            ? MyListView(
                                children: [
                                  1,
                                  2,
                                  3,
                                ]
                                    .map((e) => Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0 * fem),
                                          child: RoundedContainer(
                                            radius: 0,
                                            child: Shimmer.fromColors(
                                              baseColor:
                                                  Colors.grey.withOpacity(0.2),
                                              highlightColor: Colors.white,
                                              child: RoundedContainer(
                                                radius: 10,
                                                color: ColorPallete.grey,
                                                height: 110 * fem,
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              )
                            : controller.events.isEmpty
                                ? const Center(
                                    child: TextView(
                                      text: "No Events",
                                      color: ColorPallete.grey,
                                      weight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  )
                                : MyListView(
                                    children: controller.events.map((e) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0 * fem),
                                        child: InkWell(
                                          onTap: () {
                                            controller.onEventClicked(e);
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            clip: Clip.antiAliasWithSaveLayer,
                                            borderColor: ColorPallete.primary,
                                            color: ColorPallete.theme,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.all(10.0 * fem),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: RoundedContainer(
                                                      radius: 10,
                                                      height: 100,
                                                      clip: Clip
                                                          .antiAliasWithSaveLayer,
                                                      child: Image.network(
                                                        e.img!,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        TextView(
                                                          text: e.title!,
                                                          fontSize: 14,
                                                          color: ColorPallete
                                                              .primary,
                                                          weight:
                                                              FontWeight.bold,
                                                        ),
                                                        SizedBox(
                                                          height: 10 * fem,
                                                        ),
                                                        TextView(
                                                          text: DateFormat(
                                                                  "dd MMM yyyy")
                                                              .format(DateFormat(
                                                                      "yyyy-MM-dd")
                                                                  .parse(e
                                                                      .createdDate!)),
                                                          fontSize: 12,
                                                          color: ColorPallete
                                                              .secondary,
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
                                    }).toList(),
                                  ),
                      ),
                    ),
                    SizedBox(
                      height: 15 * fem,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
