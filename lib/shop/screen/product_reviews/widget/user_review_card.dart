 import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/product/ratings/rating_indicator.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
   const UserReviewCard({super.key});
 
   @override
   Widget build(BuildContext context) {
     final dark = THelpFunction.isDarkMode(context);
     return  Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
               children: [
                 const CircleAvatar(backgroundImage: AssetImage(TImage.userprofileImage)),
                 const SizedBox(width: TSize.spaceBtwItems),
                 Text('Faiza',style: Theme.of(context).textTheme.titleLarge),
               ],
             ),
             IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
           ],
         ),
         const SizedBox(height: TSize.spaceBtwItems),
         /// Reviews
          Row(
           children: [
             const TRatingBarIndicator(rating: 4),
             const SizedBox(width: TSize.spaceBtwItems),
             Text('01 Nov, 2023',style: Theme.of(context).textTheme.bodyMedium),
           ],
         ),
         const SizedBox(height: TSize.spaceBtwItems),
         const ReadMoreText('The user interface of the app is quite intuitive. I was able to navigate and purchase seamlessly. Great Job.',
           trimLines: 2,
           trimMode: TrimMode.Line,
           trimExpandedText: 'show less',
           trimCollapsedText: 'show more',
           moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
           lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
         ),
         const SizedBox(height: TSize.spaceBtwItems),

         /// Company Review
         TRoundedContainer(
           backgroundColor: dark ? TColors.darkGrey : TColors.grey,
            child: Padding( padding: const EdgeInsets.all(TSize.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('T`s Store',style: Theme.of(context).textTheme.titleMedium),
                      Text('2 Nov, 2024',style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                  const SizedBox(height: TSize.spaceBtwItems),
                  const ReadMoreText('The user interface of the app is quite intuitive. I was able to navigate and purchase seamlessly. Great Job.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'show less',
                    trimCollapsedText: 'show more',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                  ),
                ],
              ),
            ),
         ),
         const SizedBox(height: TSize.spaceBtwSections),



       ],

     );
   }
 }
 