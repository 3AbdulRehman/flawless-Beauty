


 import 'package:flawless_beauty/Appointment/appointment_model.dart';
import 'package:flawless_beauty/Appointment/widget/youtube_play.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController{


 // void cardClick(AppointmentModel cardClick){
 //  // Add your backend function logic here
 //  print('Tapped on: ${cardClick.name}');
 //
 //
 // }

 RxList<AppointmentModel> hairStyleList = <AppointmentModel>[
  AppointmentModel(name: 'Faiza', profession: "Hair Style Expert", ranking: '4.7' , image: 'assets/appointment/hairexpert4.png'),
  AppointmentModel(name: 'Jane', profession: "Hair Style Expert", ranking: '4.2' , image: 'assets/appointment/makeup.png'),
  AppointmentModel(name: 'Doe', profession: "Hair Style Expert", ranking: '4.9' , image: 'assets/appointment/hairexpert3.png'),
  AppointmentModel(name: 'Emily', profession: "Hair Style Expert", ranking: '4.4' , image: 'assets/appointment/hair1.png'),
 ].obs;

 RxList<AppointmentModel> makeupSyleList = <AppointmentModel>[
  AppointmentModel(name: 'Faiza', profession: "Makeup Expert ", ranking: '4.9' , image: 'assets/appointment/face.png'),
  AppointmentModel(name: 'Jane', profession: "Makeup Expert", ranking: '4.6' , image: 'assets/appointment/makeupExpert1.png'),
  AppointmentModel(name: 'Doe', profession: "Makeup Expert", ranking: '4.2' , image: 'assets/appointment/makeupExpert2.png'),
 ].obs;

 RxList<AppointmentModel> skinSpecialist = <AppointmentModel>[
  AppointmentModel(name: 'Faiza', profession: "Skin Care Specialist", ranking: '4.7' , image: 'assets/appointment/skin_expert_1.png'),
  AppointmentModel(name: 'Jane', profession: "Skin Care Specialist", ranking: '4.9' , image: 'assets/appointment/skin_expert_2.png'),
  AppointmentModel(name: 'Doe', profession: "Skin Care Specialist", ranking: '4.2' , image: 'assets/appointment/skin_expert_3(1).png'),
  AppointmentModel(name: 'Emily', profession: "Skin Care Specialist", ranking: '4.1' , image: 'assets/appointment/skin_expert_4.png'),
 ].obs;

 RxList<AppointmentModel> eyebrowSpecialist = <AppointmentModel>[
  AppointmentModel(name: 'Faiza', profession: "Eyebrow Specialist", ranking: '4.7' , image: 'assets/appointment/eye_brow_expert2.png'),
  AppointmentModel(name: 'Jane', profession: "SEyebrow Specialist", ranking: '4.7' , image: 'assets/appointment/eyebrowExpert.png'),
  AppointmentModel(name: 'Doe', profession: "Eyebrow Specialist", ranking: '4.7' , image: 'assets/appointment/eye_brow_expert_1.png'),
 ].obs;


 // RxList<AppointmentModel> waxingSpecialist = <AppointmentModel>[
 //  AppointmentModel(name: 'Emily', profession: "Waxing Specialist", ranking: '4.7' , image: 'assets/appointment/waxing_expert_1.png'),
 //  AppointmentModel(name: 'Jane', profession: "Waxing Specialist", ranking: '4.1' , image: 'assets/appointment/makeup.png'),
 // ].obs;

 ///////////// Youtube card///////////////////////////////
 RxList<AppointmentModel> youtubeList = <AppointmentModel>[
  AppointmentModel(name: 'Emily', profession: "Hair Specialist" , videoUrl: "https://www.youtube.com/watch?v=nPt8bK2gbaU"),
  AppointmentModel(name: 'Jane', profession: "Skin Specialist",videoUrl: "nPt8bK2gbaU"),
  AppointmentModel(name: 'Faiza', profession: "Waxing Specialist",videoUrl: ""),
  AppointmentModel(name: 'Abdul', profession: "Hair Specialist",videoUrl: ""),
  AppointmentModel(name: 'Abdul', profession: "Skin Specialist",videoUrl: ""),
  AppointmentModel(name: 'Aqarib', profession: "Waxing Specialist",videoUrl: ""),

 ].obs;

 void playVideo(String videoUrl){
  Get.to(VideoPlayerScreen(videoUrl:videoUrl));
 }


}