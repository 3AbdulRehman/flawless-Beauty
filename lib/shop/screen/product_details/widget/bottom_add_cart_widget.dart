import 'package:flawless_beauty/common/styles/icons/t_circular_icon.dart';
import 'package:flawless_beauty/shop/controller/product/cart_controller..dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddCart extends StatelessWidget {
  const TBottomAddCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelpFunction.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSize.defaultSpace, vertical: TSize.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkGrey : TColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSize.cardRadiusLg),
            topRight: Radius.circular(TSize.cardRadiusLg),
          )),
      child: Obx(
        ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
            ()=>Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   TCircularIcon(
                      icon: Iconsax.minus,
                      backgroundColor: TColors.darkGrey,
                      width: 40,
                      height: 40,
                      color: TColors.white,
                     onPressed: ()=> controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value -=1 ,
                    ),
                  const SizedBox(width: TSize.spaceBtwItems),
                  Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(width: TSize.spaceBtwItems),
                   TCircularIcon(
                      icon: Iconsax.add,
                      backgroundColor: TColors.black,
                      width: 40,
                      height: 40,
                      color: TColors.white,
                    onPressed: ()=> controller.productQuantityInCart.value += 1,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(TSize.md),
                    backgroundColor: TColors.black,
                    side: const BorderSide(color: TColors.black)),
                onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
                child: const Text('Add to Cart',))
          ],
        ),
      ),
    );
  }
}
