import 'dart:convert';

import 'package:flawless_beauty/data/repositories/product/product_repository.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/utils/local_storage/storage_utility.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instace => Get.find();

  // variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourite();
  }

  // Methode to Initialize favourites by reading from storage
  Future<void> initFavourite() async {
    final json = TLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouriteToStorage();
      TLoader.customToast(message: 'Product has been added to the Wishlist');
    } else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouriteToStorage();
      favourites.refresh();
      TLoader.customToast(
          message: 'Product has been removed from the wishlist');
    }
  }

  void saveFavouriteToStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().writeData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favourites.keys.toList());
  }
}
