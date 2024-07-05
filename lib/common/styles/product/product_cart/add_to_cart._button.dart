import 'package:flawless_beauty/shop/controller/product/cart_controller..dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/shop/screen/product_details/product_detail.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/enum.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {

        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
        return Container(
            decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? TColors.primary : TColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(TSize.cardRadiusMd),
                bottomRight: Radius.circular(TSize.productImageRadius),
              ),
            ),
            child: SizedBox(
                width: TSize.IconXl * 1.2,
                height: TSize.IconXl * 1.2,
                child: productQuantityInCart > 0
                    ? Text(
                        productQuantityInCart.toString(),style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white),
                      )
                    : const Icon(Iconsax.add, color: TColors.white,)));
      }),
    );
  }
}
