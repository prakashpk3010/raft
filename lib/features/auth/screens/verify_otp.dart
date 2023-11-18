import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:raft/features/home/screens/home_screen.dart';

import '../../../config/app_color.dart';
import '../../../config/app_dimensions.dart';
import '../../../config/app_fonts_style.dart';
import '../../../utils/custom_button.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Verify OTP',
          style: AppStyle.headingFont.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(
          AppPadding.screenPadding,
        ),
        children: [
          Center(
            child: Text(
              'Code send ot +91 9874562312',
              style: AppStyle.bodyFont.copyWith(),
            ),
          ),
          AppSpacer().spacerH10,
          Padding(
            padding: EdgeInsets.all(AppRadius.radius),
            child: PinCodeTextField(
              enableActiveFill: true,
              pinTheme: PinTheme(
                fieldHeight: 50,
                fieldWidth: 50,
                shape: PinCodeFieldShape.box,
                activeFillColor: AppColor.light,
                inactiveFillColor: AppColor.light,
                selectedFillColor: Colors.transparent,
                borderRadius: BorderRadius.circular(
                  AppRadius.radius,
                ),
              ),
              appContext: context,
              length: 4,
            ),
          ),
          AppSpacer().spacerH20,
          CustomButton(
              text: 'Verify Otp',
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false,
                );
              }),
        ],
      ),
    );
  }
}
