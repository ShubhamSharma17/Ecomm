class CategoriesModel {
  final DateTime updatedOn;
  final DateTime createdOn;
  final String categoryName;
  final dynamic categoryImg;
  final dynamic categoryId;

  CategoriesModel({
    required this.updatedOn,
    required this.createdOn,
    required this.categoryName,
    required this.categoryImg,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'updatedOn': updatedOn,
      'createdOn': createdOn,
      'categoryName': categoryName,
      'categoryImg': categoryImg,
      'categoryId': categoryId,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> json) {
    return CategoriesModel(
      categoryId: json['categoryId'],
      categoryImg: json['categoryImg'],
      categoryName: json['categoryName'],
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
    );
  }
}
