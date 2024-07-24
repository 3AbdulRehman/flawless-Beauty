import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/shop/screen/home/widget/model/form_buy_product_model.dart';
import 'package:flawless_beauty/shop/screen/home/widget/widget_controller.dart/form_product_controller.dart';
import 'package:flawless_beauty/shop/screen/order/order_controller/order_controller.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OrderScreen extends GetView<FormProductController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    final OrderController controller = Get.put(OrderController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Order List'),
        showBackArrow: true,
      ),
      body: Obx(() {
        if (controller.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            FormBuyProductModel product = controller.products[index];
            return Slidable(
              key: ValueKey(product),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    borderRadius: BorderRadius.circular(15),
                    onPressed: (context) {
                      controller.deleteProduct(product.id!);
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.02, right: Get.width * 0.03),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailPage(product: product));
                      },
                      child: TRoundedContainer(
                        showBorder: true,
                        padding: EdgeInsets.only(
                            left: Get.width * 0.02,
                            right: Get.width * 0.02,
                            top: Get.width * 0.03,
                            bottom: Get.width * 0.03),
                        backgroundColor: dark ? TColors.dark : TColors.light,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.max,
                              children: [
                                /// Icon
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.shop,
                                      color: TColors.primar1,
                                    ),
                                    const SizedBox(
                                        width: TSize.spaceBtwItems / 2),
                                    SizedBox(
                                      width: Get.width * 0.37,
                                      child: Text(
                                        product.productName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .apply(
                                                color: TColors.black,
                                                fontWeightDelta: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ],
                                ),
                                // SizedBox(width: Get.width * 0.24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.production_quantity_limits,
                                          color: TColors.primar1,
                                        ),
                                        const SizedBox(
                                            width: TSize.spaceBtwItems / 2),
                                        SizedBox(
                                          width: Get.width * 0.3,
                                          child: Text(
                                            product.brandName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .apply(
                                                    color: TColors.black,
                                                    fontWeightDelta: 2),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),

                            const SizedBox(height: TSize.spaceBtwItems),

                            /// Row 2
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      /// Icon
                                      const Icon(Iconsax.ship),
                                      const SizedBox(
                                          width: TSize.spaceBtwItems / 2),

                                      /// Status & Date
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Actual Price",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium),
                                            Text(product.actualPrice.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      /// Icon
                                      const Icon(Iconsax.buy_crypto),
                                      const SizedBox(
                                          width: TSize.spaceBtwItems),

                                      /// Status & Date
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(" Sell Price",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium),
                                            Text(
                                              '${product.sellPrice}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .apply(
                                                      color: TColors.black,
                                                      fontWeightDelta: 2),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: TSize.spaceBtwItems / 2),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final FormBuyProductModel product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Product Name: ${product.productName}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('Brand Name: ${product.brandName}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Phone Number: ${product.phoneNumber}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Street: ${product.street}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('City: ${product.city}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('State: ${product.state}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Postal Code: ${product.postalCode}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Country: ${product.country}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('User Name: ${product.userName}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Actual Price: \$${product.actualPrice}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Sell Price: \$${product.sellPrice}',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
