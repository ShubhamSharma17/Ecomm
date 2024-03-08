// ignore_for_file: unnecessary_null_comparison
import 'package:e_comm/controllers/get_user_data_controller.dart';
import 'package:e_comm/controllers/signIn_controller.dart';
import 'package:e_comm/screens/admin_pannel/admin_main_screen.dart';
import 'package:e_comm/screens/auth/forget_password_screen.dart';
import 'package:e_comm/screens/auth/sign_up_screen.dart';
import 'package:e_comm/screens/user_pannel/user_main_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInController signInController = Get.put(SignInController());
  GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void signIn() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Enter all details..",
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppConstant.appTextColor,
        backgroundColor: AppConstant.appSecondryColor,
      );
    } else {
      UserCredential? userCredential =
          await signInController.signInMethod(email, password);
      var userDate = await getUserDataController
          .getUserDataByUid(userCredential!.user!.uid);
      if (userCredential != null) {
        if (userCredential.user!.emailVerified) {
          if (userDate[0]['isAdmin'] == true) {
            Get.snackbar(
              "Success Admin Login",
              "Login successfully..",
              snackPosition: SnackPosition.BOTTOM,
              colorText: AppConstant.appTextColor,
              backgroundColor: AppConstant.appSecondryColor,
            );
            Get.offAll(() => const AdminMainScreen());
          } else {
            Get.snackbar(
              "Success user Login",
              "Login successfully..",
              snackPosition: SnackPosition.BOTTOM,
              colorText: AppConstant.appTextColor,
              backgroundColor: AppConstant.appSecondryColor,
            );
            Get.offAll(() => const UserMainScreen());
          }
        } else {
          Get.snackbar(
            "Error",
            "Please verify email befor login..",
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppConstant.appTextColor,
            backgroundColor: AppConstant.appSecondryColor,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Please try again later..",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppConstant.appTextColor,
          backgroundColor: AppConstant.appSecondryColor,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign In",
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
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  child: Obx(
                    () => TextField(
                      controller: passwordController,
                      obscureText: signInController.isPasswordVisible.value,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        hintText: "Password",
                        labelText: "Enter Password",
                        prefixIcon: GestureDetector(
                            onTap: () {
                              signInController.isPasswordVisible.toggle();
                            },
                            child: signInController.isPasswordVisible.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                      ),
                    ),
                  )),
              SizedBox(height: Get.height / 100),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgetPasswordScreen());
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppConstant.appTextColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 100),
              IconButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppConstant.appMainColor)),
                icon: const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 16, color: AppConstant.whiteColor),
                ),
                onPressed: () {
                  signIn();
                },
              ),
              SizedBox(height: Get.height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppConstant.appTextColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
