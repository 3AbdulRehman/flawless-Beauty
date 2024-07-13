import 'package:flawless_beauty/common/styles/shimmers/vertical_product_shimmer.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/primary_header_Container.dart';
import 'package:flawless_beauty/shop/screen/home/widget/add_product_view.dart';
import 'package:flawless_beauty/shop/screen/home/widget/home_appbar.dart';
import 'package:flawless_beauty/shop/screen/home/widget/home_categories.dart';
import 'package:flawless_beauty/shop/screen/home/widget/promo_slider.dart';
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
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TSectionHeading(
                      title: 'Popular Products',
                      showActionButton: false,
                    ),
                  ),
                  const SizedBox(height: TSize.spaceBtwItems),
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
                      itemBuilder: (_, index) =>
                          AddProductView(product: controller.products[index]),
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
