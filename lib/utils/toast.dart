import 'package:fluttertoast/fluttertoast.dart';
import 'package:raft/config/app_color.dart';

///Plugin to show a toast message on screen Only for android, ios and Web platforms
toast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: AppColor.secondaryColor,
  );
}
