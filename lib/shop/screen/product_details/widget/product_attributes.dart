
import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/text/product_price_text.dart';
import 'package:flawless_beauty/common/styles/text/product_title_text.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';

import '../../../../common/styles/chips/choice_chip.dart';

class TProductAttribures extends StatelessWidget {
  const TProductAttribures({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSize.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              /// Title , Price and Stock Status

              Row(
                children: [
                  const TSectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: TSize.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(title: 'Price', smallSize: true),

                          /// Actual Price
                          Text('RS1500', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          const SizedBox(width: TSize.spaceBtwItems),

                          /// Sales Price
                          const TProductPriceText(price: '1300'),
                        ],
                      ),

                      /// Stck
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Stock', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const ProductTitleText(
                title:
                    'this is the Description of the Product and it can go upto max 4 line',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: TSize.spaceBtwItems),

        /// Attributs
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const TSectionHeading(title: 'Colors'),
            const SizedBox(height: TSize.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Blue', selected: true,onSelected: (value){}),
                TChoiceChip(text: 'Green', selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Red', selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Green', selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Pink', selected: false,onSelected: (value){}),

              ],
            )
          ],
        ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size'),
            const SizedBox(height: TSize.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Eu 34', selected: true,onSelected: (value){}),
                TChoiceChip(text: 'Eu 36', selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Eu 38', selected: false,onSelected: (value){}),

              ],
            )
          ],
        ),
      ],
    );
  }
}

