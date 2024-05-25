import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/size.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///DropDown Button
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity'].map((option) => DropdownMenuItem(value: option,child: Text(option))).toList(),
        ),
        const SizedBox(height: TSize.spaceBtwSections),

        /// Products
        TGridLayout(itemCount: 4, itemBuilder: (_,index)=>  TProductCardVertical(product: ProductModel.empty(),))
      ],
    );
  }
}
