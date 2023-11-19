import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raft/config/app_dimensions.dart';
import 'package:raft/features/home/screens/home_screen.dart';
import 'package:raft/utils/custom_button.dart';
import 'package:raft/utils/custom_textfield.dart';
import 'package:raft/utils/dialog_loader.dart';
import 'package:raft/utils/log.dart';
import 'package:raft/utils/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/app_color.dart';
import '../../../config/app_constants.dart';
import '../../../config/app_fonts_style.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isRegister = false;
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
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
              'Email',
              style: AppStyle.subFont.copyWith(
                color: AppColor.hintColor,
              ),
            ),
            CustomTextfield(
              validator: (p0) {
                if (p0.toString().isEmpty) {
                  return 'Email cannot be empty';
                } else {
                  return null;
                }
              },
              controller: emailCtrl,
              height: 50,
            ),
            AppSpacer().spacerH20,
            Text(
              'Password',
              style: AppStyle.subFont.copyWith(
                color: AppColor.hintColor,
              ),
            ),
            AppSpacer().spacerH10,
            CustomTextfield(
              validator: (p0) {
                if (p0.toString().isEmpty) {
                  return 'Password cannot be empty';
                } else {
                  return null;
                }
              },
              controller: passwordCtrl,
              height: 50,
            ),
            AppSpacer().spacerH20,
            CustomButton(
                text: isRegister ? 'Register' : 'Log in',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    showLoader(context);
                    if (isRegister) {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailCtrl.text,
                          password: passwordCtrl.text,
                        )
                            .then((value) async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('id', value.user!.uid);
                          if (!mounted) return;
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                        });
                      } on FirebaseAuthException catch (e) {
                        Navigator.pop(context);
                        toast(e.code);
                      } catch (e) {
                        Navigator.pop(context);
                        kLog(e);
                        toast(e.toString());
                      }
                    } else {
                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: emailCtrl.text.trim(),
                          password: passwordCtrl.text,
                        )
                            .then((value) async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('id', value.user!.uid);
                          if (!mounted) return;
                          Navigator.pop(context);

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                        });
                      } on FirebaseAuthException catch (e) {
                        Navigator.pop(context);
                        toast(e.code);
                      } catch (e) {
                        Navigator.pop(context);

                        kLog(e);
                        toast(e.toString());
                      }
                    }
                  }
                }),
            AppSpacer().spacerH20,
            if (!isRegister) ...[
              InkWell(
                onTap: () {
                  emailCtrl.clear();
                  passwordCtrl.clear();
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
      ),
    );
  }
}
