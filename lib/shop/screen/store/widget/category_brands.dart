import 'package:flawless_beauty/common/styles/brands/brand_showcase.dart';
import 'package:flawless_beauty/common/styles/shimmers/boxes_shimmer.dart';
import 'package:flawless_beauty/common/styles/shimmers/list_tile_shimmer.dart';
import 'package:flawless_beauty/shop/controller/brand_controller.dart';
import 'package:flawless_beauty/shop/models/category/category_model.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return  FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context ,snapshot) {
          // Handle Loader, No Record , OR Error Message
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(height: TSize.spaceBtwItems),
              TBoxesShimmer(),
              SizedBox(height: TSize.spaceBtwItems)
            ],
          );
          final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
          if(widget != null) return widget;

          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_,index){
              final brand = brands[index];
              return FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id,limit: 3),
                  builder: (context,snapshot){
                  // Handle loader, No Record, OR Error Message
                    final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                    if(widget != null) return widget;

                    // Record Found!
                    final products = snapshot.data!;

                  return TBrandShowCase(brand: brand,images: products.map((e)=>e.thumbnail).toList());
                  }
                );
              }
          );

        }
    );
  }
}
