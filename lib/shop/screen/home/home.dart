import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/image/t_rounded_image.dart';
import 'package:flawless_beauty/common/styles/shadows.dart';
import 'package:flawless_beauty/common/styles/shimmers/vertical_product_shimmer.dart';
import 'package:flawless_beauty/common/styles/text/product_price_text.dart';
import 'package:flawless_beauty/common/styles/text/product_title_text.dart';
import 'package:flawless_beauty/common/styles/text/t_brand_text_with_verified_icon.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/primary_header_Container.dart';
import 'package:flawless_beauty/shop/screen/all_products/all_products.dart';
import 'package:flawless_beauty/shop/screen/home/widget/home_appbar.dart';
import 'package:flawless_beauty/shop/screen/home/widget/home_categories.dart';
import 'package:flawless_beauty/shop/screen/home/widget/promo_slider.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/layout/grid_layout.dart';
import '../../../common/styles/text/section_heading.dart';
import '../../../common/styles/widget_login_signuo/Custom_shap/Conatiners/Search_container.dart';
import '../../controller/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    final controller = Get.put(ProductController());
    print(controller.featuredProducts.length);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar  --
                  THomeAppBar(),

                  SizedBox(height: TSize.spaceBtwItems),

                  /// Search Bar
                  TSearchConatiner(text: 'Search in Store '),
                  SizedBox(height: TSize.spaceBtwItems),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSize.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        TSectionHeading(
                            title: 'Salon Expert Appoinment',
                            showActionButton: false,
                            textColor: Colors.white),

                        SizedBox(height: TSize.spaceBtwItems),

                        // Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSize.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace / 3),
              child: Column(
                children: [
                  /// Promo Slider
                  const TPromoSlider(),
                  const SizedBox(height: TSize.spaceBtwSections),

                  ///Heading
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProducts(
                          title: 'Popular Products',
                          //query: FirebaseFirestore.instance.collection('Products').where('IsFeatured',isEqualTo: true).limit(6),
                          futureModel: controller.fetchAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(height: TSize.spaceBtwItems),

                  /// Popular Products
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }
                    if (controller.products.isEmpty) {
                      return Center(
                          child: Text("No Data Found!",
                              style: Theme.of(context).textTheme.bodyMedium));
                    }

                    return TGridLayout(
                        itemCount: controller.products.length,
                        itemBuilder: (_, index) {
                          final product = controller.products[index];
                          return Container(
                            margin: const EdgeInsets.only(
                                bottom: TSize.spaceBtwItems),
                            child: Container(
                              width: 180,
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                boxShadow: [TShadowStyle.verticalProductShadow],
                                borderRadius: BorderRadius.circular(
                                    TSize.productImageRadius),
                                color: dark ? TColors.darkGrey : TColors.white,
                              ),
                              child: Column(
                                children: [
                                  TRoundedContainer(
                                    height: 180,
                                    width: 180,
                                    padding: const EdgeInsets.all(TSize.sm),
                                    backgroundColor:
                                        dark ? TColors.dark : TColors.light,
                                    child: Stack(
                                      children: [
                                        /// Thumbnail image
                                        Center(
                                          child: TRoundedImage(
                                              imageUrl: product.imageUrl,
                                              applyImageRadius: true,
                                              isNetworkImage: true),
                                        ),

                                        ///Scale Tage

                                        Positioned(
                                          top: 12,
                                          child: TRoundedContainer(
                                            radius: TSize.sm,
                                            backgroundColor: TColors.secondary
                                                .withOpacity(0.8),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: TSize.sm,
                                                vertical: TSize.xs),
                                            child: Text("Discount",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .apply(
                                                        color: TColors.black)),
                                          ),
                                        ),

                                        /// Favorite Icon Button
                                        Positioned(
                                          top: 10,
                                          right: 0,
                                          child: TRoundedContainer(
                                            radius: TSize.sm,
                                            backgroundColor:
                                                Colors.red.withOpacity(0.8),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: TSize.sm,
                                                vertical: TSize.xs),
                                            child: Text("Offer",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .apply(
                                                        color: TColors.black)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                      height: TSize.spaceBtwItems / 2),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: TSize.sm),

                                    /// only Reason to use the [SizeBox] here is to make Colum full Width
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ProductTitleText(
                                              title: product
                                                  .productName, // product.title
                                              smallSize: true),
                                          const SizedBox(
                                              height: TSize.spaceBtwItems / 2),
                                          Row(
                                            children: [
                                              TRoundedImage(
                                                  imageUrl: product.imageUrl,
                                                  height: 20,
                                                  borderRadius: 50,
                                                  applyImageRadius: true,
                                                  isNetworkImage: true),
                                              TBrandTitleWithVerifiedIcon(
                                                title: product.brandName,

                                                //product.brand!.name
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// Todo : Add Spacer() here to keep Height of each Box same in case 1 or 2 line of Heading
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// Price
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "RS${product.actualPrice.toString()}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .apply(
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                            ),
                                            TProductPriceText(
                                              price:
                                                  product.sellPrice.toString(),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
                  // Obx(() {
                  //   if (controller.isLoading.value)
                  //     return const TVerticalProductShimmer();
                  //   if (controller.featuredProducts.isEmpty) {
                  //     return Center(
                  //         child: Text("No Data Found!",
                  //             style: Theme.of(context).textTheme.bodyMedium));
                  //   }
                  //   return TGridLayout(
                  //     itemCount: controller.featuredProducts.length,
                  //     itemBuilder: (_, index) => TProductCardVertical(
                  //         product: controller.featuredProducts[index]),
                  //   );
                  // })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
