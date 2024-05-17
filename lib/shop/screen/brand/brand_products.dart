import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/brands/t_brand_card.dart';
import 'package:flawless_beauty/common/styles/product/sortable/sortable_products.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Faiza Product'),),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              TBrandCard(showBorder: true),
              SizedBox(height: TSize.spaceBtwSections),

              TSortableProducts(),

            ],
          ),
        ),
      ),
    );
  }
}
