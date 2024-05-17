import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/shop/screen/order/widgets/order_list.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// Appbar
      appBar: TAppBar(title: Text("My Order",style: Theme.of(context).textTheme.headlineSmall),showBackArrow: true),
      body: const Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),

        /// Orders
        child: TOrderListItems(),
      ),
    );
  }
}
