import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/screens/user_pannel/single_category_product.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../../models/product_model.dart';

class AllFlashSaleProductScreen extends StatefulWidget {
  const AllFlashSaleProductScreen({super.key});

  @override
  State<AllFlashSaleProductScreen> createState() =>
      _AllFlashSaleProductScreenState();
}

class _AllFlashSaleProductScreenState extends State<AllFlashSaleProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appStatusBarColor,
        title: const Text("Flash Sale"),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("products")
            .where('isSale', isEqualTo: true)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Text("No data");
          }
          if (snapshot.data != null) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 1,
                crossAxisCount: 2,
                childAspectRatio: .8,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                final productData = snapshot.data!.docs[index];
                ProductModel productmodel = ProductModel(
                  updatedOn: productData['updatedOn'],
                  createdOn: productData['createdOn'],
                  categoryName: productData['categoryName'],
                  productImg: productData['productImg'],
                  categoryId: productData['categoryId'],
                  productId: productData['productId'],
                  productName: productData['productName'],
                  deliveryTime: productData['deliveryTime'],
                  fullPrice: productData['fullPrice'],
                  salePrice: productData['salePrice'],
                  productDescription: productData['productDescription'],
                  isSale: productData['isSale'],
                );
                return Row(
                  children: [
                    InkWell(
                      onTap: () => Get.to(() => SingleCategoryProductScreen(
                            categoryId: productmodel.categoryId,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Container(
                          width: Get.width / 2.5,
                          height: Get.height / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: FillImageCard(
                            borderRadius: 18,
                            width: Get.width / 2.5,
                            heightImage: Get.height / 5,
                            imageProvider: CachedNetworkImageProvider(
                              productmodel.productImg[0],
                            ),
                            title: Text(
                              productmodel.categoryName,
                              style: const TextStyle(
                                color: AppConstant.appSecondryColor,
                                fontSize: 18,
                              ),
                            ),
                            // description: const Text(""),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
            // SizedBox(
            //   height: Get.height / 4,
            //   child: ListView.builder(
            //     itemCount: snapshot.data!.docs.length,
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,

            //   ),
            // );
          }
          return Container();
        },
      ),
    );
  }
}
