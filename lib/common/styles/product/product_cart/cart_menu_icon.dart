import 'package:flawless_beauty/shop/controller/product/cart_controller..dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../shop/screen/cart/cart.dart';
import '../../../../utils/constants/constant.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterByColor,
    this.counterByTextColor,
    required Null Function() onpressed,
  });

  final Color? iconColor, counterByColor, counterByTextColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color:
                      counterByColor ?? (dark ? TColors.white : TColors.black),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Obx(
                  () => Text(
                    controller.noOfCartItem.value.toString(),
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: counterByTextColor ??
                            (dark ? TColors.black : TColors.white),
                        fontSizeFactor: 0.8),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
