import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/device/device_utills.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';

class TabBarSet extends StatelessWidget implements PreferredSizeWidget {
  /// if You  want to add the Background Color to tab You have to wrap them in Material Widget.
  /// To do that we need [PreferredSizeWidget] Widget and thats why create Custom class. [PreferredSizeWidget]
  const TabBarSet({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: dark ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
