import 'package:flawless_beauty/personalization/screens/settings/settings.dart';
import 'package:flawless_beauty/shop/screen/home/home.dart';
import 'package:flawless_beauty/shop/screen/store/store.dart';
import 'package:flawless_beauty/shop/screen/wishlist/wishlist.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'Appointment/appointment.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigaitonController());
    final darkMode = THelpFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.calendar), label: 'Calender'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],

        ),
      ),
      body: Obx(() =>  controller.screen[controller.selectedIndex.value])
    );
  }
}
class NavigaitonController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
     const HomeScreen(),
    const AppointmentScreen(),
    const Store(),
    const FavoriteScreen(),
    const SettingsScreen(),


  ];
}