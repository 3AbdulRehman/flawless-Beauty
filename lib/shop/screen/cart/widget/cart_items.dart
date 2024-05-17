
import 'package:flutter/material.dart';

import '../../../../common/styles/product/product_cart/add_remove_button.dart';
import '../../../../common/styles/product/product_cart/cart_item.dart';
import '../../../../common/styles/text/product_price_text.dart';
import '../../../../utils/constants/size.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key,  this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
      const SizedBox(height: TSize.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) =>  Column(
        children: [
          /// Cart Item
          const TCartItem(),
          if(showAddRemoveButton) const SizedBox(height: TSize.spaceBtwItems),
          /// Add Remove Button Row with Total Price
          if(showAddRemoveButton)
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Extra Space
                  SizedBox(width: 70),

                  /// Add Remove Button
                  TProductQuantityWithAddRemoveButton(),
                ],
              ),

              /// Product Total Price
              TProductPriceText(price: '1300')
            ],
          )
        ],
      ),
    );
  }
}
