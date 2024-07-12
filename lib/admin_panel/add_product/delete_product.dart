import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_product_controller.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    final AddProductController controller = Get.put(AddProductController());
    //controller.fetchProducts(); // Fetch products on UI build
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Delete Product'),
        showBackArrow: true,
      ),
      body: Obx(() {
        if (controller.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return ListTile(
              leading: Image.network(product.imageUrl,
                  width: 50, height: 50, fit: BoxFit.cover),
              title: Text(product.productName),
              subtitle: Text(product.brandName),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  controller
                      .deleteProduct(product.id!); // Assuming id is not null
                },
              ),
            );
          },
        );
      }),
    );
  }
}
