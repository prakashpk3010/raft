import 'package:fluttertoast/fluttertoast.dart';
import 'package:raft/config/app_color.dart';

toast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: AppColor.secondaryColor,
  );
}
