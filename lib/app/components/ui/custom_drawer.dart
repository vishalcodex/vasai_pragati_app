import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/color_pallete.dart';
import '../../routes/app_routes.dart';
import '../../screens/home/controllers/home_controller.dart';
import 'my_list_view.dart';
import 'rounded_container.dart';
import 'text_view.dart';

class CustomDrawer extends GetView<HomeController> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Container(
        decoration: const BoxDecoration(
          color: ColorPallete.accent,
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(30 * fem),
          //     bottomLeft: Radius.circular(30 * fem)),
        ),
        height: double.infinity,
        width: baseWidth * 0.75 * fem,
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 10 * fem, horizontal: 15 * fem),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User

              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0 * fem, vertical: 2.5 * fem),
                      child: Icon(
                        Icons.close,
                        color: ColorPallete.secondary,
                        size: 25 * fem,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5 * fem,
              ),
              Image.asset(
                "assets/ui/logo.png",
                height: 75 * fem,
              ),

              SizedBox(
                height: 10 * fem,
              ),
              TextView(
                text: controller.user.value.accountName?.capitalize! ?? "",
                color: ColorPallete.secondary,
                fontSize: 18,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 10 * fem,
              ),
              if (controller.user.value.email != null)
                TextView(
                  text: controller.user.value.email ?? "",
                  color: ColorPallete.secondary,
                  fontSize: 14,
                  weight: FontWeight.w400,
                ),
              if (controller.user.value.email != null)
                SizedBox(
                  height: 10 * fem,
                ),
              InkWell(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: controller.user.value.accountName!));
                },
                child: Row(
                  children: [
                    const TextView(
                      text: "A/C No.: ",
                      color: ColorPallete.primary,
                      weight: FontWeight.w600,
                    ),
                    TextView(
                      text: controller.user.value.sbaccountId ?? "",
                      color: ColorPallete.primary,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(
                      width: 10 * fem,
                    ),
                    Icon(
                      Icons.copy,
                      color: ColorPallete.primary,
                      size: 15 * fem,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10 * fem,
              ),
              const Row(
                children: [
                  // TextView(
                  //   text:
                  //       "${controller.user.value.accounts!.length} Account${controller.user.value.accounts!.length > 1 ? "s" : ""}",
                  //   color: ColorPallete.grey,
                  //   weight: FontWeight.w400,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 5.0 * fem),
                  //   child: CircleAvatar(
                  //     backgroundColor: ColorPallete.grey,
                  //     radius: 1.5 * fem,
                  //   ),
                  // ),
                  TextView(
                    text: "Personal",
                    color: ColorPallete.grey,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(
                height: 15 * fem,
              ),
              Expanded(
                child: MyListView(
                  scroll: true,
                  children: [
                    DrawerItem(
                        image: "assets/ui/user.png",
                        title: "Profile",
                        onPressed: () {
                          controller.fetchProfile();
                          Get.toNamed(Routes.MY_PROFILE);
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    // DrawerItem(
                    //     image: "assets/ui/wallet.png",
                    //     title: "Wallet",
                    //     onPressed: () {}),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    // DrawerItem(
                    //     image: "assets/ui/settings.png",
                    //     title: "Settings",
                    //     onPressed: () {}),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    // Divider(
                    //   thickness: 1 * fem,
                    //   height: 10 * fem,
                    //   color: ColorPallete.grey,
                    // ),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        image: "assets/ui/settings.png",
                        title: "About Us",
                        onPressed: () {
                          Get.toNamed(Routes.ABOUT_US);
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        image: "assets/ui/settings.png",
                        title: "Contact Us",
                        onPressed: () {
                          Get.toNamed(Routes.CONTACT_US);
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    DrawerItem(
                        image: "assets/ui/dashboard_icon.png",
                        title: "Visit Us",
                        onPressed: () {
                          launchUrl(
                            Uri.parse("https://www.vasaipragati.com"),
                          );
                        }),
                    SizedBox(
                      height: 5 * fem,
                    ),
                    // DrawerItem(
                    //     image: "assets/ui/settings.png",
                    //     title: "Terms & Conditions",
                    //     onPressed: () {}),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                    // DrawerItem(
                    //     image: "assets/ui/settings.png",
                    //     title: "FAQs",
                    //     onPressed: () {}),
                    // SizedBox(
                    //   height: 5 * fem,
                    // ),
                  ],
                ),
              ),

              SizedBox(
                height: 5 * fem,
              ),
              InkWell(
                onTap: () async {
                  Get.offAndToNamed(Routes.AUTH);
                  // await Get.find<AuthService>()
                  //     .removeCurrentUser()
                  //     .then((value) {

                  // });
                },
                child: RoundedContainer(
                  radius: 10 * fem,
                  color: ColorPallete.primary,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0 * fem),
                    child: const Center(
                      child: TextView(
                        text: "Log Out",
                        color: ColorPallete.theme,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class DrawerItem extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String title;
  final Function() onPressed;
  const DrawerItem(
      {super.key,
      this.icon,
      this.image,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return InkWell(
      onTap: () {
        Get.back();
        onPressed();
        // controller.setTabIndex.value = 1;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.5 * fem),
        child: RoundedContainer(
          // height: 45,
          radius: 10,
          color: ColorPallete.primary.withOpacity(0.1),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 15.0 * fem, vertical: 7.5 * fem),
            child: Center(
              child: Row(
                children: [
                  if (image != null)
                    Image.asset(
                      image!,
                      color: ColorPallete.primary,
                      height: 25 * fem,
                    ),
                  SizedBox(
                    width: 10 * fem,
                  ),
                  Center(
                    child: TextView(
                      text: title,
                      fontSize: 14,
                      weight: FontWeight.w500,
                      color: ColorPallete.secondary,
                    ),
                  ),
                  const Spacer(),
                  Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      "assets/ui/back.png",
                      width: 25 * fem,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
