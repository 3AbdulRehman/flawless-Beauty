import 'package:flawless_beauty/Appointment/appointment_model.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  RxInt selectedIndex = 0.obs;
  RxInt selectedTab = 0.obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: selectedTime.value.hour + 1, minute: 0), // Next hour
    );

    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
    }
  }

  /// Send Email Appointment
  // Future sendEmail() async {
  //   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  //   const serviceId = "service_6gy53iq";
  //   const templateId = "template_89qmvw3";
  //   const userId = "";
  //   final response = await http.post(url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode({"service_id"}));
  // }

  // void cardClick(AppointmentModel cardClick){
  //  // Add your backend function logic here
  //  print('Tapped on: ${cardClick.name}');
  //
  //
  // }
  List expertNameList = [
    AppointmentModel(expertName: 'Hair', image: TImage.hairStyle),
    AppointmentModel(expertName: 'Makeup', image: TImage.makeupStyle),
    AppointmentModel(expertName: 'Skin', image: TImage.skinStyle),
    AppointmentModel(expertName: 'Eye Brow', image: TImage.eyebrow),
    AppointmentModel(expertName: 'Waxing', image: TImage.waxing),
  ];

  RxList<AppointmentModel> hairStyleList = <AppointmentModel>[
    AppointmentModel(
        name: 'Ava Morale',
        profession: "Hair Style Expert",
        ranking: '4.7',
        image: 'assets/appointment/hairexpert4.png'),
    AppointmentModel(
        name: 'Lily Chen',
        profession: "Hair Style Expert",
        ranking: '4.2',
        image: 'assets/appointment/makeup.png'),
    AppointmentModel(
        name: 'Julian Styles',
        profession: "Hair Style Expert",
        ranking: '4.9',
        image: 'assets/appointment/hairexpert3.png'),
    AppointmentModel(
        name: 'Ethan Thompson',
        profession: "Hair Style Expert",
        ranking: '4.4',
        image: 'assets/appointment/hair1.png'),
  ].obs;

  RxList<AppointmentModel> makeupSyleList = <AppointmentModel>[
    AppointmentModel(
        name: 'Samantha',
        profession: "Makeup Expert ",
        ranking: '4.9',
        image: 'assets/appointment/face.png'),
    AppointmentModel(
        name: 'Jessica',
        profession: "Makeup Expert",
        ranking: '4.6',
        image: 'assets/appointment/makeupExpert1.png'),
    AppointmentModel(
        name: 'Emily',
        profession: "Makeup Expert",
        ranking: '4.2',
        image: 'assets/appointment/makeupExpert2.png'),
  ].obs;

  RxList<AppointmentModel> skinSpecialist = <AppointmentModel>[
    AppointmentModel(
        name: 'Dr. David Kim',
        profession: "Skin Care Specialist",
        ranking: '4.7',
        image: 'assets/appointment/skin_expert_1.png'),
    AppointmentModel(
        name: 'Dr. Sophia Patel',
        profession: "Skin Care Specialist",
        ranking: '4.9',
        image: 'assets/appointment/skin_expert_2.png'),
    AppointmentModel(
        name: 'Maya Singh, MD',
        profession: "Skin Care Specialist",
        ranking: '4.2',
        image: 'assets/appointment/skin_expert_3(1).png'),
    AppointmentModel(
        name: 'Doe',
        profession: "Skin Care Specialist",
        ranking: '4.1',
        image: 'assets/appointment/skin_expert_4.png'),
  ].obs;

  RxList<AppointmentModel> eyebrowSpecialist = <AppointmentModel>[
    AppointmentModel(
        name: 'Faiza',
        profession: "Eyebrow Specialist",
        ranking: '4.7',
        image: 'assets/appointment/eye_brow_expert2.png'),
    AppointmentModel(
        name: 'Jane',
        profession: "SEyebrow Specialist",
        ranking: '4.7',
        image: 'assets/appointment/eyebrowExpert.png'),
    AppointmentModel(
        name: 'Doe',
        profession: "Eyebrow Specialist",
        ranking: '4.7',
        image: 'assets/appointment/eye_brow_expert_1.png'),
  ].obs;

  RxList<AppointmentModel> waxingSpecialist = <AppointmentModel>[
    AppointmentModel(
        name: 'Sarah Taylor',
        profession: "Waxing Specialist",
        ranking: '4.7',
        image: 'assets/appointment/waxing_expert_1.png'),
    AppointmentModel(
        name: 'Nadia Ali',
        profession: "Waxing Specialist",
        ranking: '4.1',
        image: 'assets/appointment/makeup.png'),
  ].obs;

  ///////////// Youtube card///////////////////////////////
}
