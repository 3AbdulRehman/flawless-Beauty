import 'package:flawless_beauty/common/admin/upload_product_button.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flawless_beauty/shop/controller/banner_controller.dart';
import 'package:iconsax/iconsax.dart';

class BannerUpload extends StatelessWidget {
  const BannerUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Scaffold(
      appBar: const TAppBar(
        title: Text(
          'Banner List',
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
        child: Column(
          // Use Column for vertical layout
          children: [
            UploadProductButton(
                text: 'Upload Banners',
                leftIcon: Iconsax.document_upload,
                rightIcon: Iconsax.arrow_right_1,
                onPressed: () => controller.uploadBannerImage()),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: TColors.primary,
                    ),
                  );
                }

                if (controller.banners.isEmpty) {
                  return const Center(child: Text('No Banners Found!'));
                }

                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.banners.length,
                  itemBuilder: (context, index) {
                    final banner = controller.banners[index];
                    return ListTile(
                      leading: Image.network(
                        banner.imageUrl,
                        width: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                      title: Text('Banner ${index + 1}'),
                      trailing: IconButton(
                        icon: const Icon(Iconsax.trash, color: Colors.red),
                        onPressed: () => controller.deleteBanner(
                            banner.imageUrl, banner.docId!),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
