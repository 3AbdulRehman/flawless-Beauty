import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/personalization/screens/address/add_new_address.dart';
import 'package:flawless_beauty/personalization/screens/address/widgets/single_address.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: ()=> Get.to(()=> const AddNewAddressScreen()),
        child: const Icon(Iconsax.add,color: TColors.white,),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Address',style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              TSingleAddress(selectedAddress: true),
              TSingleAddress(selectedAddress: false)


            ],
          ),
        ),
      ),
    );
  }
}
