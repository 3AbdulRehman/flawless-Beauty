
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/appbar/tabbar.dart';
import 'package:flawless_beauty/common/styles/layout/grid_layout.dart';
import 'package:flawless_beauty/common/styles/product/product_cart/cart_menu_icon.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/Search_container.dart';
import 'package:flawless_beauty/shop/controller/category_controller.dart';
import 'package:flawless_beauty/shop/screen/brand/all_brands.dart';
import 'package:flawless_beauty/shop/screen/store/widget/category_tab.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';

import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/styles/brands/t_brand_card.dart';


class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        /// Appbar
        appBar: TAppBar(
          title: Text('Store',style: Theme.of(context).textTheme.headlineMedium),
          action: [
            TCartCounterIcon(onpressed: (){},
            )],
        ),
        body: NestedScrollView(
          /// Header
            headerSliverBuilder: (_, innerBoxIsScrolled){

          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelpFunction.isDarkMode(context) ? TColors.black : TColors.white,
              expandedHeight: 440,

              flexibleSpace:  Padding(
                  padding: const EdgeInsets.all(TSize.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children:  [
                    /// Search Bar
                    const SizedBox(height: TSize.defaultSpace),
                    const TSearchConatiner(text: 'Search in Store',showBackground: false,showBorder: true,padding: EdgeInsets.zero,),
                    const SizedBox(height: TSize.spaceBtwSections),

                    /// Feature Brands
                    TSectionHeading(title: "Feature Brands",onPressed: ()=> Get.to(()=>const AllBrandsScreen())),
                    const SizedBox(height: TSize.spaceBtwItems /1.5),

                  /// Grid Grid
                  TGridLayout(
                      itemCount: 4,mainAxisExtent: 80, itemBuilder: (_,index){
                    return   const TBrandCard(showBorder: false);

                  }
                  ),

                  ],
                ),
              ),
              /// Tabs
              bottom:  TTabBar(tabs: categories.map((category)=> Tab(child: Text(category.name))).toList(),


               /* tabs: [
                  Tab(child: Text("Cosmetic"),),
                  Tab(child: Text("Natural Products"),),
                  Tab(child: Text("Hair shampoo"),),
                  Tab(child: Text("Face Cleaner"),),
                  Tab(child: Text("Sop"),),
                ],*/
              ),
            ),
          ];
        },
            ///Body
            body: TabBarView(
              children: categories.map((category) => TCategoryTab(category: category,)).toList()
            )
               /*const TabBarView(
                children: [
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                ]
            ),*/
        ),
      ),
    );
  }
}



