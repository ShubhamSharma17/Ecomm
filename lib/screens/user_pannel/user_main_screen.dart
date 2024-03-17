import 'package:e_comm/screens/user_pannel/All_product_screen.dart';
import 'package:e_comm/screens/user_pannel/all_category_screen.dart';
import 'package:e_comm/screens/user_pannel/all_flash_sale_product_screen.dart';
import 'package:e_comm/screens/user_pannel/cart_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:e_comm/widgets/all_product_widget.dart';
import 'package:e_comm/widgets/banner_widget.dart';
import 'package:e_comm/widgets/category_widget.dart';
import 'package:e_comm/widgets/drawer_widget.dart';
import 'package:e_comm/widgets/flash_sale_widget.dart';
import 'package:e_comm/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({super.key});

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.appMainName),
        backgroundColor: AppConstant.appStatusBarColor,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => Get.to(() => const CartScreen()),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Text("Slid show"),
              const BannerWidget(),
              SizedBox(height: Get.height / 50),
              HeadingWidget(
                heading: "Categories",
                subHeading: "sub products",
                buttonName: "See More",
                onTap: () => Get.to(() => const AllCategoryScreen()),
              ),
              SizedBox(height: Get.height / 50),
              const CategoryWidget(),
              SizedBox(height: Get.height / 50),
              HeadingWidget(
                heading: "Flash Sale",
                subHeading: "sub products",
                buttonName: "See More",
                onTap: () => Get.to(() => const AllFlashSaleProductScreen()),
              ),
              SizedBox(height: Get.height / 50),
              const FlashSaleWidget(),
              SizedBox(height: Get.height / 50),
              HeadingWidget(
                heading: "All Products",
                subHeading: "sub products",
                buttonName: "See More",
                onTap: () => Get.to(() => const AllProductScreen()),
              ),
              SizedBox(height: Get.height / 50),
              const AllProductWidget()
            ],
          ),
        ),
      ),
    );
  }
}
