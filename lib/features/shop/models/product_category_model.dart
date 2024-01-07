import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String productId, categoryId;

  ProductCategoryModel({required this.productId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {'brandId': productId, 'categoryId': categoryId};
  }

  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(
        productId: data['brandId'], categoryId: data['categoryId']);
  }
}
