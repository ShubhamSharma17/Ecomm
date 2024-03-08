import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/controllers/device_token_controller.dart';
import 'package:e_comm/models/user_model.dart';
import 'package:e_comm/screens/user_pannel/user_main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> singInWithGoogle() async {
    DeviceTokenController deviceTokenController =
        Get.put(DeviceTokenController());
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        EasyLoading.show(status: "Please wait...");
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(oAuthCredential);

        final User? user = userCredential.user;

        if (user != null) {
          UserModel userModel = UserModel(
              uid: user.uid,
              name: user.displayName.toString(),
              email: user.email.toString(),
              phone: user.phoneNumber.toString(),
              userImage: user.photoURL.toString(),
              userDeviceToken: deviceTokenController.deviceToken.toString(),
              country: '',
              address: '',
              street: '',
              city: '',
              isAdmin: false,
              isActive: true,
              createdOn: DateTime.now());
          await FirebaseFirestore.instance
              .collection("user")
              .doc(user.uid)
              .set(userModel.toMap());

          EasyLoading.dismiss();
          Get.offAll(() => const UserMainScreen());
        }
      }
    } catch (error) {
      EasyLoading.dismiss();
      log(error.toString());
    }
  }
}
