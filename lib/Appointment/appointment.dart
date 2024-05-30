import 'package:flawless_beauty/Appointment/controller/appointment_controller.dart';
import 'package:flawless_beauty/Appointment/widget/TabBar_set.dart';
import 'package:flawless_beauty/Appointment/widget/appointment_youtube_link.dart';
import 'package:flawless_beauty/Appointment/widget/expert_card.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/layout/grid_layout.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../common/styles/text/section_heading.dart';
import '../utils/constants/size.dart';
import '../utils/helper/help_function.dart';


class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);

    final controller = Get.put(AppointmentController());
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: const TAppBar(
          title: Text('Flawless Salon Appointment'),
          action: [
            Icon(Iconsax.record_circle)
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, innerBoxIsScrolled) {
            return [
               SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelpFunction.isDarkMode(context) ? TColors.black : TColors.white,
                expandedHeight: 400,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12,right: 12),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            const Divider(),
                            TSectionHeading(title: "Expert Videos",onPressed: (){}),
                            const SizedBox(height: TSize.spaceBtwItems /2),
                           Obx((){
                             return  TGridLayout(itemCount: controller.youtubeList.length,
                                 mainAxisExtent: 70, itemBuilder: (_,index){
                                   final youtubeCard = controller.youtubeList[index];
                                   return  GestureDetector(
                                       onTap: (){
                                         controller.playVideo(youtubeCard.videoUrl!);

                                       },
                                       child: AppointmentYoutubeLink( name: youtubeCard.name, profession: youtubeCard.profession));
                                 }
                             );
                           })
                            /////

                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20,right: 10,top: 15),
                        child: TSectionHeading(title: "Flawless Salon Expert",showActionButton: false,),
                      ),

                    ],
                  ),
                ),

                bottom: const TabBarSet(
                  tabs: [
                    Tab(text: 'Hair'),
                    Tab(text: 'Makeup'),
                    Tab(text: 'Skin'),
                    Tab(text: 'Eye Brow'),
                    Tab(text: 'Waxing'),
                  ],
                ),
              ),
            ];
          },
          body:  Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: controller.hairStyleList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_,index){
                        final expert = controller.hairStyleList[index];
                        return  ExpertCard(name: expert.name, profession: expert.profession, rating: expert.ranking!, imagePath: expert.image!, onPressed: () { },);
                      },

                    ),
                    ListView.builder(
                      itemCount: controller.makeupSyleList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_,index){
                        final expert = controller.makeupSyleList[index];
                        return  ExpertCard(name: expert.name, profession: expert.profession, rating: expert.ranking!, imagePath: expert.image!, onPressed: () { },);
                      },

                    ),
                    ListView.builder(
                      itemCount: controller.skinSpecialist.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_,index){
                        final expert = controller.skinSpecialist[index];
                        return  ExpertCard(name: expert.name, profession: expert.profession, rating: expert.ranking!, imagePath: expert.image!, onPressed: () { },);
                      },

                    ),


                    ListView.builder(
                      itemCount: controller.eyebrowSpecialist.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_,index){
                        final expert = controller.eyebrowSpecialist[index];
                        return  ExpertCard(name: expert.name, profession: expert.profession, rating: expert.ranking!, imagePath: expert.image!, onPressed: () { },);
                      },

                    ),

                    ListView.builder(
                     itemCount: controller.hairStyleList.length,
                     scrollDirection: Axis.vertical,
                     itemBuilder: (_,index){
                       final expert = controller.hairStyleList[index];
                       return  ExpertCard(name: expert.name, profession: expert.profession, rating: expert.ranking!, imagePath: expert.image!, onPressed: () { },);
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

