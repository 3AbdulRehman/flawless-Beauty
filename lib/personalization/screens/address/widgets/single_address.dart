import 'package:flawless_beauty/personalization/controller/address_controller.dart';
import 'package:flawless_beauty/shop/models/address_model.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/styles/Rounded_Conatiner/rounded_container.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.onTap, required this.address});

final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelpFunction.isDarkMode(context);
    return Obx((){
      final selectedAddressId = controller.selectedAddress.value.id;
      final  selectedAddress =  selectedAddressId == address.id;
        return InkWell(
        onTap: onTap,
        child: TRoundedContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(TSize.md),
          showBorder: true,
          backgroundColor: selectedAddress
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? TColors.darkGrey
                  : TColors.grey,
          margin: const EdgeInsets.only(bottom: TSize.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                      color: selectedAddress
                          ? dark
                              ? TColors.light
                              : TColors.dark
                          : null)
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: TSize.sm / 2),
                   Text(address.formattedPhoneNo,maxLines: 1,overflow: TextOverflow.ellipsis),
                  const SizedBox(height: TSize.sm / 2),
                   Text(address.toString(),softWrap: true),

                    ],
              )
            ],
          ),
        ),
      );
    });
  }
}
