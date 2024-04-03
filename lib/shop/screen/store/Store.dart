import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/appbar/tabbar.dart';
import 'package:flawless_beauty/common/styles/layout/grid_layout.dart';
import 'package:flawless_beauty/common/styles/product/product_cart/cart_menu_icon.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/Search_container.dart';
import 'package:flawless_beauty/shop/screen/store/widget/category_tab.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/enum.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../../../common/styles/brands/brand_showcase.dart';
import '../../../common/styles/image/t_circular_image.dart';
import '../../../common/styles/brands/t_brand_card.dart';
import '../../../common/styles/text/t_brand_text_with_verified_icon.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        /// Appbar
        appBar: TAppBar(
          title: Text('Store',style: Theme.of(context).textTheme.headlineMedium),
          action: [TCartCounterIcon(onpressed: (){},)],
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
                    TSectionHeading(title: "Feature Brands",onPressed: (){}),
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
              bottom: const TTabBar(

                tabs: [
                  Tab(child: Text("Sports"),),
                  Tab(child: Text("Foriture"),),
                  Tab(child: Text("Electronic"),),
                  Tab(child: Text("Clouth"),),
                  Tab(child: Text("Cosmetic"),),

                ],
              ),
            ),
          ];
        },
            ///Body
            body:   const TabBarView(
                children: [
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                  TCategoryTab(),
                ]
            ),
        ),
      ),
    );
  }
}



