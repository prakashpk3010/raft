import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raft/config/app_dimensions.dart';
import 'package:raft/features/auth/screens/verify_otp.dart';
import 'package:raft/utils/custom_button.dart';
import 'package:raft/utils/custom_textfield.dart';
import 'package:raft/utils/log.dart';
import '../../../config/app_color.dart';
import '../../../config/app_constants.dart';
import '../../../config/app_fonts_style.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isRegister = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(
          AppPadding.screenPadding,
        ),
        children: [
          AppSpacer().spacerH50,
          AppSpacer().spacerH50,
          Icon(
            Icons.diversity_1_rounded,
            size: 50,
            color: AppColor.secondaryColor,
          ),
          Center(
            child: Text(
              AppConstants.appname,
              style: AppStyle.headingFont
                  .copyWith(fontSize: 16, color: AppColor.primaryColor),
            ),
          ),
          AppSpacer().spacerH50,
          Text(
            isRegister ? 'Hey! Welcome' : 'Hey! Welcome Back',
            style: AppStyle.bodyFont.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            isRegister ? 'Signup to Continue' : 'Log in to Continue',
            style: AppStyle.headingFont
                .copyWith(color: AppColor.primaryColor, fontSize: 25),
          ),
          AppSpacer().spacerH20,
          Text(
            'Mobile Number',
            style: AppStyle.subFont.copyWith(
              color: AppColor.hintColor,
            ),
          ),
          AppSpacer().spacerH10,
          CustomTextfield(
            formatters: [FilteringTextInputFormatter.digitsOnly],
            height: 50,
          ),
          AppSpacer().spacerH20,
          CustomButton(
              text: 'GET Otp',
              onTap: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: 'prakash3010k@gmail.com',
                    password: '123',
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    kLog('weakPassword');
                  } else if (e.code == 'email-alredy-in-use') {
                    kLog('already exist');
                  } else {
                    kLog(e.code);
                  }
                } catch (e) {
                  kLog(e);
                }
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const VerifyOtp(),
                //     ));
              }),
          AppSpacer().spacerH20,
          if (!isRegister) ...[
            InkWell(
              onTap: () {
                setState(() {
                  isRegister = true;
                });
              },
              child: Center(
                child: Text(
                  'I am New to ${AppConstants.appname}',
                  style: AppStyle.subFont.copyWith(
                    color: AppColor.secondaryColor,
                  ),
                ),
              ),
            ),
          ] else ...[
            InkWell(
              onTap: () {
                setState(() {
                  isRegister = false;
                });
              },
              child: Center(
                child: Text(
                  'I am a Existing User',
                  style: AppStyle.subFont.copyWith(
                    color: AppColor.secondaryColor,
                  ),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
