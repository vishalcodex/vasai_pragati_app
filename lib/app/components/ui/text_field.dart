import 'package:flutter/material.dart';

import '../../../common/color_pallete.dart';
import '../../../common/utils.dart';

class MyTextField extends StatelessWidget {
  final Color? textColor;
  final Color? hintColor;
  final double? fontSize;
  final String? initialValue;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final bool? showLine;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmit;
  const MyTextField({
    super.key,
    this.textColor,
    this.hintColor,
    this.initialValue,
    this.hintText,
    this.obscureText,
    this.showLine,
    this.fontSize,
    this.keyboardType,
    this.onChanged,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return TextFormField(
      key: Key(initialValue ?? ""),
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      initialValue: initialValue ?? "",
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: showLine ?? false ? null : InputBorder.none,
        hintText: hintText ?? "",
        hintStyle: SafeGoogleFont('Roboto',
            fontSize: (fontSize ?? 12) * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2175 * ffem / fem,
            color: hintColor ?? ColorPallete.grey),
      ),
      style: SafeGoogleFont('Roboto',
          fontSize: (fontSize ?? 12) * ffem,
          fontWeight: FontWeight.w500,
          height: 1.2175 * ffem / fem,
          color: textColor ?? ColorPallete.secondary),
    );
  }
}
