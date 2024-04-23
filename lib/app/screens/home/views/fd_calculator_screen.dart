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
                      child: Obx(
                        () => RoundedContainer(
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
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Row(
                                    children: ["Normal", "Senior Citizen"].map(
                                      (e) {
                                        bool selected =
                                            e == controller.customerType.value;
                                        return Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              controller.customerType.value = e;
                                              controller.customerType.refresh();
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  selected
                                                      ? Icons
                                                          .radio_button_checked
                                                      : Icons.radio_button_off,
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
                                                      : ColorPallete.secondary,
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
                                SizedBox(
                                  height: 20 * fem,
                                ),
                                //TYPE OF FD
                                const TextView(
                                  text: "Types of Fixed Deposit",
                                  fontSize: 14,
                                  color: ColorPallete.secondary,
                                ),
                                SizedBox(
                                  height: 10 * fem,
                                ),
                                RoundedContainer(
                                  radius: 10,
                                  borderColor: ColorPallete.grey,
                                  child: MyFormField(
                                    fieldName: "",
                                    type: InputType.DROP_DOWN,
                                    dropDownOptions: const [
                                      "Reinvestment (Cumulative)",
                                      "Reinvestment (Non - Cumulative)",
                                    ],
                                    keyboard: TextInputType.text,
                                    onChanged: (value) {},
                                  ),
                                ),

                                SizedBox(
                                  height: 20 * fem,
                                ),
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
                                            fontSize: 14,
                                            onSubmit: (value) {
                                              controller.fdAmount.value =
                                                  double.parse(value);
                                              controller.fdAmount.refresh();
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
                                const TextView(
                                  text: "Tenure",
                                  fontSize: 14,
                                  color: ColorPallete.secondary,
                                ),
                                SizedBox(
                                  height: 5 * fem,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: ["YY/MM/DD", "Days Only"].map(
                                      (e) {
                                        bool selected =
                                            e == controller.tenureType.value;
                                        return InkWell(
                                          onTap: () {
                                            controller.tenureType.value = e;
                                            controller.tenureType.refresh();
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                selected
                                                    ? Icons.radio_button_checked
                                                    : Icons.radio_button_off,
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
                                                    : ColorPallete.secondary,
                                                weight: selected
                                                    ? FontWeight.w600
                                                    : FontWeight.w400,
                                                fontSize: 14,
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    if (controller.tenureType.value !=
                                        "Days Only")
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: RoundedContainer(
                                                radius: 10,
                                                height: 45,
                                                clip:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: ColorPallete.theme,
                                                borderColor: ColorPallete.grey,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            color: ColorPallete
                                                                .grey,
                                                            child: const Center(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child: TextView(
                                                                  text: "YY",
                                                                  color:
                                                                      ColorPallete
                                                                          .theme,
                                                                  weight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    15.0),
                                                        child: MyTextField(
                                                          hintText: "0",
                                                          fontSize: 16,
                                                          onChanged: (value) {},
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: RoundedContainer(
                                                radius: 10,
                                                height: 45,
                                                clip:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: ColorPallete.theme,
                                                borderColor: ColorPallete.grey,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            color: ColorPallete
                                                                .grey,
                                                            child: const Center(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10.0),
                                                                child: TextView(
                                                                  text: "MM",
                                                                  color:
                                                                      ColorPallete
                                                                          .theme,
                                                                  weight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    15.0),
                                                        child: MyTextField(
                                                          hintText: "0",
                                                          fontSize: 16,
                                                          onChanged: (value) {},
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    Expanded(
                                      child: RoundedContainer(
                                        radius: 10,
                                        height: 45,
                                        clip: Clip.antiAliasWithSaveLayer,
                                        color: ColorPallete.theme,
                                        borderColor: ColorPallete.grey,
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    color: ColorPallete.grey,
                                                    child: const Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: TextView(
                                                          text: "DD",
                                                          color: ColorPallete
                                                              .theme,
                                                          weight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child: MyTextField(
                                                  hintText: "0",
                                                  fontSize: 16,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 10 * fem,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
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
                      child: Obx(
                        () => RoundedContainer(
                          radius: 10,
                          color: ColorPallete.theme,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0 * fem, horizontal: 15 * fem),
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
                                _getEntry("Maturity Value", "5,000"),
                                _getEntry("Rate Of Interest*", "5.75%"),
                                _getEntry("Maturity Date", "16 May 2024"),
                                _getEntry(
                                    "Aggregate Interest Amount", "12,000"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ))
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
