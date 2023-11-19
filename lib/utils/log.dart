import 'dart:developer';
import 'package:flutter/foundation.dart';

kLog(dynamic text) {
  if (kDebugMode) {
    log(text.toString());
  }
}
