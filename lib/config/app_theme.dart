import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
    useMaterial3: true,
  );
}
