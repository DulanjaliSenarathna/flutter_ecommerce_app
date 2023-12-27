class BrandModel {
  String id, name, image;
  bool? isFeatured;
  int? productsCount;

  BrandModel(
      {required this.id,
      required this.name,
      required this.image,
      this.isFeatured,
      this.productsCount});

  // Empty helper function
  static BrandModel empty() => BrandModel(id: '', name: '', image: '');

  // Convert model to json structure so that you can store data in firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured
    };
  }

  // Map json oriented document snapshot from firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '');
  }
}
