import 'package:flawless_beauty/feature/authentication/controller%20onboarding/onbording_controller.dart';
import 'package:flawless_beauty/feature/authentication/screens/OnBoarding/widgets/onbarding_skip.dart';
import 'package:flawless_beauty/feature/authentication/screens/OnBoarding/widgets/onboarding_dot_navigation.dart';
import 'package:flawless_beauty/feature/authentication/screens/OnBoarding/widgets/onboarding_page.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flawless_beauty/utils/device/device_utills.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBordingController());

    return  Scaffold(
      body: Stack(
        children: [
          /// Horizental Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,//swip page
            children: const [
              OnBordingPage(image: TImage.onBoarding1,title: TTexts.onBoardingTitle1,subTitle: TTexts.onBoardingSubTitle1,),
              OnBordingPage(image: TImage.onBoarding2,title: TTexts.onBoardingTitle2,subTitle: TTexts.onBoardingSubTitle2,),
              OnBordingPage(image: TImage.onBoarding3,title: TTexts.onBoardingTitle3,subTitle: TTexts.onBoardingSubTitle3,),

            ],
          ),
          // Skip Button
          const OnBordingSkip(),

          /// Dot Navigator SmoothPageIndicator
          const OnBoardingDotNavigation(),

          //Circular Button
          const OnBoardingNextButton(),

        ],
      ),

    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = THelpFunction.isDarkMode(context);

    return Positioned(
      right: TSize.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor: dark ? TColors.primary : Colors.black),
            onPressed: ()=> OnBordingController.instance.nextPage(),
            child: const Icon(Iconsax.arrow_right_3)
        ),
    );
  }
}



