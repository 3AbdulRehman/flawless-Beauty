import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/text/product_price_text.dart';
import 'package:flawless_beauty/common/styles/text/product_title_text.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/shop/controller/product/variation_controller.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/chips/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
        ()=> Column(
          children: [
            /// Selected Attribute Pricing & Description
            /// Display variation price and stock when save variation is selected
            if (controller.selectedVariation.value.id.isNotEmpty)
              TRoundedContainer(
                padding: const EdgeInsets.all(TSize.md),
                backgroundColor: dark ? TColors.darkGrey : TColors.grey,
                child: Column(
                  children: [
                    /// Title , Price and Stock Status

                    Row(
                      children: [
                        const TSectionHeading(
                            title: 'Variation', showActionButton: false),
                        const SizedBox(width: TSize.spaceBtwItems),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const ProductTitleText(
                                    title: 'Price : ', smallSize: true),

                                /// Actual Price
                                if(controller.selectedVariation.value.salePrice >0 )
                                Text(
                                  '\RS${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration: TextDecoration.lineThrough),
                                ),
                                const SizedBox(width: TSize.spaceBtwItems),

                                /// Sales Price
                                 TProductPriceText(price: controller.getVariationPrice()),
                              ],
                            ),

                            /// Stck
                            Row(
                              children: [
                                const ProductTitleText(
                                    title: 'Stock : ', smallSize: true),
                                Text(controller.variationStockStatus.value,
                                    style: Theme.of(context).textTheme.titleMedium),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// Variation Description
                     ProductTitleText(
                      title: controller.selectedVariation.value.description ?? '',
                      smallSize: true,
                      maxLines: 4,
                    )
                  ],
                ),
              ),
            const SizedBox(height: TSize.spaceBtwItems),

            /// Attributes
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: product.productAttributes!
                  .map(
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSize.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected =
                                  controller.selectedAttributes[attribute.name] ==
                                      attributeValue;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!, attribute.name!)
                                  .contains(attributeValue);

                              return TChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null);
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  )
                  .toList(),
            )
          ],
          ),
    );
  }
}
