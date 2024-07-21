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
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => ProductDetailPage(
                          product: product,
                        ));
                  },
                  child: TRoundedContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(TSize.sm),
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            /// Icon
                            const Icon(
                              Iconsax.shop,
                              color: TColors.primar1,
                            ),
                            const SizedBox(width: TSize.spaceBtwItems / 2),
                            Text(
                              product.productName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .apply(
                                      color: TColors.black, fontWeightDelta: 2),
                            ),
                            SizedBox(width: Get.width * 0.28),
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.production_quantity_limits,
                                    color: TColors.primar1,
                                  ),
                                  const SizedBox(
                                      width: TSize.spaceBtwItems / 2),
                                  Text(
                                    product.brandName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .apply(
                                            color: TColors.black,
                                            fontWeightDelta: 2),
                                  ),
                                ],
                              ),
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
                                  const SizedBox(width: TSize.spaceBtwItems),

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
