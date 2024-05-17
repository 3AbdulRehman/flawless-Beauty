import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/list_tile/settings_menu_tile.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/common/styles/widget_login_signuo/Custom_shap/Conatiners/primary_header_Container.dart';
import 'package:flawless_beauty/data/repositories/authentication/authentication_repository.dart';
import 'package:flawless_beauty/personalization/screens/address/address.dart';
import 'package:flawless_beauty/personalization/screens/profile/profile.dart';
import 'package:flawless_beauty/shop/screen/order/order.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/styles/list_tile/user_profile_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text("Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.white)),
                  ),

                  ///User Profile Card
                  TUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(height: TSize.spaceBtwSections),
                ],
              ),
            ),

            ///Body
            Padding(
                padding: const EdgeInsets.all(TSize.defaultSpace),
                child: Column(
                  children: [
                    /// Account Settings
                    const TSectionHeading(
                        title: 'Account Settings', showActionButton: false),
                    const SizedBox(height: TSize.spaceBtwItems),

                    TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: "Set shopping delivery address",
                      onTap: () => Get.to(() => const UserAddressScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: "Add remove Products and move to checkout",
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Order',
                      subTitle: "In-Progress and Complete Order ",
                      onTap: () => Get.to(()=>const OrderScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: "Withdraw Balance to Registered Bank Account",
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: "List of all the Discount coupons",
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notification',
                      subTitle: "Set any kind of notification message",
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: "Manage Data usage and Connected account",
                      onTap: () {},
                    ),

                    /// App Settings
                    const SizedBox(height: TSize.spaceBtwSections),
                    const TSectionHeading(
                        title: 'App Settings', showActionButton: false),
                    const SizedBox(height: TSize.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: "Upload Data to your Cloud Firebase",
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                        icon: Iconsax.location,
                        title: 'Geolocation',
                        subTitle: "Set Recommendation base on location",
                        trailing: Switch(value: true, onChanged: (value) {})),
                    TSettingsMenuTile(
                        icon: Iconsax.security_user,
                        title: 'Safe Mode',
                        subTitle: "Search result is safe for all age",
                        trailing: Switch(value: false, onChanged: (value) {})),
                    TSettingsMenuTile(
                        icon: Iconsax.image,
                        title: 'HD Image Quality',
                        subTitle: "Set image quality to be seen",
                        trailing: Switch(value: false, onChanged: (value) {})),

                    const SizedBox(height: TSize.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: ()=> controller.logout(),
                          child: const Text('Logout')),
                    ),
                    const SizedBox(height: TSize.spaceBtwSections * 2.5),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
