import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/navigation_menu.dart';
import 'package:flawless_beauty/shop/controller/product/cart_controller..dart';
import 'package:flawless_beauty/shop/screen/cart/widget/cart_items.dart';
import 'package:flawless_beauty/shop/screen/checkout/checkout.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/popups/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Obx(() {
        /// Nothing Found Widget
        final emptyWidget = TAnimationLoader(
          text: 'Whoops! Cart is Empty....',
          animation: TImage.cartAnimation,
          showAction: true,
          buttoncolor: TColors.dark,
          actionText: 'Let\s Fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSize.defaultSpace),

              ///-- Item in cart
              child: TCartItems(),
            ),
          );
        }
      }),

      /// Checkout Button

      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        TColors.primary), // Change the color here
                  ),
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Obx(() =>
                      Text('Checkout \RS ${controller.totalCartPrice.value}'))),
            ),
    );
  }
}
