import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/layout/grid_layout.dart';
import 'package:flawless_beauty/common/styles/product/product_cart/cart_menu_icon.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/Search_container.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/enum.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../common/styles/image/t_circular_image.dart';
import '../../../common/styles/text/t_brand_text_with_verified_icon.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Store',style: Theme.of(context).textTheme.headlineMedium),
        action: [
          TCartCounterIcon(onpressed: (){},)
        ],
      ),
      body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled){
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
                  const TSearchConatiner(text: 'Search Bar',showBackground: false,showBorder: true,padding: EdgeInsets.zero,),
                  const SizedBox(height: TSize.defaultSpace),

                  /// Feature Brands
                  TSectionHeading(title: "Feature Brands",onPressed: (){}),
                  const SizedBox(height: TSize.spaceBtwItems /1.5),

                TGridLayout(itemCount: 4,mainAxisExtent: 80, itemBuilder: (_,index){
                  return   GestureDetector(
                    onTap: (){},
                    child:TRoundedContainer(
                      padding: const EdgeInsets.all(TSize.sm),
                      showBorder: true,
                      backgroundColor: Colors.transparent,
                      child: Row(
                        children: [
                          ///Icon
                          Flexible(
                            child: TCircularImage(image: TImage.brand1,
                              backgroundColor: Colors.transparent,
                              overlayColor: THelpFunction.isDarkMode(context) ? TColors.white :TColors.black  ,
                            ),
                          ),
                          const SizedBox(height: TSize.spaceBtwItems/2),

                          /// Text
                          Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TBrandTitleWithVerifiedIcon(title: 'Saloon Brand',brandTextSize: TextSizes.large),
                                  Text('256 Products',style: Theme.of(context).textTheme.labelMedium,)

                                ],
                              )

                          )

                        ],
                      ),
                    )
                    ,
                  );

                }
                )
                    
                ],
              ),
            ),
          )
        ];
      }, body: Container()
      ),
    );
  }
}

