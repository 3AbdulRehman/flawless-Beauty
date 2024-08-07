import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/shop/controller/product/variation_controller.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/shop/screen/product_details/widget/bottom_add_cart_widget.dart';
import 'package:flawless_beauty/shop/screen/product_details/widget/product_attributes.dart';
import 'package:flawless_beauty/shop/screen/product_details/widget/product_detail_image_slider.dart';
import 'package:flawless_beauty/shop/screen/product_details/widget/product_meta_data.dart';
import 'package:flawless_beauty/shop/screen/product_details/widget/rating_share_widget.dart';
import 'package:flawless_beauty/shop/screen/product_reviews/product_reviews.dart';
import 'package:flawless_beauty/utils/constants/enum.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return   Scaffold(
      bottomNavigationBar:  TBottomAddCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
             TProductImageSlider(product:product),
      
            /// Product Details
            Padding(
              padding: const EdgeInsets.only(right: TSize.defaultSpace,left: TSize.defaultSpace,bottom: TSize.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Shares
                  const TRatingAndShare(),
      
                  ///Price , Title , Stock , & Brand
                   TProductMetaData(product: product),

                  /// Attributes
                 if(product.productType == ProductType.variable.toString())  TProductAttributes(product: product,),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSize.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
                  const SizedBox(height: TSize.spaceBtwSections),

                  /// Description
                  const TSectionHeading(title: 'Description',showActionButton: false),
                   ReadMoreText(
                     product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSize.spaceBtwItems),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews(199)',showActionButton: false),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3,size: 18),onPressed: ()=> Get.to(()=> const ProductReviewsScreen())),

                    ],
                  ),

                  const SizedBox(height: TSize.spaceBtwSections),
      
                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }
}

