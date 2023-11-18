import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raft/config/app_dimensions.dart';

import '../config/app_color.dart';

class CustomTextfield extends StatefulWidget {
  final List<TextInputFormatter>? formatters;
  final String? hint;
  final TextEditingController? controller;
  const CustomTextfield(
      {super.key, this.hint = '', this.controller, this.formatters});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      height: 50,
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            AppRadius.radius,
          )),
      child: TextFormField(
        inputFormatters: widget.formatters,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        ),
        decoration: InputDecoration(
            hintMaxLines: 1,
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
