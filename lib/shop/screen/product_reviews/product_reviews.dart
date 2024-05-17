
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/shop/screen/product_reviews/widget/rating_progess_indicator.dart';
import 'package:flawless_beauty/shop/screen/product_reviews/widget/user_review_card.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';

import '../../../common/styles/product/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      /// Appbar
      appBar: const TAppBar(title: Text('Reviews & Ratings'),),


      /// Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ratings and Reviews are verified and are from people who use  the same type of device that you use.'),
            const SizedBox(height: TSize.spaceBtwItems),

            ///Overall Product Ratings
            const TOverallProductRating(),
            const TRatingBarIndicator(rating: 3.5),
            Text('12,611',style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: TSize.spaceBtwSections),

            ///User Reviews List
            const UserReviewCard(),
            const UserReviewCard(),



          ],
        ),
      ),
    );
  }
}

