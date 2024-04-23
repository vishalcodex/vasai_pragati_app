import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/color_pallete.dart';

import '../routes/app_routes.dart';
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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(Routes.HOME);
    });
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(
                        text: "Vasai",
                        alignment: TextAlign.center,
                        color: ColorPallete.primary,
                        weight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      TextView(
                        text: " ",
                        alignment: TextAlign.center,
                        color: ColorPallete.primary,
                        weight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      TextView(
                        text: "Pragati",
                        alignment: TextAlign.center,
                        color: ColorPallete.primaryAccent,
                        weight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15 * fem,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                  child: const TextView(
                    text: "Your Best Money Transfer Partner.",
                    alignment: TextAlign.center,
                    color: ColorPallete.grey,
                    weight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 15 * fem,
                ),
              ],
            )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextView(
                  text: "Secured by ",
                  color: ColorPallete.grey,
                  fontSize: 16,
                ),
                TextView(
                  text: "XYZ",
                  color: ColorPallete.primary,
                  fontSize: 16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
