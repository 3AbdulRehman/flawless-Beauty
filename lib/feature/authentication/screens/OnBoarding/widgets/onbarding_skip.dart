import 'package:flutter/material.dart';

import '../../../../../utils/constants/size.dart';
import '../../../../../utils/device/device_utills.dart';
import '../../../controller onboarding/onbording_controller.dart';

class OnBordingSkip extends StatelessWidget {
  const OnBordingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),right: TSize.defaultSpace,
        child: TextButton(onPressed: ()=>OnBordingController.instance.skipPage(),
            child: const Text("Skip"))
    );
  }
}
