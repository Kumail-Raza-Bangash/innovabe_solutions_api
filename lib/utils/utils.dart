import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';

class Utils {
  //Toast Message for APP
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.blackColor,
      textColor: AppColor.whiteColor,
      fontSize: 12,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  //snackbar
  static snackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColor.blackColor,
      colorText: AppColor.whiteColor,
    );
  }

  //
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
