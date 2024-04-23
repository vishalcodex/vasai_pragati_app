import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/statement_controller.dart';

class StatementScreen extends GetView<StatementController> {
  const StatementScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50 * fem),
        child: CustomAppBar(pageName: "Download Statement"),
      ),
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Container(
          color: ColorPallete.grey.withOpacity(0.1),
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: MyListView(
                    scroll: true,
                    children: [
                      RoundedContainer(
                        radius: 0,
                        color: ColorPallete.theme,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 5 * fem,
                              ),
                              RoundedContainer(
                                radius: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0 * fem),
                                  child: const TextView(
                                    text: "Statement Of Last",
                                    color: ColorPallete.secondary,
                                    weight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Row(
                                  children: controller.customOptions.map((e) {
                                    bool isSelected =
                                        e == controller.selectedOption.value;
                                    return Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.0 * fem),
                                        child: InkWell(
                                          onTap: () {
                                            controller
                                                .onStatementOptionChanged(e);
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            borderColor: isSelected
                                                ? null
                                                : ColorPallete.primary,
                                            color: isSelected
                                                ? ColorPallete.primary
                                                : ColorPallete.theme
                                                    .withOpacity(0.5),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10 * fem),
                                              child: TextView(
                                                text: e,
                                                color: isSelected
                                                    ? ColorPallete.theme
                                                    : ColorPallete.primary,
                                                weight: FontWeight.bold,
                                                alignment: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5 * fem,
                      ),
                      RoundedContainer(
                        radius: 0,
                        color: ColorPallete.theme,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                          child: MyListView(
                            children: [
                              SizedBox(
                                height: 5 * fem,
                              ),
                              RoundedContainer(
                                radius: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0 * fem),
                                  child: const TextView(
                                    text: "Select Dates",
                                    color: ColorPallete.secondary,
                                    weight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Obx(
                                () => RoundedContainer(
                                  radius: 0,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            var date = await showDatePicker(
                                                context: context,
                                                initialDate: controller
                                                            .fromDate.value !=
                                                        ""
                                                    ? DateFormat("dd/MM/yyyy")
                                                        .parse(controller
                                                            .fromDate.value)
                                                    : DateTime.now(),
                                                firstDate: DateTime.now()
                                                    .subtract(const Duration(
                                                        days: 365 * 30)),
                                                lastDate: DateTime.now());

                                            controller.fromDate.value =
                                                date == null
                                                    ? ""
                                                    : DateFormat("dd/MM/yyyy")
                                                        .format(date);
                                            controller.hasStatement.value =
                                                false;
                                            controller.toDate.refresh();
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            color: ColorPallete.grey
                                                .withOpacity(0.1),
                                            // borderColor: ColorPallete.grey,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0 * fem,
                                                  vertical: 15 * fem),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  10 * fem),
                                                      child: TextView(
                                                        text: controller
                                                                    .fromDate
                                                                    .value !=
                                                                ""
                                                            ? controller
                                                                .fromDate.value
                                                            : "From Date",
                                                        color:
                                                            ColorPallete.grey,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                5.0 * fem),
                                                    child: Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      color:
                                                          ColorPallete.primary,
                                                      size: 20 * fem,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10 * fem,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () async {
                                            var date = await showDatePicker(
                                                context: context,
                                                initialDate: controller
                                                            .toDate.value !=
                                                        ""
                                                    ? DateFormat("dd/MM/yyyy")
                                                        .parse(controller
                                                            .toDate.value)
                                                    : DateTime.now(),
                                                firstDate: DateTime.now()
                                                    .subtract(Duration(
                                                        days: 365 * 30)),
                                                lastDate: DateTime.now());
                                            controller.toDate.value =
                                                date == null
                                                    ? ""
                                                    : DateFormat("dd/MM/yyyy")
                                                        .format(date);
                                            controller.hasStatement.value =
                                                false;
                                            controller.toDate.refresh();
                                          },
                                          child: RoundedContainer(
                                            radius: 10,
                                            color: ColorPallete.grey
                                                .withOpacity(0.1),
                                            // borderColor: ColorPallete.grey,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0 * fem,
                                                  vertical: 15 * fem),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  10 * fem),
                                                      child: TextView(
                                                        text: controller.toDate
                                                                    .value !=
                                                                ""
                                                            ? controller
                                                                .toDate.value
                                                            : "To Date",
                                                        color:
                                                            ColorPallete.grey,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                5.0 * fem),
                                                    child: Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      color:
                                                          ColorPallete.primary,
                                                      size: 20 * fem,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      AnimatedSize(
                          duration: const Duration(seconds: 1),
                          child: Container(
                            child: RoundedContainer(
                              radius: 0,
                              color: ColorPallete.theme,
                              child: MyListView(
                                children: controller.transactions.map((e) {
                                  return double.parse(e.amount ?? "0") == 0
                                      ? const SizedBox.shrink()
                                      : Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0 * fem),
                                          child: MyListView(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.all(10.0 * fem),
                                                child: RoundedContainer(
                                                  radius: 0,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: MyListView(
                                                          children: [
                                                            TextView(
                                                              text: DateFormat(
                                                                      "dd MMM yyyy")
                                                                  .format(DateFormat(
                                                                          "yyyy-MM-dd")
                                                                      .parse(e
                                                                          .trnDate!)),
                                                              color:
                                                                  ColorPallete
                                                                      .primary,
                                                              fontSize: 16,
                                                              weight: FontWeight
                                                                  .w600,
                                                            ),
                                                            SizedBox(
                                                              height: 5 * fem,
                                                            ),
                                                            TextView(
                                                              text: (((e.nARRATION ??
                                                                              "") ==
                                                                          "")
                                                                      ? e.shNarration
                                                                      : e.nARRATION)
                                                                  .toString(),
                                                              color:
                                                                  ColorPallete
                                                                      .grey,
                                                              weight: FontWeight
                                                                  .w600,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            TextView(
                                                                alignment:
                                                                    TextAlign
                                                                        .right,
                                                                fontSize: 18,
                                                                color: ColorPallete
                                                                    .secondary,
                                                                text:
                                                                    e.amount!),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom: 1.0 *
                                                                          fem),
                                                              child: TextView(
                                                                text: e.crdb ==
                                                                        "C"
                                                                    ? " Cr"
                                                                    : " Dr",
                                                                alignment:
                                                                    TextAlign
                                                                        .right,
                                                                color: e.crdb ==
                                                                        "C"
                                                                    ? Colors
                                                                        .green
                                                                    : ColorPallete
                                                                        .red,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.0 * fem),
                                                child: Divider(
                                                  thickness: 1 * fem,
                                                  height: 1 * fem,
                                                  color: ColorPallete.grey
                                                      .withOpacity(0.2),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                }).toList(),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: ColorPallete.grey.withOpacity(0.25),
                      blurRadius: 10 * fem,
                      spreadRadius: 1 * fem,
                    )
                  ]),
                  child: Obx(() {
                    bool isEnabled = controller.toDate.value != "" &&
                        controller.fromDate.value != "";
                    return RoundedContainer(
                      radius: 0,
                      color: ColorPallete.theme,
                      child: Padding(
                        padding: EdgeInsets.all(10.0 * fem),
                        child: InkWell(
                          onTap: () {
                            if (isEnabled) {
                              controller.hasStatement.value
                                  ? controller.isLoading.value
                                      ? () {}
                                      : controller.downloadStatement()
                                  : controller.fetchStatement();
                            }
                          },
                          child: RoundedContainer(
                            radius: 10,
                            height: 45,
                            color: isEnabled
                                ? ColorPallete.primary
                                : ColorPallete.primary.withOpacity(0.15),
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 10.0 * fem),
                              child: Center(
                                child: controller.isLoading.value
                                    ? SizedBox(
                                        height: 45 * fem,
                                        width: 30 * fem,
                                        child: const CircularProgressIndicator(
                                          color: ColorPallete.theme,
                                        ),
                                      )
                                    : TextView(
                                        text: controller.hasStatement.value
                                            ? "Download"
                                            : "Fetch",
                                        color: ColorPallete.theme,
                                        fontSize: 18,
                                        weight: FontWeight.w600,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
