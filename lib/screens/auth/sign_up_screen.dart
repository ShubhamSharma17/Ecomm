import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
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
              SizedBox(height: Get.height / 20),
              const Text(
                "Welcome to my World",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppConstant.appTextColor,
                ),
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
                    hintText: "Name",
                    labelText: "Enter Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
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
                    hintText: "City",
                    labelText: "Enter City",
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
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
                    hintText: "Email",
                    labelText: "Enter Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
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
                    prefixIcon: Icon(Icons.remove_red_eye_rounded),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 20),
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
              SizedBox(height: Get.height / 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        color: AppConstant.appTextColor, fontSize: 16),
                  ),
                  InkWell(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppConstant.appTextColor,
                          fontSize: 16),
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
