// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetUserDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getUserDataByUid(
      String uid) async {
    final QuerySnapshot snapshot =
        await _firestore.collection("user").where('uid', isEqualTo: uid).get();
    return snapshot.docs;
  }
}
