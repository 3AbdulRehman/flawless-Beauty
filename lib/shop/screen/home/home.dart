import 'package:flawless_beauty/common/styles/shimmers/vertical_product_shimmer.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/primary_header_Container.dart';
import 'package:flawless_beauty/shop/screen/home/widget/add_product_view.dart';
import 'package:flawless_beauty/shop/screen/home/widget/home_appbar.dart';
import 'package:flawless_beauty/shop/screen/home/widget/home_categories.dart';
import 'package:flawless_beauty/shop/screen/home/widget/promo_slider.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/styles/layout/grid_layout.dart';
import '../../../common/styles/text/section_heading.dart';
import '../../controller/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final dark = THelpFunction.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar  --
                  const THomeAppBar(),

                  const SizedBox(height: TSize.spaceBtwItems),

                  /// Search Bar
                  //TSearchConatiner(text: 'Search in Store '),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Iconsax.search_favorite,
                          color: TColors.white,
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color:
                                Colors.white, // White border color when enabled
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color:
                                Colors.white, // White border color when focused
                          ),
                        ),

                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal:
                                10.0), // Padding inside the TextFormField
                      ),
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        controller.searchQuery.value = value;
                      },
                    ),
                  ),
                  const SizedBox(height: TSize.spaceBtwItems),

                  /// Categories
                  const Padding(
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
                  const SizedBox(height: TSize.spaceBtwSections),
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
                    if (controller.isLoading.value)
                      return TVerticalProductShimmer();

                    if (controller.filteredProducts.isEmpty) {
                      return Center(
                          child: Text("No Data Found!",
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(
                      crossAxisCount: 2,
                      itemCount: controller.filteredProducts.length,
                      itemBuilder: (_, index) => AddProductView(
                          product: controller.filteredProducts[index]),
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
