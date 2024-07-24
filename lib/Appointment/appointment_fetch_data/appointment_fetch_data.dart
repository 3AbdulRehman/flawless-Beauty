import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flawless_beauty/Appointment/appointment_fetch_data/controller/appointment_fetch_controller.dart';
import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';

class AppointmentFetchDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = THelpFunction.isDarkMode(context);
    final AppointmentFetchDataController controller =
        Get.put(AppointmentFetchDataController());

    return Scaffold(
      appBar: const TAppBar(
        title: Text('Appointment Details'),
        showBackArrow: true,
      ),
      body: Obx(() {
        if (controller.appointments.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.appointments.length,
          itemBuilder: (context, index) {
            final appointment = controller.appointments[index];

            final expertName = appointment['expertName'] ?? 'N/A';
            final userName = appointment['userName'] ?? 'N/A';
            final selectedDate = appointment['selectedDate'] ?? 'N/A';
            final selectedTime = appointment['selectedTime'] ?? 'N/A';
            final userEmail = appointment['useremail'] ?? 'N/A';
            final id = appointment['id'];

            return Slidable(
              key: ValueKey(id),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    borderRadius: BorderRadius.circular(15),
                    onPressed: (context) {
                      if (id != null) {
                        controller.deleteAppointment(id);
                      } else {
                        print('Error: Appointment ID is null');
                      }
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Column(
                children: [
                  TRoundedContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(TSize.sm),
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Iconsax.user),
                                  const SizedBox(
                                      width: TSize.spaceBtwItems / 2),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Expert Name",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(expertName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Iconsax.book),
                                  const SizedBox(width: TSize.spaceBtwItems),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Booked by",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(userName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .apply(
                                                    color: TColors.black,
                                                    fontWeightDelta: 2)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: TSize.spaceBtwItems),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Iconsax.calendar),
                                  const SizedBox(
                                      width: TSize.spaceBtwItems / 2),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Appointment Date",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(selectedDate,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Iconsax.clock),
                                  const SizedBox(width: TSize.spaceBtwItems),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Appointment Time",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(selectedTime,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .apply(
                                                    color: TColors.black,
                                                    fontWeightDelta: 2)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: TSize.spaceBtwItems / 2),
                        Text(
                          "Email: $userEmail",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: TColors.black, fontWeightDelta: 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSize.spaceBtwItems / 2),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
