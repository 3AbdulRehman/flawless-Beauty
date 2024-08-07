import 'package:flawless_beauty/feature/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/constant.dart';
import '../../../utils/constants/image_String.dart';
import '../../../utils/constants/size.dart';

class TSocialMediaButton extends StatelessWidget {
  const TSocialMediaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                width: TSize.IconMd,
                height: TSize.IconMd,
                image: AssetImage(TImage.google),
              )),
        ),
        const SizedBox(
          width: TSize.spaceBtwItems,
        ),
        // Container(
        //   decoration: BoxDecoration(border: Border.all(color: TColors.grey),borderRadius: BorderRadius.circular(100)),
        //   child: IconButton(onPressed: (){}, icon: const Image(
        //     width: TSize.IconMd,
        //     height: TSize.IconMd,
        //     image: AssetImage(TImage.facebook),
        //   )
        //   ),
        // )
      ],
    );
  }
}
