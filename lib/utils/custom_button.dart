import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/app_dimensions.dart';
import '../config/app_fonts_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double? fontsize;
  final VoidCallback onTap;
  const CustomButton(
      {super.key,
      required this.text,
      this.width,
      this.height = 50,
      this.fontsize = 14,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(
            AppRadius.radius,
          ),
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: AppStyle.bodyFont.copyWith(
              color: AppColor.light,
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
