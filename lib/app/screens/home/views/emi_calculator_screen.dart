import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:vasai_pragati/app/screens/home/widgets/slider_view_widget.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

class EMICalculatorScreen extends GetView<HomeController> {
  const EMICalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
          child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(0, 50 * fem),
          child: CustomAppBar(pageName: "EMI Calculator"),
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
                              padding: EdgeInsets.all(10.0 * fem),
                              child: MyListView(
                                children: [
                                  SizedBox(
                                    height: 10 * fem,
                                  ),
                                  const TextView(
                                    text: "Loan Amount (In Rupees)",
                                    fontSize: 14,
                                    color: ColorPallete.secondary,
                                  ),
                                  SizedBox(
                                    height: 5 * fem,
                                  ),
                                  RoundedContainer(
                                    radius: 10,
                                    borderColor: ColorPallete.grey,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0 * fem),
                                      child: MyTextField(
                                        keyboardType: TextInputType.number,
                                        initialValue:
                                            controller.amount.value.toString(),
                                        hintText: "Your Amount",
                                        // onChanged: (value) {

                                        // },
                                        onSubmit: (value) {
                                          controller.amount.value =
                                              double.parse(value);
                                          controller.amount.refresh();
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5 * fem,
                                  ),
                                  SliderViewWidget(
                                    value: controller.amount.value,
                                    range: SfRangeValues(0.0, 80.0),
                                    metric: "L",
                                    step: 20,
                                    onChanged: (value) {
                                      controller.amount.value = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30 * fem,
                                  ),
                                  const TextView(
                                    text: "Interest Rate (%)",
                                    fontSize: 14,
                                    color: ColorPallete.secondary,
                                  ),
                                  SizedBox(
                                    height: 5 * fem,
                                  ),
                                  RoundedContainer(
                                    radius: 10,
                                    borderColor: ColorPallete.grey,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0 * fem),
                                      child: MyTextField(
                                        initialValue: controller.interest.value
                                            .toString(),
                                        hintText: "Your Interest",
                                        onSubmit: (value) {
                                          controller.interest.value =
                                              double.parse(value);
                                          controller.interest.refresh();
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5 * fem,
                                  ),
                                  SliderViewWidget(
                                    value: controller.tenure.value.toDouble(),
                                    range: SfRangeValues(5.0, 30.0),
                                    metric: "",
                                    step: 5,
                                    onChanged: (value) {
                                      controller.interest.value = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30 * fem,
                                  ),
                                  const TextView(
                                    text: "Loan Tenure",
                                    fontSize: 14,
                                    color: ColorPallete.secondary,
                                  ),
                                  SizedBox(
                                    height: 5 * fem,
                                  ),
                                  RoundedContainer(
                                    radius: 10,
                                    borderColor: ColorPallete.grey,
                                    clip: Clip.antiAliasWithSaveLayer,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0 * fem),
                                            child: MyTextField(
                                              hintText: "Your Tenure",
                                              initialValue: controller
                                                  .tenure.value
                                                  .toString(),
                                              onSubmit: (value) {
                                                controller.tenure.value =
                                                    int.parse(value);
                                                controller.tenure.refresh();
                                              },
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.isYear.value =
                                                        true;
                                                  },
                                                  child: RoundedContainer(
                                                    radius: 0,
                                                    color: controller
                                                            .isYear.value
                                                        ? ColorPallete.primary
                                                        : ColorPallete.grey
                                                            .withOpacity(0.5),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  13.0 * fem),
                                                      child: Center(
                                                        child: TextView(
                                                          text: "Yr",
                                                          fontSize: 14,
                                                          color: controller
                                                                  .isYear.value
                                                              ? ColorPallete
                                                                  .theme
                                                              : ColorPallete
                                                                  .secondary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.isYear.value =
                                                        false;
                                                  },
                                                  child: RoundedContainer(
                                                    radius: 0,
                                                    color: controller
                                                            .isYear.value
                                                        ? ColorPallete.grey
                                                            .withOpacity(0.5)
                                                        : ColorPallete.primary,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  13.0 * fem),
                                                      child: Center(
                                                        child: TextView(
                                                          text: "Mo",
                                                          fontSize: 14,
                                                          color: controller
                                                                  .isYear.value
                                                              ? ColorPallete
                                                                  .secondary
                                                              : ColorPallete
                                                                  .theme,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5 * fem,
                                  ),
                                  SliderViewWidget(
                                    value: controller.tenure.value.toDouble(),
                                    range: SfRangeValues(5.0, 30.0),
                                    metric: "",
                                    step: 5,
                                    onChanged: (value) {
                                      controller.tenure.value = value.toInt();
                                    },
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      const Center(
                                        child: TextView(
                                          text: "Loan EMI",
                                          fontSize: 14,
                                          color: ColorPallete.secondary,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      Center(
                                        child: TextView(
                                          text:
                                              "₹ ${controller.getLoanEMI()} /-",
                                          fontSize: 18,
                                          color: ColorPallete.secondary,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      const Center(
                                        child: TextView(
                                          text: "Total Interest Payable",
                                          fontSize: 14,
                                          color: ColorPallete.secondary,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      Center(
                                        child: TextView(
                                          text:
                                              "₹ ${controller.getTotalInterestPayable()} /-",
                                          fontSize: 18,
                                          color: ColorPallete.secondary,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                    ],
                                  ),
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
      )),
    );
  }
}
