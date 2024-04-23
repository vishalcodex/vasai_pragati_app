import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/color_pallete.dart';
import '../../../components/ui/custom_app_bar.dart';
import '../../../components/ui/my_list_view.dart';
import '../../../components/ui/rounded_container.dart';
import '../../../components/ui/text_view.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final List<Map<String, String>> branches = [
    {
      "name": "अर्नाळा शाखा (Main Branch)",
      "manager": "लकेश भोईर (शाखा व्यवस्थापक)",
      "address":
          "आगरी भवन , सोसायटी स्टॉप , अर्नाळा , विरार (पश्चिम), तालुका . वसई, जिल्हा . पालघर - ४०१३०२.",
      "email": "arnala@vasaipragati.com",
      "contact": "८०८०९४०३७१"
    },
    {
      "name": "दिवाणमान शाखा",
      "manager": "जगदीश पाटील (शाखा व्यवस्थापक)",
      "address":
          "हनुमान मंदीर समोर , दिवाणमान गाव , वसई (पश्चिम ), तालुका . वसई , जिल्हा . पालघर - ४०१२०२",
      "email": "diwanman@vasaipragati.com",
      "contact": "८०८०९४०३७२"
    },
    {
      "name": "उमेळमान शाखा",
      "manager": "जयकीसन मानकर (शाखा व्यवस्थापक)",
      "address":
          "गणेश मंदिर समोर , उमेळमान गाव , वसई (पश्चिम), तालुका. वसई , जिल्हा . पालघर - ४०१२०२.",
      "email": "umelman@vasaipragati.com",
      "contact": "८०८०९४०३७३"
    },
    {
      "name": "आगाशी शाखा",
      "manager": "प्रीती घरत (शाखा व्यवस्थापक)",
      "address":
          "गणेश मंदिर जवळ , पुरापाडा , आगाशी , विरार(पश्चिम), तालुका . वसई , जिल्हा . पालघर - ४०१३०१.",
      "email": "agashi@vasaipragati.com",
      "contact": "८०८०९४०३७४"
    },
    {
      "name": "पाणजू शाखा",
      "manager": "निलेश पाटील (शाखा व्यवस्थापक)",
      "address":
          "पाणजू , नायगाव (पश्चिम ), तालुका . वसई, जिल्हा . पालघर - ४०१२०७.",
      "email": "panju@vasaipragati.com",
      "contact": "८०८०९४०३७५"
    },
    {
      "name": "बोळींज शाखा",
      "manager": "भरत पाटील (शाखा व्यवस्थापक)",
      "address":
          "कृष्णा अर्जुन अपार्टमेंट, बोळींज उमराळे रस्ता , बोळींज , विरार (पश्चिम ),तालुका . वसई, जिल्हा . पालघर - ४०१३०३.",
      "email": "bolinj@vasaipragati.com",
      "contact": "८०८०९४०३७६"
    },
    {
      "name": "जुचंद्र शाखा",
      "manager": "तुषार म्हात्रे (शाखा व्यवस्थापक)",
      "address":
          "कुसुम अपार्टमेंट समोर , गावदेवी (जरीमरी ) मंदिर , जुचंद्र नायगाव (पूर्व ) तालुका . वसई , जिल्हा . पालघर - ४०१२०८.",
      "email": "juchandra@vasaipragati.com",
      "contact": "८०८०९४०३७७"
    },
    {
      "name": "नारिंगी शाखा",
      "manager": "स्मिता घरत (शाखा व्यवस्थापक)",
      "address":
          "मथुरा अपार्टमेंट, नारिंगी फाटकाजवळ , विरार (पूर्व ), तालुका. वसई , जिल्हा . पालघर - ४०१३०३.",
      "email": "naringi@vasaipragati.com",
      "contact": "८०८०९४०३७८"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: ColorPallete.theme,
      body: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(0, 50 * fem),
            child: CustomAppBar(pageName: "Contact Us"),
          ),
          backgroundColor: ColorPallete.theme,
          body: MyListView(
            scroll: true,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0 * fem),
                child: MyListView(
                  children: branches.map((branch) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0 * fem),
                      child: RoundedContainer(
                        radius: 15,
                        borderColor: ColorPallete.primary.withOpacity(0.5),
                        color: ColorPallete.theme,
                        child: Padding(
                          padding: EdgeInsets.all(15.0 * fem),
                          child: MyListView(
                            children: [
                              TextView(
                                text: branch["name"].toString(),
                                color: ColorPallete.secondary,
                                fontSize: 16,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5 * fem,
                              ),
                              TextView(
                                text: branch["manager"].toString(),
                                color: ColorPallete.secondary,
                                weight: FontWeight.w600,
                                fontSize: 14,
                              ),
                              SizedBox(
                                height: 7.5 * fem,
                              ),
                              TextView(
                                text: branch["address"].toString(),
                                color: ColorPallete.secondary,
                                fontSize: 14,
                                weight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              InkWell(
                                onTap: () {
                                  final Uri emailLaunchUri = Uri(
                                    scheme: 'mailto',
                                    path: branch["email"].toString(),
                                  );
                                  launchUrl(emailLaunchUri);
                                },
                                child: Row(
                                  children: [
                                    const TextView(
                                      text: "Email Id : ",
                                      color: ColorPallete.secondary,
                                      fontSize: 14,
                                      weight: FontWeight.w400,
                                    ),
                                    TextView(
                                      text: branch["email"].toString(),
                                      color: ColorPallete.primary,
                                      fontSize: 14,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5 * fem,
                              ),
                              InkWell(
                                onTap: () {
                                  final Uri telLaunchUri = Uri(
                                    scheme: 'tel',
                                    path: branch["contact"].toString(),
                                  );
                                  launchUrl(telLaunchUri);
                                },
                                child: Row(
                                  children: [
                                    const TextView(
                                      text: "Tel : ",
                                      color: ColorPallete.secondary,
                                      fontSize: 14,
                                      weight: FontWeight.w400,
                                    ),
                                    TextView(
                                      text: branch["contact"].toString(),
                                      color: ColorPallete.primary,
                                      fontSize: 14,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
