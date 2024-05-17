import 'package:flawless_beauty/shop/screen/product_reviews/widget/progess_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child:Text('4.8',style: Theme.of(context).textTheme.displayLarge),),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgessIndicator(text: '5', value: 1.0,) ,
              TRatingProgessIndicator(text: '4', value: 0.8,) ,
              TRatingProgessIndicator(text: '3', value: 0.6,) ,
              TRatingProgessIndicator(text: '2', value: 0.4,) ,
              TRatingProgessIndicator(text: '1', value: 0.2,) ,

            ],
          ),
        )
      ],
    );
  }
}
