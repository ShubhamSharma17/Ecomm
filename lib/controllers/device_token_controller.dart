// ignore_for_file: file_names
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class DeviceTokenController extends GetxController {
  String? deviceToken;
  @override
  onInit() {
    super.onInit();
    getDeviceTokenMethod();
  }

  Future<void> getDeviceTokenMethod() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      deviceToken = token;
      update();
    } on FirebaseAuthException catch (error) {
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
