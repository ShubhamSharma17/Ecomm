// ignore_for_file: file_names
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isPasswordVisible = true.obs;

  Future<UserCredential?> signInMethod(String email, String password) async {
    try {
      EasyLoading.show(status: "Please wait...");
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (error) {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        error.code.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppConstant.appTextColor,
        backgroundColor: AppConstant.appSecondryColor,
      );
      return null;
    }
  }
}
