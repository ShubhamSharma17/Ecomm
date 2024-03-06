// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:e_comm/screens/user_pannel/user_main_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Get.offAll(() => const UserMainScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appSecondryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                // width: MediaQuery.of(context).size.width,
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset("assets/images/splash.json"),
              ),
            ),
            Container(
              width: Get.width,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                AppConstant.appPoweredBy,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: AppConstant.appTextColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
