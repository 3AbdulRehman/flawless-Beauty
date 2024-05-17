import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/brands/t_brand_card.dart';
import 'package:flawless_beauty/common/styles/layout/grid_layout.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/shop/screen/brand/brand_products.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(title: Text('Brand'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(title: 'Brand',showActionButton: true,),
              const SizedBox(height: TSize.spaceBtwItems),

              ///Brands
              TGridLayout(itemCount: 10,mainAxisExtent: 80, itemBuilder: (context,index)=>  TBrandCard(showBorder: true,onTap: ()=> Get.to(()=>const BrandProducts())))
            ],
          ),
        ),
      ),
    );
  }
}
