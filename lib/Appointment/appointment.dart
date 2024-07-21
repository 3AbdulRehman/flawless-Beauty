import 'package:flawless_beauty/Appointment/controller/appointment_controller.dart';
import 'package:flawless_beauty/Appointment/widget/TabBar_set.dart';
import 'package:flawless_beauty/Appointment/widget/appointment_form.dart';
import 'package:flawless_beauty/Appointment/widget/expert_card.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/helper/help_function.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppointmentController());
    return DefaultTabController(
      initialIndex: controller.selectedTab.value,
      length: controller.expertNameList.length, // Number of tabs
      child: Scaffold(
        appBar: const TAppBar(
          title: Text('Flawless Salon Appointment'),
          action: [Icon(Iconsax.record_circle)],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelpFunction.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 0,
                  flexibleSpace: const Divider(),
                  bottom: TabBarSet(
                    tabs: List.generate(
                      controller.expertNameList.length,
                      (index) => Tab(
                          text: controller.expertNameList[index].expertName),
                    ),
                  )),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: controller.hairStyleList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        final expert = controller.hairStyleList[index];
                        return ExpertCard(
                          name: expert.name!,
                          profession: expert.profession!,
                          rating: expert.ranking!,
                          imagePath: expert.image!,
                          onPressed: () {
                            showAppointmentDialog(context, expert.name!);
                          },
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: controller.makeupSyleList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        final expert = controller.makeupSyleList[index];
                        return ExpertCard(
                          name: expert.name!,
                          profession: expert.profession!,
                          rating: expert.ranking!,
                          imagePath: expert.image!,
                          onPressed: () {
                            showAppointmentDialog(context, expert.name!);
                          },
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: controller.skinSpecialist.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        final expert = controller.skinSpecialist[index];
                        return ExpertCard(
                          name: expert.name!,
                          profession: expert.profession!,
                          rating: expert.ranking!,
                          imagePath: expert.image!,
                          onPressed: () {
                            showAppointmentDialog(context, expert.name!);
                          },
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: controller.eyebrowSpecialist.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        final expert = controller.eyebrowSpecialist[index];
                        return ExpertCard(
                          name: expert.name!,
                          profession: expert.profession!,
                          rating: expert.ranking!,
                          imagePath: expert.image!,
                          onPressed: () {
                            showAppointmentDialog(context, expert.name!);
                          },
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: controller.waxingSpecialist.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        final expert = controller.waxingSpecialist[index];
                        return ExpertCard(
                          name: expert.name!,
                          profession: expert.profession!,
                          rating: expert.ranking!,
                          imagePath: expert.image!,
                          onPressed: () {
                            showAppointmentDialog(context, expert.name!);
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
