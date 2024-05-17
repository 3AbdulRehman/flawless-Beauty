import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/size.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            const Icon(Iconsax.star5,size: 24,color: Colors.amber),
            const SizedBox(width: TSize.spaceBtwItems / 2),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: '5.0',style: Theme.of(context).textTheme.bodyLarge),
                      const TextSpan(text: '(199)'),
                    ]
                )
            )
          ],
        ),

        /// Share Button
        IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: TSize.IconMd))
      ],
    );
  }
}

