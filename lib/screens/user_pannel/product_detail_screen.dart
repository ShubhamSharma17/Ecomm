import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/models/product_model.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetailScreen({
    super.key,
    required this.productModel,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        backgroundColor: AppConstant.appStatusBarColor,
      ),
      body: SizedBox(
          child: Column(
        children: [
          CarouselSlider(
            items: widget.productModel.productImg
                .map(
                  (banners) => ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: banners,
                      fit: BoxFit.cover,
                      width: Get.width - 20,
                      placeholder: (context, url) => const ColoredBox(
                        color: AppConstant.whiteColor,
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              // aspectRatio: 2.5,
              viewportFraction: 1,
            ),
          ),
          SizedBox(height: Get.height / 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              color: AppConstant.appStatusBarColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.productModel.productName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Rs ",
                              style: TextStyle(color: AppConstant.black),
                            ),
                            widget.productModel.isSale == true &&
                                    widget.productModel.salePrice != ""
                                ? Text(
                                    widget.productModel.salePrice,
                                    style: const TextStyle(
                                        color: AppConstant.green),
                                  )
                                : Text(
                                    widget.productModel.fullPrice,
                                    style: const TextStyle(
                                        color: AppConstant.green),
                                  ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height / 60),
                    Text(
                      widget.productModel.categoryName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: Get.height / 60),
                    Text(
                        "Description: ${widget.productModel.productDescription}"),
                    SizedBox(height: Get.height / 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppConstant.appSecondryColor)),
                          icon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.shopping_bag,
                                color: AppConstant.whiteColor,
                              ),
                              SizedBox(width: Get.width / 50),
                              const Text(
                                "Add to cart",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppConstant.whiteColor),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(width: Get.width / 60),
                        IconButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppConstant.appSecondryColor)),
                          icon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                CupertinoIcons.share_up,
                                color: AppConstant.whiteColor,
                              ),
                              SizedBox(width: Get.width / 50),
                              const Text(
                                "Share",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppConstant.whiteColor),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
