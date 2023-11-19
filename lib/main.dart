import 'package:flutter/material.dart';
import 'package:raft/config/app_constants.dart';
import 'package:raft/config/app_theme.dart';
import 'features/auth/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appname,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: SplashScreen(title: AppConstants.appname),
    );
  }
}
