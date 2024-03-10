import 'package:e_comm/utils/app_constant.dart';
import 'package:e_comm/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appStatusBarColor,
        title: const Text("Admin Panel"),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
