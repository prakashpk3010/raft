import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raft/config/app_dimensions.dart';

import '../config/app_color.dart';

class CustomTextfield extends StatelessWidget {
  final List<TextInputFormatter>? formatters;
  final String? hint;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final int? maxLines;
  final double? height;
  final String? Function(String?)? validator;
  const CustomTextfield(
      {super.key,
      this.hint = '',
      this.controller,
      this.formatters,
      this.suffixIcon,
      this.maxLines = 1,
      this.height,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
        AppRadius.radius,
      )),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines ?? 1,
        inputFormatters: formatters,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        ),
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintMaxLines: 1,
            filled: true,
            fillColor: AppColor.primaryColor.withOpacity(0.1),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.radius),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.radius),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.radius),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.radius),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 0,
              ),
            )),
      ),
    );
  }
}
