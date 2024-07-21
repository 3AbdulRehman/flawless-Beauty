import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawless_beauty/Appointment/controller/appointment_controller.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final String expertName = Get.arguments;
  AppointmentController controller = Get.put(AppointmentController());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveAppointment() async {
    try {
      Map<String, dynamic> appointment = {
        'expertName': expertName,
        'userName': controller.userName,
        'useremail': controller.useremail,
        'selectedDate':
            DateFormat('yyyy-MM-dd').format(controller.selectedDate.value),
        'selectedTime': controller.selectedTime.value.format(context),
      };
      await _firestore.collection('Appointments').add(appointment);
      TLoader.successSnackBar(
          title: 'Success', message: 'Appointment booked successfully');
    } catch (e) {
      print('error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Iconsax.arrow_left_3,
                      size: 22, color: TColors.primary)),
              const SizedBox(width: TSize.md),
              Text(
                'Select Date & Time ',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const Divider(
            color: TColors.grey,
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Expert Name:",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 110,
                  child: Text(
                    expertName,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSize.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.red), // Set the border color here
                ),
              ),
              initialValue: controller.userName, // Set the initial value
              enabled: false, // Make the field read-only
            ),
            const SizedBox(height: TSize.spaceBtwInputFields),
            TextFormField(
              decoration: const InputDecoration(),
              initialValue: controller.useremail, // Set the initial value
              enabled: false, // Make the field read-only
            ),
            const SizedBox(height: TSize.spaceBtwInputFields),
            Obx(() {
              final date = controller.selectedDate.value;
              return GestureDetector(
                onTap: () {
                  controller.selectDate(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: TColors.primary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      " Select Date: ${DateFormat('MM-dd-yyy').format(date)}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              );
            }),
            const SizedBox(height: TSize.spaceBtwInputFields),
            Obx(() {
              final time = controller.selectedTime.value;
              return GestureDetector(
                onTap: () {
                  controller.selectTime(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: TColors.primary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Select Time: ${time.format(context)}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: TSize.spaceBtwSections / 4),
          ],
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                  TColors.primary), // Change the color here
            ),
            onPressed: () {
              saveAppointment();
            },
            child: const Text("Submit"),
          ),
        ),
      ],
    );
  }
}

void showAppointmentDialog(BuildContext context, String name) {
  Get.dialog(
    AppointmentForm(),
    arguments: name, // Pass the expert name as an argument
    barrierDismissible: false,
    barrierColor: Colors.white54,
  );
}
