import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/user_model.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isPasswordVisible = true.obs;

  Future<UserCredential?> signUpMethod(
    String name,
    String email,
    String password,
    String city,
    String phone,
    String userDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: "Please wait...");
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
        uid: userCredential.user!.uid,
        name: name,
        city: city,
        email: email,
        phone: phone,
        userImage: '',
        userDeviceToken: userDeviceToken,
        country: '',
        address: '',
        street: '',
        isAdmin: false,
        isActive: true,
        createdOn: DateTime.now(),
      );

      await _firestore
          .collection('user')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());

      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (error) {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        "$error",
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppConstant.appTextColor,
        backgroundColor: AppConstant.appSecondryColor,
      );
      return null;
    }
  }
}
