import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/app_dimensions.dart';
import '../config/app_fonts_style.dart';

///Customized Button for this app
///You can edit or update as modification needed
class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double? fontsize;
  final VoidCallback onTap;
  final Color? color;
  final bool? border;
  final Color? textcolor;
  const CustomButton(
      {super.key,
      required this.text,
      this.width,
      this.height = 50,
      this.fontsize = 14,
      required this.onTap,
      this.color,
      this.border = false,
      this.textcolor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border:
              Border.all(color: border! ? Colors.black : Colors.transparent),
          color: color ?? AppColor.primaryColor,
          borderRadius: BorderRadius.circular(
            AppRadius.radius,
          ),
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: AppStyle.bodyFont.copyWith(
              color: textcolor ?? AppColor.light,
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
