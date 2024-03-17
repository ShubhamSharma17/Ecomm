import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/product_model.dart';
import 'package:e_comm/screens/user_pannel/product_detail_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection("products")
          .where("isSale", isEqualTo: true)
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
          return SizedBox(
            height: Get.height / 4,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
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
                return InkWell(
                  onTap: () => Get.to(
                      () => ProductDetailScreen(productModel: productmodel)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: FillImageCard(
                        width: Get.width / 3,
                        heightImage: Get.height / 10,
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
                        description: Text(
                          productmodel.productDescription,
                          overflow: TextOverflow.ellipsis,
                        ),
                        footer: Row(
                          children: [
                            Text(
                              "Rs ${productmodel.salePrice}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppConstant.green,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              productmodel.fullPrice,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: AppConstant.red,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
