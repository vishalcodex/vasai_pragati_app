import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vasai_pragati/app/components/ui/form_fields.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

class FixedDepositCalculator extends GetView<HomeController> {
  const FixedDepositCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50 * fem),
        child: CustomAppBar(pageName: "Fixed Deposit Calculator"),
      ),
      backgroundColor: ColorPallete.theme,
      body: Column(
        children: [
          Expanded(
            child: MyListView(
              scroll: true,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0 * fem),
                  child: MyListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              spreadRadius: 5,
                              blurRadius: 10,
                              color: ColorPallete.grey.withOpacity(0.5))
                        ]),
                        child: RoundedContainer(
                          radius: 10,
                          color: ColorPallete.theme,
                          child: Padding(
                            padding: EdgeInsets.all(15.0 * fem),
                            child: MyListView(
                              children: [
                                const TextView(
                                  text: "Types of Customer",
                                  fontSize: 14,
                                  color: ColorPallete.secondary,
                                ),
                                SizedBox(
                                  height: 5 * fem,
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Row(
                                      children:
                                          ["Normal", "Senior Citizen"].map(
                                        (e) {
                                          bool selected = e ==
                                              controller.customerType.value;
                                          return Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                controller.customerType.value =
                                                    e;
                                                controller.fdInterest.value
                                                    .interest = null;
                                                controller.customerType
                                                    .refresh();
                                                controller.fdInterest.refresh();
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    selected
                                                        ? Icons
                                                            .radio_button_checked
                                                        : Icons
                                                            .radio_button_off,
                                                    color: selected
                                                        ? ColorPallete.primary
                                                        : ColorPallete.grey,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  TextView(
                                                    text: "$e",
                                                    color: selected
                                                        ? ColorPallete.primary
                                                        : ColorPallete
                                                            .secondary,
                                                    weight: selected
                                                        ? FontWeight.w600
                                                        : FontWeight.w400,
                                                    fontSize: 14,
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20 * fem,
                                ),
                                //TYPE OF FD
                                // const TextView(
                                //   text: "Types of Fixed Deposit",
                                //   fontSize: 14,
                                //   color: ColorPallete.secondary,
                                // ),
                                // SizedBox(
                                //   height: 10 * fem,
                                // ),
                                // RoundedContainer(
                                //   radius: 10,
                                //   borderColor: ColorPallete.grey,
                                //   child: MyFormField(
                                //     fieldName: "",
                                //     type: InputType.DROP_DOWN,
                                //     dropDownOptions: const [
                                //       "Reinvestment (Cumulative)",
                                //       "Reinvestment (Non - Cumulative)",
                                //     ],
                                //     keyboard: TextInputType.text,
                                //     onChanged: (value) {},
                                //   ),
                                // ),

                                // SizedBox(
                                //   height: 20 * fem,
                                // ),
                                //DATE
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TextView(
                                      text: "Date Of Fixed Deposit",
                                      color: ColorPallete.secondary,
                                      fontSize: 14,
                                    ),
                                    TextView(
                                      text: DateFormat("dd MMM yyyy")
                                          .format(DateTime.now()),
                                      color: ColorPallete.primary,
                                      fontSize: 14,
                                      weight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20 * fem,
                                ),
                                // AMOUNT DEPOSIT
                                Row(
                                  children: [
                                    const Expanded(
                                      child: TextView(
                                        text: "Amount Deposit (₹)",
                                        color: ColorPallete.secondary,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: RoundedContainer(
                                        radius: 10,
                                        borderColor: ColorPallete.grey,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0 * fem),
                                          child: MyTextField(
                                            initialValue: controller
                                                .fdAmount.value
                                                .toString(),
                                            hintText: "Your FD Amount",
                                            keyboardType: TextInputType.number,
                                            fontSize: 14,
                                            onChanged: (value) {
                                              controller.fdAmount.value =
                                                  double.parse(value);
                                              controller.fdInterest.value
                                                  .interest = null;
                                              controller.fdInterest.refresh();
                                              // controller.fdAmount.refresh();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20 * fem,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: TextView(
                                        text: "Tenure (in Months)",
                                        fontSize: 14,
                                        color: ColorPallete.secondary,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: RoundedContainer(
                                        radius: 10,
                                        borderColor: ColorPallete.grey,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0, right: 10),
                                          child: MyFormField(
                                            fieldName: "",
                                            showFieldName: false,
                                            initialValue: controller
                                                .tenure.value
                                                .toString(),
                                            type: InputType.DROP_DOWN,
                                            dropDownOptions: List.generate(
                                                72, (index) => "${index + 1}"),
                                            keyboard: TextInputType.text,
                                            onChanged: (value) {
                                              controller.tenure.value =
                                                  int.parse(value);
                                              controller.fdInterest.value
                                                  .interest = null;
                                              controller.fdInterest.refresh();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5 * fem,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() => controller.fdInterest.value.interest != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0 * fem, vertical: 10 * fem),
                        child: MyListView(
                          children: [
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    color: ColorPallete.grey.withOpacity(0.5))
                              ]),
                              child: RoundedContainer(
                                radius: 10,
                                color: ColorPallete.theme,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0 * fem,
                                      horizontal: 15 * fem),
                                  child: MyListView(
                                    children: [
                                      SizedBox(
                                        height: 5 * fem,
                                      ),
                                      const TextView(
                                        text: "FD Maturity Details",
                                        fontSize: 14,
                                        color: ColorPallete.secondary,
                                        weight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      _getEntry("Rate Of Interest*",
                                          "${controller.fdInterest.value.interest} %"),
                                      _getEntry(
                                        "Maturity Date",
                                        DateFormat("dd MMM yyyy").format(
                                          DateTime.now().add(
                                            Duration(
                                                days: 30 *
                                                    controller.tenure.value),
                                          ),
                                        ),
                                      ),
                                      _getEntry("Maturity Value",
                                          "₹ ${controller.getFDMaturityAmount().toStringAsFixed(0)} /-"),
                                      _getEntry("Aggregate Interest Amount",
                                          "₹ ${(controller.getFDMaturityAmount() - controller.fdAmount.value).toStringAsFixed(0)} /-"),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : const SizedBox.shrink())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                controller.fetchFDInterest();
              },
              child: RoundedContainer(
                radius: 10,
                height: 45,
                color: ColorPallete.primary,
                child: Center(
                  child: Obx(
                    () => controller.isLoading.value
                        ? const Padding(
                            padding: EdgeInsets.all(7.50),
                            child: CircularProgressIndicator(
                              color: ColorPallete.theme,
                            ),
                          )
                        : const Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextView(
                              text: "Calculate",
                              color: ColorPallete.theme,
                              fontSize: 14,
                              weight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _getEntry(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: TextView(
              text: title,
              fontSize: 14,
              color: ColorPallete.secondary,
            ),
          ),
          Center(
            child: TextView(
              text: value,
              fontSize: 14,
              color: ColorPallete.primary,
            ),
          ),
        ],
      ),
    );
  }
}
