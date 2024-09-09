import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/color_pallete.dart';

import '../../common/utils.dart';
import '../models/api_response.dart';
import '../repositories/feature_repository.dart';
import '../routes/app_routes.dart';
import 'ui/my_list_view.dart';
import 'ui/rounded_container.dart';
import 'ui/text_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final Shader linearGradient = LinearGradient(
  //   colors: <Color>[Ui.parseColor("#FFA36F"), Ui.parseColor("#FF659C")],
  // ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  // late PackageInfo? packageInfo;
  @override
  void initState() {
    super.initState();
    // fetchPackageInfo();
    Future.delayed(const Duration(seconds: 2), () async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      await FeatureRepository().fetchSettings().then((value) async {
        if (value.status == Status.COMPLETED) {
          var needUpdate = compareVersion(
              appVersion: packageInfo.version,
              latestVersion: value.data["app_version"]);
          if (needUpdate) {
            showUpdateDialog(context);
          } else {
            Get.offAndToNamed(Routes.HOME);
          }
        }
      });
    });
  }

  fetchPackageInfo() async {
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: Container(
        color: ColorPallete.theme,
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         colors: [Color(0xff557FCD), Color(0xff325698)])),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0 * fem),
                  child: Image.asset(
                    "assets/ui/logo.png",
                    height: 150 * fem,
                  ),
                ),
                SizedBox(
                  height: 15 * fem,
                ),
                const TextView(
                  text: "वसई प्रगती को-ऑप.\n क्रेडिट सोसायटी लिमिटेड.",
                  alignment: TextAlign.center,
                  color: ColorPallete.primary,
                  weight: FontWeight.bold,
                  fontSize: 30,
                ),
                SizedBox(
                  height: 10 * fem,
                ),
                const TextView(
                  text: "समृद्ध्याय सहकारिता",
                  alignment: TextAlign.center,
                  color: ColorPallete.red,
                  // weight: FontWeight.bold,
                  fontSize: 20,
                ),
                SizedBox(
                  height: 15 * fem,
                ),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const TextView(
                //   text: "v",
                //   color: ColorPallete.grey,
                //   fontSize: 16,
                // ),
                // TextView(
                //   text: packageInfo?.version ?? "0",
                //   color: ColorPallete.primary,
                //   fontSize: 16,
                // )
              ],
            )
          ],
        ),
      ),
    );
  }

  void showUpdateDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RoundedContainer(
              radius: 0,
              child: MyListView(
                children: [
                  const TextView(
                    text: "Update Available !",
                    color: ColorPallete.primary,
                    fontSize: 16,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const TextView(
                    text:
                        "New update available on Play Store. Please Update the app.",
                    color: ColorPallete.grey,
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (Platform.isAndroid || Platform.isIOS) {
                            final appId = Platform.isAndroid
                                ? 'com.codex.vasai_pragati'
                                : 'YOUR_IOS_APP_ID';
                            final url = Uri.parse(
                              Platform.isAndroid
                                  ? "market://details?id=$appId"
                                  : "https://apps.apple.com/app/id$appId",
                            );
                            launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: const RoundedContainer(
                          radius: 10,
                          color: ColorPallete.primary,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: TextView(
                              text: "Update",
                              color: ColorPallete.theme,
                              fontSize: 13,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
