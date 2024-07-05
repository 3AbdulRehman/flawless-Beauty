

import 'package:flawless_beauty/common/styles/shimmers/shimmer_loader.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(width: 50, height: 50,radius: 50),
            SizedBox(width: TSize.spaceBtwItems),
            Column(
              children: [
                TShimmerEffect(width: 100, height: 15),
                SizedBox(height: TSize.spaceBtwItems /2),
                TShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
