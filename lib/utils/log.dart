import 'dart:developer';
import 'package:flutter/foundation.dart';

///Logs data only on debug mode,
///dynamic data printed no need to convert objects to string.
kLog(dynamic text) {
  if (kDebugMode) {
    log(text.toString());
  }
}
