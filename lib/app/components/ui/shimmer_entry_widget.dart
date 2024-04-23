import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/color_pallete.dart';
import 'rounded_container.dart';
import 'text_view.dart';

class EntryWidget extends StatelessWidget {
  final String title;
  final String? value;
  const EntryWidget({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Row(
      children: [
        Expanded(
            child: TextView(
          text: title,
          fontSize: 14,
          color: ColorPallete.secondary,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0 * fem),
          child: const TextView(text: ":"),
        ),
        Expanded(
          flex: 2,
          child: value == null
              ? RoundedContainer(
                  radius: 0,
                  child: Shimmer.fromColors(
                    baseColor: ColorPallete.grey.withOpacity(0.2),
                    highlightColor: ColorPallete.theme,
                    child: RoundedContainer(
                      radius: 5,
                      color: ColorPallete.grey,
                      height: 15 * fem,
                    ),
                  ),
                )
              : TextView(
                  text: value!,
                  fontSize: 14,
                ),
        )
      ],
    );
  }
}
