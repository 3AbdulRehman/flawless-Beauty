import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/common/styles/shimmers/shimmer_loader.dart';
import 'package:flutter/material.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemcount = 6});

  final int itemcount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemcount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
              const SizedBox(width: TSize.spaceBtwItems),
          itemBuilder: (_, __) {
            return const Column(
              children: [
                // Image
                TShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(height: TSize.spaceBtwItems / 2),

                // Text
                TShimmerEffect(width: 55, height: 8),
              ],
            );
          }),
    );
  }
}
