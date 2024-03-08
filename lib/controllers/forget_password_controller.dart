// ignore_for_file: file_names
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> forgetPasswordMethod(String email) async {
    try {
      EasyLoading.show(status: "Please wait...");
      _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "Request send Successfully",
        "Password resent link send to $email",
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppConstant.appTextColor,
        backgroundColor: AppConstant.appSecondryColor,
      );
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (error) {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        error.code.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppConstant.appTextColor,
        backgroundColor: AppConstant.appSecondryColor,
      );
    }
  }
}
