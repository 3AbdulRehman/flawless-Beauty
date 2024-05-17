import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/shop/screen/cart/widget/cart_items.dart';
import 'package:flawless_beauty/shop/screen/checkout/checkout.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSize.defaultSpace),
        ///-- Item in cart
        child: TCartItems(),
      ),
      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(TColors.primary), // Change the color here
            ),

            onPressed: ()=> Get.to(()=> const CheckoutScreen()), child: const Text('Checkout RS13000')),
      ),
    );
  }
}
