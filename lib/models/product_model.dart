class ProductModel {
  final dynamic updatedOn;
  final dynamic createdOn;
  final String categoryName;
  final List productImg;
  final String categoryId;
  final String productId;
  final String productName;
  final String deliveryTime;
  final String fullPrice;
  final String salePrice;
  final String productDescription;
  final bool isSale;

  ProductModel(
      {required this.updatedOn,
      required this.createdOn,
      required this.categoryName,
      required this.productImg,
      required this.categoryId,
      required this.productId,
      required this.productName,
      required this.deliveryTime,
      required this.fullPrice,
      required this.salePrice,
      required this.productDescription,
      required this.isSale});

  Map<String, dynamic> toMap() {
    return {
      'updatedOn': updatedOn,
      'createdOn': createdOn,
      'categoryName': categoryName,
      'categoryImg': productImg,
      'categoryId': categoryId,
      'isSale': isSale,
      'productDescription': productDescription,
      'salePrice': salePrice,
      'fullPrice': fullPrice,
      'deliveryTime': deliveryTime,
      'productName': productName,
      'productId': productId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      categoryId: json['categoryId'],
      productImg: json['categoryImg'],
      categoryName: json['categoryName'],
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
      productName: json['productName'],
      productId: json['productId'],
      deliveryTime: json['deliveryTime'],
      fullPrice: json['fullPrice'],
      salePrice: json['salePrice'],
      productDescription: json['productDescription'],
      isSale: json['isSale'],
    );
  }
}
