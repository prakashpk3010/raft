import 'package:flutter/material.dart';
import '../config/app_color.dart';

///Loads when getting data from the server.
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

///Loads when getting data from the server.
///You can just use pop to close this loader.
showLoader(BuildContext context) {
  showDialog(
      barrierColor: AppColor.light.withOpacity(0.5),
      context: context,
      builder: (context) {
        return const DialogLoader();
      });
}
