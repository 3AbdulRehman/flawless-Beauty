import 'package:flawless_beauty/shop/controller/product/cart_controller..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/product/product_cart/add_remove_button.dart';
import '../../../../common/styles/product/product_cart/cart_item.dart';
import '../../../../common/styles/text/product_price_text.dart';
import '../../../../utils/constants/size.dart';

class TCartItems extends StatelessWidget {
  const  TCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: TSize.spaceBtwSections),
          itemCount: controller.cartItems.length,
          itemBuilder: (_, index) => Obx(() {
                final item = controller.cartItems[index];
                return Column(
                  children: [
                    /// Cart Item
                    TCartItem(cartItem: item,),

                    if (showAddRemoveButton)const SizedBox(height: TSize.spaceBtwItems),

                    /// Add Remove Button Row with Total Price
                    if (showAddRemoveButton)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              /// Extra Space
                              const SizedBox(width: 70),

                              /// Add Remove Button
                              TProductQuantityWithAddRemoveButton(
                                quantity: item.quantity,
                                add: () => controller.addOneToCart(item),
                                remove: () => controller.removeOneFromCart(item),
                              ),
                            ],
                          ),

                          /// Product Total Price
                          TProductPriceText(
                              price: (item.price * item.quantity).toStringAsFixed(1)),
                        ],
                      )
                  ],
                );
              })),
    );
  }
}
