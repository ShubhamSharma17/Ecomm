import 'package:e_comm/screens/auth/sign_up_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
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
                child: const TextField(
                  decoration: InputDecoration(
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
                    hintText: "Password",
                    labelText: "Enter Password",
                    prefixIcon: Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 100),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                alignment: Alignment.centerRight,
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppConstant.appTextColor,
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
                onPressed: () {},
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
