import 'package:flawless_beauty/admin_panel/add_product/add_product_controller.dart';
import 'package:flawless_beauty/admin_panel/add_product/delete_product.dart';
import 'package:flawless_beauty/common/admin/upload_product_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddProductController _controller = Get.put(AddProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => _controller.productName.value = value,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) => _controller.brandName.value = value,
                decoration: const InputDecoration(
                  labelText: 'Brand Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    _controller.actualPrice.value = double.parse(value),
                decoration: const InputDecoration(
                  labelText: 'Actual Price',
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    _controller.sellPrice.value = double.parse(value),
                decoration: const InputDecoration(
                  labelText: 'Sell Price',
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Obx(() {
                return _controller.imageFile.value != null
                    ? Image.file(
                        _controller.imageFile.value!,
                        height: 100,
                        width: 100,
                      )
                    : const Text('No image selected');
              }),

              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: _controller.pickImage,
              //   child: Text('Pick Image'),
              // ),
              UploadProductButton(
                text: 'Pick Image',
                leftIcon: Iconsax.document_upload,
                rightIcon: Iconsax.arrow_right_1,
                onPressed: () {
                  _controller.pickImage();
                },
              ),
              const SizedBox(height: 20),
              UploadProductButton(
                text: 'Add Product',
                leftIcon: Iconsax.document_upload,
                rightIcon: Iconsax.arrow_right_1,
                onPressed: () {
                  _controller.uploadProduct();
                },
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              UploadProductButton(
                text: 'Delete Product',
                leftIcon: Iconsax.document_upload,
                rightIcon: Iconsax.arrow_right_1,
                onPressed: () {
                  Get.to(() => const ProductListView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
