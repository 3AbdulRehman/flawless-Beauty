import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/brands/t_brand_card.dart';
import 'package:flawless_beauty/common/styles/product/sortable/sortable_products.dart';
import 'package:flawless_beauty/common/styles/shimmers/vertical_product_shimmer.dart';
import 'package:flawless_beauty/shop/controller/brand_controller.dart';
import 'package:flawless_beauty/shop/models/brand_model.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return  Scaffold(
      appBar:  TAppBar(title: Text(brand.name),),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              TBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSize.spaceBtwSections),

               FutureBuilder(
                 future: controller.getBrandProducts(brandId: brand.id),
                   builder: (context,snapshot) {

                   /// Handling loader , No Record, OR Error Message
                     const loader = TVerticalProductShimmer();
                     final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                     if(widget != null) return widget;

                     // Record Found!
                     final brandProducts = snapshot.data!;
                   return  TSortableProducts(products: brandProducts);
                   }
                   ),

            ],
          ),
        ),
      ),
    );
  }
}
