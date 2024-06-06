import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/primary_header_Container.dart';
import 'package:flawless_beauty/shop/screen/all_products/all_products.dart';
import 'package:flawless_beauty/shop/screen/home/widget/home_appbar.dart';
import 'package:flawless_beauty/shop/screen/home/widget/home_categories.dart';
import 'package:flawless_beauty/shop/screen/home/widget/promo_slider.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/layout/grid_layout.dart';
import '../../../common/styles/product/product_cards/product_card_vertical.dart';
import '../../../common/styles/shimmers/vertical_product_shimmer.dart';
import '../../../common/styles/text/section_heading.dart';
import '../../../common/styles/widget_login_signuo/Custom_shap/Conatiners/Search_container.dart';
import '../../controller/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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
                            title: 'Popular Categories',
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
                      onPressed: () => Get.to(
                              () =>  AllProducts(
                                title: 'Popular Products',
                        //query: FirebaseFirestore.instance.collection('Products').where('IsFeatured',isEqualTo: true).limit(6),
                        futureModel: controller.fetchAllFeaturedProducts() ,
                      )
                      ),
                  ),
                  const SizedBox(height: TSize.spaceBtwItems),

                  /// Popular Products
                  Obx(() {
                    if (controller.isLoading.value) return const TVerticalProductShimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text("No Data Found!",
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
