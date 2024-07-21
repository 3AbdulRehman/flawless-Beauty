import 'package:flawless_beauty/Appointment/appointment_fetch_data/appointment_fetch_data.dart';
import 'package:flawless_beauty/Appointment/controller/appointment_controller.dart';
import 'package:flawless_beauty/admin_panel/home/admin_home.dart';
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
    final appcontroller = Get.put(AppointmentController());

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
                        title: 'App Details', showActionButton: false),
                    const SizedBox(height: TSize.spaceBtwItems),

                    TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Appointment',
                      subTitle: "see your appointments",
                      onTap: () => Get.to(() => AppointmentFetchDataScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Order',
                      subTitle: "Order Details and Status",
                      onTap: () => Get.to(() => const OrderScreen()),
                    ),

                    /// App Settings
                    const SizedBox(height: TSize.spaceBtwSections),

                    const TSectionHeading(
                        title: 'App Settings', showActionButton: false),
                    const SizedBox(height: TSize.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.sun_1,
                      title: 'Theme Mode',
                      subTitle: "Set Theme Mode",
                      onTap: () {},
                    ),

                    TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: "Upload Data to your Cloud Firebase",
                      onTap: () => Get.to(const AdminHomeScreen()),
                    ),

                    const SizedBox(height: TSize.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () => controller.logout(),
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
