
import 'package:flawless_beauty/common/styles/shimmers/shimmer_loader.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 110,)),
            SizedBox(width: TSize.spaceBtwItems),
            Expanded(child: TShimmerEffect(width: 150, height: 110,)),
            SizedBox(width: TSize.spaceBtwItems),
            Expanded(child: TShimmerEffect(width: 150, height: 110,)),
          ],
        ),
      ],
    );
  }
}
