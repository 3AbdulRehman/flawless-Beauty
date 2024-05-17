import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/success_screen/success_screen.dart';
import 'package:flawless_beauty/navigation_menu.dart';
import 'package:flawless_beauty/shop/screen/cart/widget/cart_items.dart';
import 'package:flawless_beauty/shop/screen/checkout/widget/billing_address_section.dart';
import 'package:flawless_beauty/shop/screen/checkout/widget/billing_amount_section.dart';
import 'package:flawless_beauty/shop/screen/checkout/widget/billing_payment_section.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/product/product_cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return  Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text('Order Review',style: Theme.of(context).textTheme.headlineSmall),),
      body:  SingleChildScrollView(
        child: Padding(
            padding:const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Item in Carts
              const TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSize.spaceBtwSections),

              /// Coupon TextField
              const TCouponCode(),
              const SizedBox(height: TSize.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSize.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child:  const Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSize.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: TSize.spaceBtwItems),

                    /// Payment Methode
                    TBillingPaymentsSection(),
                    SizedBox(height: TSize.spaceBtwItems),

                    /// Address
                    TBillingAddressSection(),
                  ],
                ),
              )


            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(TColors.primary), // Change the color here
            ),

            onPressed: ()=> Get.to(()=>  SuccessScreen(
                image: TImage.successfullyPaymentIcon,
                title: 'Payment Success!',
                subTitle: 'Your item will be shipped soon',
                onPressed: ()=> Get.offAll(()=> const NavigationMenu())
            )),
            child: const Text('Checkout RS13000')),
      ),
    );
  }
}

