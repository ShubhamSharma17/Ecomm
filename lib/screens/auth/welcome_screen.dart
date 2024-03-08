import 'package:e_comm/screens/auth/sign_in_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/google_sign_in_controller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  GoogleSignInController googleSignInController =
      Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondryColor,
        title: const Text(
          "Welcome To Ecomm",
          style: TextStyle(
            color: AppConstant.whiteColor,
            fontSize: 23,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
              color: AppConstant.appSecondryColor,
              child: Lottie.asset("assets/images/splash.json"),
            ),
            const SizedBox(
              child: Text(
                "Welcome Shopping",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: Get.height / 15),
            IconButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppConstant.appMainColor)),
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/google.png",
                    height: Get.height / 25,
                  ),
                  SizedBox(width: Get.width / 50),
                  const Text(
                    "Sign in with Google",
                    style:
                        TextStyle(fontSize: 18, color: AppConstant.whiteColor),
                  ),
                ],
              ),
              onPressed: () {
                googleSignInController.singInWithGoogle();
              },
            ),
            SizedBox(
              height: Get.height / 50,
            ),
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppConstant.appMainColor)),
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.mail,
                    color: AppConstant.whiteColor,
                  ),
                  SizedBox(width: Get.width / 50),
                  const Text(
                    "Sign in with Email",
                    style:
                        TextStyle(fontSize: 18, color: AppConstant.whiteColor),
                  ),
                ],
              ),
              onPressed: () {
                Get.to(() => const SignInScreen());
              },
            ),
          ],
        )),
      ),
    );
  }
}
