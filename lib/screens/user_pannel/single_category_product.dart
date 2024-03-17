import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/product_model.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import 'product_detail_screen.dart';

class SingleCategoryProductScreen extends StatefulWidget {
  final String categoryId;
  const SingleCategoryProductScreen({
    super.key,
    required this.categoryId,
  });

  @override
  State<SingleCategoryProductScreen> createState() =>
      _SingleCategoryProductScreenState();
}

class _SingleCategoryProductScreenState
    extends State<SingleCategoryProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appStatusBarColor,
        title: const Text("Product"),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("products")
            .where('categoryId', isEqualTo: widget.categoryId)
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
            return const Center(child: Text("No data"));
          }
          if (snapshot.data != null) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                final productData = snapshot.data!.docs[index];
                ProductModel productModel = ProductModel(
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
                    isSale: productData['isSale']);
                return InkWell(
                  onTap: () => Get.to(
                      () => ProductDetailScreen(productModel: productModel)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: FillImageCard(
                        borderRadius: 18,
                        width: Get.width / 2.5,
                        heightImage: Get.height / 5,
                        imageProvider: CachedNetworkImageProvider(
                          productModel.productImg[0],
                        ),
                        title: Text(
                          productModel.productName,
                          style: const TextStyle(
                            color: AppConstant.appSecondryColor,
                            fontSize: 18,
                          ),
                        ),
                        description: Text(
                          productModel.productDescription,
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
