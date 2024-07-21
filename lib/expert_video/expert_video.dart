import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/layout/grid_layout.dart';
import 'package:flawless_beauty/expert_video/controller/expert_video_controller.dart';
import 'package:flawless_beauty/expert_video/widget/expert_youtube_Linke.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ExpertVideo extends StatelessWidget {
  const ExpertVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExpertVideoController());
    return Scaffold(
      appBar: TAppBar(
        title: Text("Expert Video",
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: false,
        action: const [
          Icon(Iconsax.video, color: Colors.black),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return TGridLayout(
                  crossAxisCount: 1,
                  itemCount: controller.youtubeList.length,
                  mainAxisExtent: 70,
                  itemBuilder: (_, index) {
                    final youtubeCard = controller.youtubeList[index];
                    return GestureDetector(
                        onTap: () {
                          controller.playVideo(youtubeCard.videoUrl!);
                        },
                        child: ExpertYoutubeLinke(
                            name: youtubeCard.name,
                            profession: youtubeCard.profession));
                  });
            }),
          ],
        ),
      ),
    );
  }
}
