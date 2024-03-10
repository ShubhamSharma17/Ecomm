import 'package:e_comm/screens/auth/welcome_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<bool> signout() async {
    try {
      // await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppConstant.appStatusBarColor,
      child: Wrap(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: Get.height / 20, horizontal: 10),
            child: const ListTile(
              title: Text("Shubham Sharma"),
              subtitle: Text("Shubham@gmail.com"),
              leading: CircleAvatar(
                backgroundColor: AppConstant.whiteColor,
                child: Text("S"),
              ),
            ),
          ),
          const Divider(
            indent: 10.0,
            endIndent: 10.0,
            thickness: 1.5,
            color: AppConstant.black,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              title: Text("Products"),
              leading: Icon(Icons.production_quantity_limits),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              title: Text("Order"),
              leading: Icon(Icons.list),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              title: Text("Contact"),
              leading: Icon(Icons.contact_page_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              onTap: () async {
                EasyLoading.show(status: "Please wait..");
                bool value = await signout();
                if (value) {
                  EasyLoading.dismiss();
                  Get.offAll(() => const WelcomeScreen());
                }
              },
              title: const Text("Log Out"),
              leading: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
