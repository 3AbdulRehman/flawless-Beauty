import 'package:flawless_beauty/common/styles/shimmers/category_shimmer.dart';
import 'package:flawless_beauty/shop/controller/category_controller.dart';
import 'package:flawless_beauty/shop/screen/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/image_Text_widget/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return const CategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text("No Data Found!",style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            }),
      );
    });
  }
}
