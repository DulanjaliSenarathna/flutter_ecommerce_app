import 'package:get/get.dart';
import 'package:t_store/data/repositories/brands/brand_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  // Load brands
  Future<void> getFeaturedBrands() async {
    try {
      // Start loader while loading brands
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snapp!', message: e.toString());
    } finally {
      // Stop loader
      isLoading.value = false;
    }
  }

  // Get brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snapppp!', message: e.toString());
      return [];
    }
  }

  // Get brand specific products from your data source
  Future<List<ProductModel>> getBrandProducts({required String brandId,int limit=-1}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId,limit: limit);
      return products;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
