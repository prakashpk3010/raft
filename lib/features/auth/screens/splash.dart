import 'package:flutter/material.dart';
import 'package:raft/config/app_color.dart';
import 'package:raft/config/app_constants.dart';
import 'package:raft/config/app_fonts_style.dart';
import 'package:raft/features/auth/screens/log_in.dart';
import 'package:raft/features/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance();
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        var id = prefs.getString('id') ?? '';
        if (id.isEmpty) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LogInScreen(),
              ));
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.diversity_1_rounded,
              size: 50,
              color: AppColor.secondaryColor,
            ),
            Text(
              AppConstants.appname,
              style: AppStyle.headingFont
                  .copyWith(fontSize: 16, color: AppColor.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
