import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/categories_model.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
          return Container(
            height: Get.height / 4,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                CategoriesModel categoriesModel = CategoriesModel(
                    updatedOn: DateTime.now(),
                    createdOn: DateTime.now(),
                    categoryName: snapshot.data!.docs[index]['categoryName'],
                    categoryImg: snapshot.data!.docs[index]['categoryImg'],
                    categoryId: snapshot.data!.docs[index]['categoryId']);
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: FillImageCard(
                          width: Get.width / 3,
                          heightImage: Get.height / 10,
                          imageProvider: CachedNetworkImageProvider(
                              categoriesModel.categoryImg),
                          title: Text(
                            categoriesModel.categoryName,
                            style: const TextStyle(
                              color: AppConstant.appSecondryColor,
                              fontSize: 18,
                            ),
                          ),
                          description: const Text(""),
                        ),
                      ),
                    ),
                  ],
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
