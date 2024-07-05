
import 'package:flawless_beauty/common/styles/icons/t_circular_icon.dart';
import 'package:flawless_beauty/shop/controller/product/favourite_controller.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return  Obx(()=> TCircularIcon(
      icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart ,
      color: controller.isFavourite(productId) ? TColors.error : null,
      onPressed: ()=> controller.toggleFavouriteProduct(productId),
    ));
  }
}
