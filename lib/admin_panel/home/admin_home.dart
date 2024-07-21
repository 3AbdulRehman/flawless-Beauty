import 'package:flawless_beauty/admin_panel/add_product/add_product.dart';
import 'package:flawless_beauty/admin_panel/banner_view/banner_view.dart';
import 'package:flawless_beauty/common/admin/upload_product_button.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/shop/controller/banner_controller.dart';
import 'package:flawless_beauty/shop/screen/order/order.dart';
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
      body: SingleChildScrollView(
        child: Padding(
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
                'Products, Banners',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              UploadProductButton(
                  text: 'Banners Upload',
                  leftIcon: Iconsax.document_upload,
                  rightIcon: Iconsax.arrow_right_1,
                  onPressed: () {
                    Get.to(() => const BannerUpload());
                  }),
              const SizedBox(
                height: 10,
              ),
              UploadProductButton(
                text: 'Upload Product',
                leftIcon: Iconsax.document_upload,
                rightIcon: Iconsax.arrow_right_1,
                onPressed: () {
                  Get.to(() => const AddProductScreen());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Manage Mobile Application',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Order Details, Appointment Details',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              UploadProductButton(
                text: 'Order Details',
                leftIcon: Iconsax.document_upload,
                rightIcon: Iconsax.arrow_right_1,
                onPressed: () {
                  Get.to(() => const OrderScreen());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              UploadProductButton(
                text: 'Appointment Details',
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
      ),
    );
  }
}
