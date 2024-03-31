

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/constant.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/device/device_utills.dart';
import '../../../../../utils/helper/help_function.dart';
import '../../../controller onboarding/onbording_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = THelpFunction.isDarkMode(context);
    final contoller = OnBordingController.instance;

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight()+25,
      left: TSize.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: contoller.pageController,
        onDotClicked: contoller.dotNavigationClick,
        effect:  ExpandingDotsEffect(activeDotColor: dark ? TColors.light : TColors.dark,dotHeight: 6
        ),
      ),
    );
  }
}
