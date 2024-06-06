import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/shimmers/vertical_product_shimmer.dart';
import 'package:flawless_beauty/shop/controller/all_products_controller.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/product/sortable/sortable_products.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureModel});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
        appBar: TAppBar(title: Text(title,), showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: FutureBuilder(
                future: futureModel ?? controller.fetchProductsByQuery(query),
                builder: (context, snapshot) {
                  // Check the state of the FutureBuilder snapshot
                 const  loader = TVerticalProductShimmer();
                final widget = CloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

                // Return appropriate widget based on snapshot state
                 if(widget !=null) return widget;

                 // Product Found!
                 final products = snapshot.data!;
                  return  TSortableProducts(products: products,);
                }),
          ),
        ));
  }
}
