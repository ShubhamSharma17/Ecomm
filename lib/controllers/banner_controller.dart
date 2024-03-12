import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../utils/app_constant.dart';

class BannerController extends GetxController {
  RxList<String> bannerList = RxList([]);

  @override
  void onInit() {
    getBannerUrl();
    super.onInit();
  }

  Future<void> getBannerUrl() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("banners").get();
    if (snapshot.docs.isNotEmpty) {
      bannerList.value =
          snapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
    }

    try {} on FirebaseException catch (error) {
      Get.snackbar(
        "Error",
        error.code.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppConstant.appTextColor,
        backgroundColor: AppConstant.appSecondryColor,
      );
    }
  }
}
