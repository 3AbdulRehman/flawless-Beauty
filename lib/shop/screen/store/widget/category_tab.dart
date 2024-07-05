import 'package:flawless_beauty/common/styles/layout/grid_layout.dart';
import 'package:flawless_beauty/common/styles/product/product_cards/product_card_vertical.dart';
import 'package:flawless_beauty/common/styles/shimmers/vertical_product_shimmer.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/shop/controller/category_controller.dart';
import 'package:flawless_beauty/shop/models/category/category_model.dart';
import 'package:flawless_beauty/shop/models/product_model.dart';
import 'package:flawless_beauty/shop/screen/all_products/all_products.dart';
import 'package:flawless_beauty/shop/screen/store/widget/category_brands.dart';
import 'package:flawless_beauty/utils/helper/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/brands/brand_showcase.dart';
import '../../../../utils/constants/image_String.dart';
import '../../../../utils/constants/size.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;
  

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// ---Brands
              CategoryBrands(category: category),


              const SizedBox(height: TSize.spaceBtwItems),

              ///  Products
              FutureBuilder(
                  future: controller.getCategoryProducts(categoryId: category.id),
                  builder: (context,snapshot){
                    print(category.name);

                    // Helper Function : Handle loader , No Record , OR Error
                    final response = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: const TVerticalProductShimmer());

                    if(response != null) return response;

                    // Record Found!
                    final products = snapshot.data!;


                    return Column(
                      children: [
                        TSectionHeading(title: 'You Might like', showActionButton: true, onPressed: ()=> Get.to(AllProducts(title: category.name,
                          futureModel: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                        ))),
                        TGridLayout(
                            itemCount: products.length,
                            itemBuilder: (_, index) =>  TProductCardVertical(product: products[index])),

                      ],
                    );
                  }
              ),
            ],
          ),
        )
      ],
    );
  }
}
