import 'package:flutter/material.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/text_view.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: ColorPallete.primary,
      body: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(0, 50 * fem),
            child: CustomAppBar(pageName: "About Us"),
          ),
          backgroundColor: ColorPallete.theme,
          body: MyListView(
            scroll: true,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0 * fem),
                child: MyListView(
                  children: [
                    SizedBox(
                      height: 20 * fem,
                    ),
                    Image.asset(
                      "assets/ui/logo.png",
                      height: 125 * fem,
                    ),
                    SizedBox(
                      height: 20 * fem,
                    ),
                    const TextView(
                      text: "Vasai Pragati Co-op Credit Society Ltd.",
                      fontSize: 18,
                      color: ColorPallete.primary,
                      alignment: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20 * fem,
                    ),
                    const Center(
                      child: TextView(
                        text: "About the organization.....!",
                        fontSize: 14,
                        color: ColorPallete.secondary,
                        alignment: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 10 * fem,
                    ),
                    const TextView(
                      text:
                          "   Inspired by 'Agri Samaj Vikas Mandal, Vasai Taluka [Padicham Division]' 11 Vasai Pragati Co-op on October 1992. Credit Society Limited was established And on 05 March 1993, the credit institution was registered under registration no. TNA [VSI] RSR [CR] 647/52-93 Got and Agri By realizing this dream seen by the leaders of the society at that time, the society is ours His own financial helping hand became available.\n \n   Vasai Pragati K. Mr. Ramchandra no. Ours under the leadership of Bhoir, the chief innovator Arnala on 20th May 1993 in the premises of old Hotki Society while starting the work The ram was planted on the occasion of Zakhe. Since the area of ​​operation of the rganization is Vasai Taluka and Agri Samaj The organization registered members and collected deposits from the villages of Umelman, Diwanman, Panju done \n\n    Vasai Pragati expands its  cope on 17 April 14 Second Zakha at Diwanman, dated 26 January 1995 Umelman, dated 27 Agashi on October 1996, by opening the Panju Jhakha on 11 October 1997 Finance to citizens of other communities along with agri acquaintances in your area of ​​work He gave a helping hand and helped agriculture, sugarcane, industries, rickshaw drivers etc. in the society. Professionals have gained energy. \n\n   In the year 2001, the organization established Area 0. 11.00 land area By 'buying the ownership right there ground floor * first floor Aji grand structure Earned the reputation as Adarsh ​​Credit Institution in Vasai. Mahe in May 2015 'Come on 17th December 2015 taking up the expansion of the head office building The newly expanded Vastu has been inaugurated and 4000 sq. Wide range of modern facilities of foot- A well-equipped, head office has been made available to the organization. Vasai today There are eight branches of progress and seven branches are self-owned and the Juchandra branch is on rent.",
                      fontSize: 14,
                      color: ColorPallete.secondary,
                      alignment: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10 * fem,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
