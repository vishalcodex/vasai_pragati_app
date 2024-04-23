import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../common/utils.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../controller/auth_controller.dart';

class VerifyOTOScreen extends GetView<AuthController> {
  const VerifyOTOScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPallete.theme,
            leading: Padding(
              padding: EdgeInsets.only(left: 10.0 * fem),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0 * fem),
                  child: Image.asset(
                    "assets/ui/back.png",
                    width: 10 * fem,
                    color: ColorPallete.primary,
                  ),
                ),
              ),
            ),
            elevation: 0,
          ),
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorPallete.theme,
          body: WillPopScope(
            onWillPop: () {
              // if (controller.verifyVpin.value) {
              //   controller.verifyVpin.value = false;
              //   controller.verifyVpin.refresh();
              //   return Future.value(false);
              // }

              return Future.value(true);
            },
            child: RoundedContainer(
              radius: 0,
              height: MediaQuery.of(context).size.height * 0.85,
              color: ColorPallete.theme,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
                child: Obx(
                  () => Column(
                    children: [
                      Expanded(
                        child: MyListView(
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100 * fem,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10.0 * fem),
                              child: const TextView(
                                text: "OTP Verification",
                                color: ColorPallete.secondary,
                                fontSize: 32,
                                weight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 25 * fem,
                            ),
                            MyListView(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0 * fem),
                                  child: const TextView(
                                    text: "Enter OTP",
                                    color: ColorPallete.secondary,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15 * fem,
                                ),
                                RoundedContainer(
                                  radius: 0,
                                  // height: 50,
                                  child: OTPTextField(
                                    length: 6,
                                    width: MediaQuery.of(context).size.width,
                                    fieldWidth: 50 * fem,
                                    style: SafeGoogleFont(
                                      'Roboto',
                                      fontSize: 25 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      letterSpacing: -0.349999994 * fem,
                                      color: ColorPallete.secondary,
                                    ),
                                    contentPadding: EdgeInsets.all(15 * fem),
                                    // obscureText: true,
                                    textFieldAlignment:
                                        MainAxisAlignment.spaceAround,
                                    fieldStyle: FieldStyle.box,
                                    otpFieldStyle: OtpFieldStyle(
                                      borderColor: ColorPallete.greyContainer,
                                      enabledBorderColor:
                                          ColorPallete.greyContainer,
                                      backgroundColor:
                                          ColorPallete.greyContainer,
                                      focusBorderColor:
                                          ColorPallete.greyContainer,
                                    ),
                                    onCompleted: (pin) {
                                      controller.creds["otp"] = pin;
                                    },
                                    onChanged: (value) {
                                      controller.creds["otp"] =
                                          value.length > 5 ? value : "";
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 25 * fem,
                                ),
                                Obx(
                                  () => controller.errorMessage.value != ""
                                      ? TextView(
                                          text: controller.errorMessage.value,
                                          color: ColorPallete.red,
                                          fontSize: 14,
                                          weight: FontWeight.bold,
                                        )
                                      : SizedBox.shrink(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // if (!controller.verifyVpin.value) {
                          //   if (!controller.isLoading.value)
                          //     controller.signIn();
                          // } else {
                          //   if (controller.validVpin.value ||
                          //       !controller.isLoading.value)
                          //     controller.loginViaVpin();
                          // }
                          controller.verification();
                        },
                        child: RoundedContainer(
                          radius: 10,
                          height: 45,
                          color: ColorPallete.primary,
                          child: controller.isLoading.value
                              ? const RoundedContainer(
                                  radius: 0,
                                  height: 45,
                                  width: 45,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: ColorPallete.theme,
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: TextView(
                                    text: "Verify OTP",
                                    color: ColorPallete.theme,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
