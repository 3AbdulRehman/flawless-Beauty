import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/image/t_rounded_image.dart';
import 'package:flawless_beauty/common/styles/product/product_cards/product_card_horizental.dart';
import 'package:flawless_beauty/common/styles/shimmers/horizental_product_shimmer.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/shop/controller/category_controller.dart';
import 'package:flawless_beauty/shop/models/category/category_model.dart';
import 'package:flawless_beauty/shop/screen/all_products/all_products.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/cloud_helper_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                  width: double.infinity, imageUrl: '', applyImageRadius: true),
              const SizedBox(height: TSize.spaceBtwSections),

              /// Sub Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  /// Handler Loader, No Record ,OR Error Message
                  const loader = THorizentalProductShimmer();
                  final widget = CloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);

                  if (widget != null) return widget;

                  // Records Found!
                  final subCategories = snapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              /// Handler Loader, No Record ,OR Error Message
                              const loader = THorizentalProductShimmer();
                              final widget =
                                  CloudHelperFunctions.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);

                              if (widget != null) return widget;

                              // Records Found!
                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  /// Heading
                                  TSectionHeading(
                                    title: subCategory.name,
                                    onPressed: () => Get.to(
                                      () => AllProducts(
                                        title: subCategory.name,
                                        futureModel:
                                            controller.getCategoryProducts(
                                                categoryId: subCategory.id,
                                                limit: -1),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: TSize.spaceBtwItems / 2),

                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: TSize.spaceBtwItems,
                                            ),
                                        itemBuilder: (context, index) =>
                                            TProductCardHorizental(
                                              product: products[index],
                                            )),
                                  ),
                                ],
                              );
                            });
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
