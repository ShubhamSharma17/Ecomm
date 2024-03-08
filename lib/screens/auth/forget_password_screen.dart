import 'package:e_comm/controllers/forget_password_controller.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());
  TextEditingController emailController = TextEditingController();
  void forgetPassword() async {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Enter all details..",
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppConstant.appTextColor,
        backgroundColor: AppConstant.appSecondryColor,
      );
    } else {
      forgetPasswordController.forgetPasswordMethod(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forget Password",
          style: TextStyle(
            color: AppConstant.whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppConstant.appSecondryColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              Container(
                height: Get.height / 2,
                width: Get.width,
                color: AppConstant.appSecondryColor,
                child: Lottie.asset("assets/images/splash.json"),
              ),
              SizedBox(height: Get.height / 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    hintText: "Email",
                    labelText: "Enter Email",
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 50),
              SizedBox(height: Get.height / 100),
              IconButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppConstant.appMainColor)),
                icon: const Text(
                  "Forget",
                  style: TextStyle(fontSize: 16, color: AppConstant.whiteColor),
                ),
                onPressed: () {
                  forgetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
