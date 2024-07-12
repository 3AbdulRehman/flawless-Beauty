import 'package:flawless_beauty/admin_panel/add_product/add_product.dart';
import 'package:flawless_beauty/admin_panel/banner_view/banner_view.dart';
import 'package:flawless_beauty/common/admin/upload_product_button.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/shop/controller/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final bannerontroller = Get.put(BannerController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Admin Home'),
        showBackArrow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/icons/upload.png',
                height: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Upload Your File',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Products, Categories, Brands',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            UploadProductButton(
                text: 'Banners',
                leftIcon: Iconsax.document_upload,
                rightIcon: Iconsax.arrow_right_1,
                onPressed: () {
                  Get.to(() => const BannerUpload());
                }),
            const SizedBox(
              height: 10,
            ),
            UploadProductButton(
              text: 'Add Product',
              leftIcon: Iconsax.document_upload,
              rightIcon: Iconsax.arrow_right_1,
              onPressed: () {
                Get.to(() => AddProductScreen());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            UploadProductButton(
              text: 'Product',
              leftIcon: Iconsax.document_upload,
              rightIcon: Iconsax.arrow_right_1,
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            UploadProductButton(
              text: 'Product',
              leftIcon: Iconsax.document_upload,
              rightIcon: Iconsax.arrow_right_1,
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            UploadProductButton(
              text: 'Product',
              leftIcon: Iconsax.document_upload,
              rightIcon: Iconsax.arrow_right_1,
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
