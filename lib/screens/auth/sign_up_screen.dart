import 'package:e_comm/screens/auth/sign_in_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.put(SignUpController());
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signUP() async {
    String name = nameController.text.trim();
    String city = cityController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String userDeviceToken = '';

    if (name.isEmpty ||
        city.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Enter all details..",
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppConstant.appTextColor,
        backgroundColor: AppConstant.appSecondryColor,
      );
    } else {
      UserCredential? userCredential = await signUpController.signUpMethod(
          name, email, password, city, phone, userDeviceToken);

      if (userCredential != null) {
        Get.snackbar(
          "Verification email sent",
          "Please check your email",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppConstant.appTextColor,
          backgroundColor: AppConstant.appSecondryColor,
        );
        FirebaseAuth.instance.signOut();
        Get.offAll(() => const SignInScreen());
      }
    }
  }

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
                child: TextField(
                  controller: nameController,
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
                    hintText: "Name",
                    labelText: "Enter Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: TextField(
                  controller: cityController,
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
                    hintText: "City",
                    labelText: "Enter City",
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: TextField(
                  controller: phoneController,
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
                    hintText: "Phone",
                    labelText: "Enter Phone Number",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: TextField(
                  controller: emailController,
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
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              SizedBox(height: Get.height / 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                child: Obx(
                  () => TextField(
                    controller: passwordController,
                    obscureText: signUpController.isPasswordVisible.value,
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
                          signUpController.isPasswordVisible.toggle();
                        },
                        child: signUpController.isPasswordVisible.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
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
                  "Sign Up",
                  style: TextStyle(fontSize: 16, color: AppConstant.whiteColor),
                ),
                onPressed: () {
                  signUP();
                },
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
