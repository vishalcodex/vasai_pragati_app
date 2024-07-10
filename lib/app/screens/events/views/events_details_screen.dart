import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/events_controller.dart';

// ignore: must_be_immutable
class EventsDetails extends GetView<EventsController> {
  const EventsDetails({Key? key}) : super(key: key);

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
            child: CustomAppBar(pageName: "Events Details"),
          ),
          backgroundColor: ColorPallete.theme,
          body: Column(
            children: [
              Expanded(
                child: MyListView(
                  scroll: true,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0 * fem),
                      child: MyListView(
                        children: [
                          SizedBox(
                            height: 15 * fem,
                          ),
                          RoundedContainer(
                              radius: 0,
                              height: 175,
                              clip: Clip.antiAliasWithSaveLayer,
                              // borderColor: ColorPallete.primary,
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 5.0 * fem),
                                child: RoundedContainer(
                                  radius: 10,
                                  clip: Clip.antiAliasWithSaveLayer,
                                  borderColor: ColorPallete.primary,
                                  child: RoundedContainer(
                                    radius: 10,
                                    clip: Clip.antiAliasWithSaveLayer,
                                    child: Image.network(
                                      controller.selectedValue.value.img!,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Padding(
                                          padding: EdgeInsets.all(10.0 * fem),
                                          child: Image.asset(
                                            "assets/ui/logo.png",
                                            fit: BoxFit.fill,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              )

                              // Stack(
                              //   alignment: Alignment.center,
                              //   children: [
                              //     PageView(
                              //       onPageChanged: (value) {
                              //         // controller.selectedValue.value =
                              //         //     controller.events.elementAt(value);
                              //       },
                              //       children: controller.events.map((e) {
                              //         return Padding(
                              //           padding: EdgeInsets.symmetric(
                              //               horizontal: 5.0 * fem),
                              //           child: const RoundedContainer(
                              //             radius: 0,
                              //             borderColor: ColorPallete.primary,
                              //             child: Placeholder(),
                              //           ),
                              //         );
                              //       }).toList(),
                              //     ),
                              //     Positioned(
                              //       bottom: 10 * fem,
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         children:
                              //             controller.events.map((element) {
                              //           bool isSelected = element.id ==
                              //               controller.selectedValue.value.id;
                              //           return Padding(
                              //             padding: EdgeInsets.symmetric(
                              //                 horizontal: 2.5 * fem),
                              //             child: RoundedContainer(
                              //               color: isSelected
                              //                   ? ColorPallete.primary
                              //                   : ColorPallete.grey
                              //                       .withOpacity(0.5),
                              //               radius: 5,
                              //               height: 10,
                              //               width: isSelected ? 20 : 10,
                              //             ),
                              //           );
                              //         }).toList(),
                              //       ),
                              //     ),

                              //   ],
                              // ),
                              ),
                          SizedBox(
                            height: 20 * fem,
                          ),
                          RoundedContainer(
                            radius: 15,
                            child: MyListView(
                              children: [
                                TextView(
                                  text: controller.selectedValue.value.title!,
                                  fontSize: 16,
                                  color: ColorPallete.primary,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 10 * fem,
                                ),
                                TextView(
                                  text: DateFormat("dd MMM yyyy").format(
                                      DateFormat("yyyy-MM-dd").parse(controller
                                          .selectedValue.value.createdDate!)),
                                  fontSize: 14,
                                  color: ColorPallete.secondary,
                                  weight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 10 * fem,
                                ),
                                Html(
                                  data: controller
                                      .selectedValue.value.description!,
                                  style: {
                                    "body": Style(color: ColorPallete.secondary)
                                  },
                                ),
                                // TextView(
                                //   text: controller
                                //       .selectedValue.value.description!,
                                //   fontSize: 14,
                                //   color: ColorPallete.secondary,
                                //   weight: FontWeight.w500,
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
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
