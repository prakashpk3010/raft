import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/app_dimensions.dart';
import '../config/app_fonts_style.dart';

class DialogLoader extends StatelessWidget {
  const DialogLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}

showLoader(BuildContext context) {
  showDialog(
      barrierColor: AppColor.light.withOpacity(0.5),
      context: context,
      builder: (context) {
        return DialogLoader();
      });
}
