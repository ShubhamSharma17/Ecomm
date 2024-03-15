import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/product_model.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class AllProductWidget extends StatefulWidget {
  const AllProductWidget({super.key});

  @override
  State<AllProductWidget> createState() => _AllProductWidgetState();
}

class _AllProductWidgetState extends State<AllProductWidget> {
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
          return GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 2,
              crossAxisCount: 2,
              childAspectRatio: .5,
              crossAxisSpacing: 1,
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                    child: Container(
                      width: Get.width / 2.3,
                      height: Get.height / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: FillImageCard(
                        borderRadius: 18,
                        // width: Get.width / 3,
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
                ],
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
