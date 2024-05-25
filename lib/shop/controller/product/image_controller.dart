
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// Variable
  Rx<String> selectedProdudtImage = ''.obs;

  ///-- Get All Images from Product and Variation
  List<String> getAllProductImages(ProductModel product) {
    // Uses set to add unique Images only
    Set<String> images = {};

    // Load Thumbnail images
    images.add(product.thumbnail);

    // Assign Thumbnail as selected Image
    selectedProdudtImage.value = product.thumbnail;

    // Get all Images from the Product Model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get all images from product Model if not null
    if (product.productVariations != null || product.productVariations!.isNotEmpty) {
      images.addAll( product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// -- Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
        ()=> Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: TSize.defaultSpace * 2, horizontal: TSize.defaultSpace),
                child: CachedNetworkImage(imageUrl: image),
              ),
              const SizedBox(height: TSize.spaceBtwSections),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(onPressed: ()=> Get.back(), child: const Text('Close')),
                ),
              )

            ],
          ),

        ),

    );
  }
}
