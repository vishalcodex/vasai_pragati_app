import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:vasai_pragati/app/components/ui/my_list_view.dart';
import 'package:vasai_pragati/app/routes/app_routes.dart';

import '../../../../common/utils.dart';
import '../../../components/ui/text_field.dart';
import '../../../components/ui/text_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/rounded_container.dart';
import '../controller/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    // controller.showPassword.value = false;
    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Obx(
          () => Scaffold(
            appBar: controller.verifyVpin.value
                ? AppBar(
                    backgroundColor: ColorPallete.theme,
                    leading: Padding(
                      padding: EdgeInsets.only(left: 10.0 * fem),
                      child: InkWell(
                        onTap: () {
                          controller.verifyVpin.value = false;
                          controller.verifyVpin.refresh();
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
                  )
                : null,
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorPallete.theme,
            body: WillPopScope(
              onWillPop: () {
                if (controller.verifyVpin.value) {
                  controller.verifyVpin.value = false;
                  controller.errorMessage.value = "";
                  controller.verifyVpin.refresh();
                  return Future.value(false);
                }

                return Future.value(false);
              },
              child: RoundedContainer(
                radius: 0,
                height: MediaQuery.of(context).size.height * 0.85,
                color: ColorPallete.theme,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                  child: Column(
                    children: [
                      Expanded(
                        child: MyListView(
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: (controller.verifyVpin.value ? 45 : 100) *
                                  fem,
                            ),
                            const TextView(
                              text: "Log in",
                              color: ColorPallete.secondary,
                              fontSize: 32,
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 25 * fem,
                            ),
                            controller.verifyVpin.value
                                ? MyListView(
                                    children: [
                                      const TextView(
                                        text: "Enter VPIN",
                                        color: ColorPallete.secondary,
                                        fontSize: 16,
                                      ),
                                      SizedBox(
                                        height: 15 * fem,
                                      ),
                                      RoundedContainer(
                                        radius: 0,
                                        // height: 50,
                                        child: OTPTextField(
                                          length: 4,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fieldWidth: 75 * fem,
                                          style: SafeGoogleFont(
                                            'Roboto',
                                            fontSize: 25 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5 * ffem / fem,
                                            letterSpacing: -0.349999994 * fem,
                                            color: ColorPallete.secondary,
                                          ),
                                          isDense: true,
                                          hasError:
                                              controller.errorMessage.value !=
                                                  "",
                                          contentPadding:
                                              EdgeInsets.all(15 * fem),
                                          obscureText: true,
                                          textFieldAlignment:
                                              MainAxisAlignment.spaceAround,
                                          fieldStyle: FieldStyle.box,
                                          otpFieldStyle: OtpFieldStyle(
                                            borderColor:
                                                ColorPallete.greyContainer,
                                            enabledBorderColor:
                                                ColorPallete.greyContainer,
                                            backgroundColor:
                                                ColorPallete.greyContainer,
                                            focusBorderColor:
                                                ColorPallete.greyContainer,
                                          ),
                                          onCompleted: (pin) {
                                            controller.creds["confirm_pin"] =
                                                pin;
                                            // controller.checkVpin();
                                          },
                                          onChanged: (value) {
                                            controller.creds["confirm_pin"] =
                                                value.length > 3 ? value : "";
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25 * fem,
                                      ),
                                      if (controller.errorMessage.value != "")
                                        TextView(
                                          text: controller.errorMessage.value,
                                          color: ColorPallete.red,
                                          fontSize: 14,
                                          weight: FontWeight.bold,
                                        ),
                                    ],
                                  )
                                : MyListView(
                                    children: [
                                      const TextView(
                                        text: "Customer ID",
                                        color: ColorPallete.secondary,
                                        fontSize: 16,
                                      ),
                                      SizedBox(
                                        height: 10 * fem,
                                      ),
                                      RoundedContainer(
                                        radius: 7.5,
                                        // borderColor: ColorPallete.primary,
                                        color:
                                            ColorPallete.grey.withOpacity(0.15),
                                        child: Row(
                                          children: [
                                            // Padding(
                                            //   padding: EdgeInsets.symmetric(
                                            //       horizontal: 10.0 * fem),
                                            //   child: const Icon(
                                            //     Icons.person_outline,
                                            //     color: ColorPallete.primary,
                                            //   ),
                                            // ),
                                            SizedBox(
                                              width: 15 * fem,
                                            ),
                                            Expanded(
                                              child: MyTextField(
                                                // initialValue:
                                                //     controller.creds["phone"],
                                                hintText: "hello@gmail.com",
                                                fontSize: 16,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                onChanged: (value) {
                                                  controller.creds["phone"] =
                                                      value;
                                                  // controller
                                                  //     .errorMessage.value = "";
                                                  // controller.checkEmail();
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.0 * fem),
                                              child: InkWell(
                                                  // onTap: () {
                                                  //   controller.showPassword.value =
                                                  //       !controller.showPassword.value;
                                                  // },
                                                  child: Obx(
                                                () => Icon(
                                                  Icons.check_circle,
                                                  color: controller
                                                          .validEmail.value
                                                      ? ColorPallete.primary
                                                      : ColorPallete.grey
                                                          .withOpacity(0.5),
                                                ),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25 * fem,
                                      ),
                                      RoundedContainer(
                                        radius: 7.5,
                                        // borderColor: ColorPallete.grey,
                                        color:
                                            ColorPallete.grey.withOpacity(0.15),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 15 * fem,
                                            ),
                                            Expanded(
                                              child: MyTextField(
                                                // initialValue: controller
                                                //     .creds["password"],
                                                hintText: "Password",
                                                fontSize: 16,
                                                obscureText: !controller
                                                    .showPassword.value,
                                                onChanged: (value) {
                                                  controller.creds["password"] =
                                                      value;
                                                  // controller
                                                  //     .errorMessage.value = "";
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.0 * fem),
                                              child: InkWell(
                                                onTap: () {
                                                  controller
                                                          .showPassword.value =
                                                      !controller
                                                          .showPassword.value;
                                                },
                                                child: Icon(
                                                  controller.showPassword.value
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: ColorPallete.grey
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25 * fem,
                                      ),
                                      MyListView(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.errorMessage.value =
                                                  "";
                                              Get.toNamed(
                                                  Routes.FORGOT_PASSWORD);
                                            },
                                            child: const TextView(
                                              alignment: TextAlign.right,
                                              text: "Forgot Your Password ?",
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25 * fem,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.errorMessage.value =
                                                  "";
                                              controller.verifyVpin.value =
                                                  true;
                                            },
                                            child: const TextView(
                                              alignment: TextAlign.right,
                                              text: "Use VPIN",
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25 * fem,
                                      ),
                                      if (controller.errorMessage.value != "")
                                        TextView(
                                          text: controller.errorMessage.value,
                                          color: ColorPallete.red,
                                          fontSize: 14,
                                          weight: FontWeight.bold,
                                        ),
                                    ],
                                  )
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 10 * fem,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const TextView(
                      //       text: "By Continue You Agree With Our",
                      //       color: ColorPallete.secondary,
                      //       fontSize: 14,
                      //     ),
                      //     InkWell(
                      //       onTap: () {},
                      //       child: const TextView(
                      //         text: " Terms - Conditions",
                      //         fontSize: 14,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 5 * fem,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const TextView(
                      //       text: "And",
                      //       fontSize: 14,
                      //       color: ColorPallete.secondary,
                      //     ),
                      //     InkWell(
                      //       onTap: () {},
                      //       child: const TextView(
                      //         text: " Privacy - Policy's",
                      //         fontSize: 14,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 5 * fem,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 10.0 * fem),
                      //   child: Divider(
                      //     thickness: 1 * fem,
                      //     height: 1 * fem,
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                        child: const Center(
                          child: TextView(
                            alignment: TextAlign.center,
                            text: "Codex Tech - V 1.0.0",
                            color: ColorPallete.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25 * fem,
                      ),
                      Obx(
                        () => InkWell(
                          onTap: () {
                            if (!controller.verifyVpin.value) {
                              if (!controller.isLoading.value)
                                controller.signIn();
                            } else {
                              if (controller.validVpin.value ||
                                  !controller.isLoading.value)
                                controller.loginViaVpin();
                            }
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
                                      text: "Log in",
                                      color: ColorPallete.theme,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                        ),
                      )
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
