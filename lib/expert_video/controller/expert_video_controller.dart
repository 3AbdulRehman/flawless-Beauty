import 'package:flawless_beauty/expert_video/widget/expert_videos_model.dart';
import 'package:flawless_beauty/expert_video/widget/video_screen.dart';
import 'package:get/get.dart';

class ExpertVideoController extends GetxController {
  void playVideo(String videoUrl) {
    Get.to(VideoPlayerScreen(videoUrl: videoUrl));
  }

  RxList<ExpertVideosModel> youtubeList = <ExpertVideosModel>[
    ExpertVideosModel(
        name: 'Emily', profession: "Lips Specialist", videoUrl: "cRedJaVd0oI"),
    ExpertVideosModel(
        name: 'kainat Faisal',
        profession: "Skin Specialist",
        videoUrl: "rnqidYsAntQ"),
    ExpertVideosModel(
        name: 'Emily',
        profession: "Eye Brow Specialist",
        videoUrl: "1ZIbfhUI0vo"),
    ExpertVideosModel(
        name: 'Lily Chen',
        profession: "Hair Specialist",
        videoUrl: "F09Eaqj1dbY"),
    ExpertVideosModel(
        name: 'Mary', profession: "Skin Specialist", videoUrl: "nlvyn9pcOLY"),
    ExpertVideosModel(
        name: 'Linda',
        profession: "Makeup Specialist",
        videoUrl: "jK30SoDM3Uc"),
  ].obs;
}
