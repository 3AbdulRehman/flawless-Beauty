import 'dart:ffi';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/circular_container.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/primary_header_Container.dart';
import 'package:flawless_beauty/shop/screen/home/widget/home_appbar.dart';
import 'package:flawless_beauty/shop/screen/home/widget/home_categories.dart';
import 'package:flawless_beauty/shop/screen/home/widget/promo_slider.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flawless_beauty/utils/device/device_utills.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/styles/image/t_rounded_image.dart';
import '../../../common/styles/image_Text_widget/vertical_image_text.dart';
import '../../../common/styles/layout/grid_layout.dart';
import '../../../common/styles/product/product_cards/product_card_vertical.dart';
import '../../../common/styles/text/section_heading.dart';
import '../../../common/styles/widget_login_signuo/Custom_shap/Conatiners/Search_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                )
              ],
            )),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace/3),
              child: Column(
                children: [
                  /// Promo Slider
                  const TPromoSlider(banners: [TImage.bannerImage1, TImage.bannerImage2,TImage.bannerImage3],),
                  const SizedBox(height: TSize.spaceBtwSections),

                  ///Heading
                  TSectionHeading(title: 'Popular Products',onPressed: (){}),
                  const SizedBox(height: TSize.spaceBtwItems),

                  /// Popular Products
                  TGridLayout(itemCount: 2, itemBuilder: (_, index) => const TProductCardVertical(),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
