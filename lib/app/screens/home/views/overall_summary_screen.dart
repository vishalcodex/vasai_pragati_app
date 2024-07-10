import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';
import '../controllers/home_controller.dart';

class OverallSummaryScreen extends GetView<HomeController> {
  const OverallSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 50 * fem),
        child: CustomAppBar(pageName: "Overall Summary"),
      ),
      backgroundColor: ColorPallete.theme,
      body: Obx(
        () => Column(
          children: [
            RoundedContainer(
              radius: 0,
              child: Row(
                children: ["Deposit", "Loan"].map((e) {
                  bool selected = e == controller.selectedSummary.value;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          controller.onSummaryTabSelected(e);
                        },
                        child: RoundedContainer(
                          radius: 10,
                          color: selected
                              ? ColorPallete.primary
                              : ColorPallete.theme,
                          borderColor: selected
                              ? ColorPallete.primary
                              : ColorPallete.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: TextView(
                                text: e,
                                color: selected
                                    ? ColorPallete.theme
                                    : ColorPallete.secondary,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
                child: MyListView(
              scroll: true,
              children: [
                controller.isLoading.value
                    ? const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : controller.selectedAccountSummary.isEmpty
                        ? const SizedBox(
                            height: 200,
                            child: Center(
                              child: TextView(
                                text: "No Accounts",
                                fontSize: 16,
                                color: ColorPallete.grey,
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(15.0 * fem),
                            child: MyListView(
                              children: controller.selectedAccountSummary
                                  .map((element) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: ColorPallete.grey
                                              .withOpacity(0.5),
                                          blurRadius: 15,
                                          spreadRadius: 10)
                                    ]),
                                    child: InkWell(
                                      onTap: () {
                                        controller.onSummarySelected(element);
                                      },
                                      child: RoundedContainer(
                                        radius: 10,
                                        color: ColorPallete.theme,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: MyListView(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextView(
                                                    text: element.subgroupName
                                                        .toString(),
                                                    fontSize: 14,
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const TextView(
                                                    text: "Total Accounts :",
                                                    fontSize: 14,
                                                    color:
                                                        ColorPallete.secondary,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  TextView(
                                                    text: element.totalAccounts
                                                        .toString(),
                                                    fontSize: 14,
                                                    color:
                                                        ColorPallete.secondary,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const TextView(
                                                    text:
                                                        "Total Available balance:",
                                                    fontSize: 14,
                                                    color:
                                                        ColorPallete.secondary,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  TextView(
                                                    text:
                                                        "₹${element.nbalance}/-",
                                                    fontSize: 14,
                                                    color:
                                                        ColorPallete.secondary,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
