import 'package:flawless_beauty/admin_panel/add_product/add_product_model.dart';
import 'package:flawless_beauty/admin_panel/add_product/add_product_repository.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/utils/constants/enum.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/product/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  var products = <AddProductModel>[].obs;
  final AddProductRepository _repository = AddProductRepository();

  TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  //
  var filteredProducts = <AddProductModel>[].obs; // Add this line

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
    featuredProducts();
    print(fetchProducts());
    searchQuery.listen((query) => filterProducts(query)); // Add this line
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      products.value = await _repository.fetchProducts();
      filteredProducts.value = products; // Add this line
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // search Functionality
  void filterProducts(String query) {
    // Add this method
    if (query.isEmpty) {
      filteredProducts.value = products;
    } else {
      filteredProducts.value = products.where((product) {
        return product.productName
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            product.brandName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  void fetchFeaturedProducts() async {
    try {
      // show loading while loading products
      isLoading.value = true;

      // Fetch Product
      final products = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get Products based on the Brand
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch Product
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Get the Product price or Price range for variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if no variation exist , return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // Calculate the smallest and largest Price among variation
      for (var variation in product.productVariations!) {
        // Determine the price to consider (Sale Price if Available, Otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //  Update smallest and largest price
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      // if smallest and largest Price are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // Otherwise, return a price range
        return '$smallestPrice - RS$largestPrice';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // -- Check Product Stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
