import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/locker_controller.dart';

// ignore: must_be_immutable
class LockerDetailsScreen extends GetView<LockerController> {
  const LockerDetailsScreen({Key? key}) : super(key: key);

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
            child: CustomAppBar(pageName: "Locker Details"),
          ),
          backgroundColor: ColorPallete.theme,
          body: Column(
            children: [
              Expanded(
                child: Obx(
                  () => controller.lockers.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorPallete.primary,
                          ),
                        )
                      : MyListView(
                          scroll: true,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0 * fem),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 10.0 * fem),
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0 * fem),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      color: ColorPallete.grey.withOpacity(0.2),
                                    )
                                  ]),
                                  child: RoundedContainer(
                                    radius: 10,
                                    color: ColorPallete.theme,
                                    borderColor:
                                        ColorPallete.grey.withOpacity(0.2),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0 * fem),
                                      child: MyListView(
                                        children: [
                                          EntryWidget(
                                            title: "Branch",
                                            value: controller.selectedLocker
                                                .value.branchName,
                                          ),
                                          EntryWidget(
                                            title: "Name",
                                            value: controller.selectedLocker
                                                .value.memberName,
                                          ),
                                          EntryWidget(
                                            title: "Locker No.",
                                            value: controller
                                                .selectedLocker.value.lockerId,
                                          ),
                                          EntryWidget(
                                            title: "Safe No.",
                                            value: controller
                                                .selectedLocker.value.safeNo,
                                          ),
                                          EntryWidget(
                                            title: "Key No.",
                                            value: controller
                                                .selectedLocker.value.keyNo,
                                          ),
                                          EntryWidget(
                                            title: "Open Date",
                                            value: controller.formatDate(
                                                controller.selectedLocker.value
                                                    .dateFrom!,
                                                format: "yyyy-MM-dd"),
                                          ),
                                          EntryWidget(
                                            title: "Nominee",
                                            value: controller.selectedLocker
                                                .value.nomineeName,
                                          ),
                                          EntryWidget(
                                            title: "Rate",
                                            value:
                                                "₹ ${controller.selectedLocker.value.rent} /-",
                                          ),
                                          EntryWidget(
                                            title: "Mode Operation",
                                            value: controller.selectedLocker
                                                .value.modeOfOperation,
                                          ),
                                          EntryWidget(
                                            title: "Joint Member",
                                            value: controller.selectedLocker
                                                .value.joinMemberName,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5 * fem,
                            ),
                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: 10.0 * fem),
                            //   child: const TextView(
                            //     text: "Time In-Out History",
                            //     fontSize: 16,
                            //     color: ColorPallete.secondary,
                            //     weight: FontWeight.w700,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 5 * fem,
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.all(10 * fem),
                            //   child: RoundedContainer(
                            //     radius: 15,
                            //     borderColor: ColorPallete.primary,
                            //     child: Padding(
                            //       padding: EdgeInsets.symmetric(
                            //           horizontal: 5.0 * fem,
                            //           vertical: 10 * fem),
                            //       child: MyListView(
                            //         children: [
                            //           Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.center,
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.center,
                            //             children: [
                            //               "Date",
                            //               "Time In",
                            //               "Time Out",
                            //               "Remark"
                            //             ]
                            //                 .map(
                            //                   (e) => Expanded(
                            //                     flex: ["Remark"].contains(e)
                            //                         ? 2
                            //                         : 1,
                            //                     child: Padding(
                            //                       padding: EdgeInsets.symmetric(
                            //                           horizontal: 1.25 * fem),
                            //                       child: RoundedContainer(
                            //                         radius: 0,
                            //                         child: Padding(
                            //                           padding:
                            //                               EdgeInsets.symmetric(
                            //                                   vertical:
                            //                                       5.0 * fem),
                            //                           child: TextView(
                            //                             text: e,
                            //                             alignment:
                            //                                 TextAlign.center,
                            //                             weight: FontWeight.bold,
                            //                             color: ColorPallete
                            //                                 .secondary,
                            //                             fontSize: 14,
                            //                           ),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 )
                            //                 .toList(),
                            //           ),
                            //           SizedBox(
                            //             height: 5 * fem,
                            //           ),
                            //           RoundedContainer(
                            //             radius: 15,
                            //             child: MyListView(
                            //               children: controller
                            //                   .selectedLocker.value.lockerData!
                            //                   .map((e) => Padding(
                            //                         padding:
                            //                             EdgeInsets.symmetric(
                            //                                 vertical:
                            //                                     2.5 * fem),
                            //                         child: Row(
                            //                           children: [
                            //                             Expanded(
                            //                               child: TextView(
                            //                                 text: controller
                            //                                     .formatDate(
                            //                                         e.tRNDATE,
                            //                                         format:
                            //                                             "yyyy-MM-dd"),
                            //                                 alignment: TextAlign
                            //                                     .center,
                            //                               ),
                            //                             ),
                            //                             SizedBox(
                            //                               width: 2.5 * fem,
                            //                             ),
                            //                             Expanded(
                            //                               child: TextView(
                            //                                 text: controller
                            //                                     .formatTime(
                            //                                         e.tIMEIN,
                            //                                         format:
                            //                                             "yyyy-MM-dd hh:mm:ss"),
                            //                                 alignment: TextAlign
                            //                                     .center,
                            //                               ),
                            //                             ),
                            //                             SizedBox(
                            //                               width: 2.5 * fem,
                            //                             ),
                            //                             Expanded(
                            //                               child: TextView(
                            //                                 text: controller
                            //                                     .formatTime(
                            //                                         e.tIMEOUT,
                            //                                         format:
                            //                                             "yyyy-MM-dd hh:mm:ss"),
                            //                                 alignment: TextAlign
                            //                                     .center,
                            //                               ),
                            //                             ),
                            //                             SizedBox(
                            //                               width: 2.5 * fem,
                            //                             ),
                            //                             Expanded(
                            //                               flex: 2,
                            //                               child: TextView(
                            //                                 text: e.rEMARKS
                            //                                     .toString(),
                            //                                 alignment: TextAlign
                            //                                     .center,
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // )
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

class EntryWidget extends StatelessWidget {
  final String title;
  final String? value;
  const EntryWidget({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.5 * fem),
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
                weight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
