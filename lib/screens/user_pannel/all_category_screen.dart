import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/categories_model.dart';
import 'package:e_comm/screens/user_pannel/single_category_product.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appStatusBarColor,
        title: const Text("Categories"),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("categories").get(),
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
                CategoriesModel categoriesModel = CategoriesModel(
                    updatedOn: snapshot.data!.docs[index]['updatedOn'],
                    createdOn: snapshot.data!.docs[index]['createdOn'],
                    categoryName: snapshot.data!.docs[index]['categoryName'],
                    categoryImg: snapshot.data!.docs[index]['categoryImg'],
                    categoryId: snapshot.data!.docs[index]['categoryId']);
                return Row(
                  children: [
                    InkWell(
                      onTap: () => Get.to(() => SingleCategoryProductScreen(
                            categoryId: categoriesModel.categoryId,
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
                              categoriesModel.categoryImg,
                            ),
                            title: Text(
                              categoriesModel.categoryName,
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
