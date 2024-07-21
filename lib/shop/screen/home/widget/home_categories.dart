import 'package:flawless_beauty/Appointment/appointment_model.dart';
import 'package:flawless_beauty/Appointment/controller/appointment_controller.dart';
import 'package:flawless_beauty/navigation_menu.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/image_Text_widget/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppointmentController());
    final navcontroller = Get.put(NavigaitonController());
    return SizedBox(
      height: Get.height * 0.11,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.expertNameList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            AppointmentModel data = controller.expertNameList[index];
            return TVerticalImageText(
                isNetworkImage: false,
                image: data.image!,
                title: data.expertName!,
                onTap: () {
                  navcontroller.selectedIndex.value = 1;
                  controller.selectedTab.value = index;
                });
          }),
    );
  }
}
