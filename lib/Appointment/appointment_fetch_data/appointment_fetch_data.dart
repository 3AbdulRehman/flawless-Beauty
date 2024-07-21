import 'package:flawless_beauty/Appointment/appointment_fetch_data/controller/appointment_fetch_controller.dart';
import 'package:flawless_beauty/common/styles/Rounded_Conatiner/rounded_container.dart';
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/helper/help_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
        } else {
          return ListView.builder(
            itemCount: controller.appointments.length,
            itemBuilder: (context, index) {
              final appointment = controller.appointments[index];
              // return ListTile(
              //   title: Text(appointment['expertName']),
              //   subtitle: Text(
              //     'Name: ${appointment['userName']}\n'
              //     'email: ${appointment['useremail']}\n'
              //     'Date: ${appointment['selectedDate']}\n'
              //     'Time: ${appointment['selectedTime']}',
              //   ),
              // );
              return Column(
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
                                  /// Icon
                                  const Icon(Iconsax.user),
                                  const SizedBox(
                                      width: TSize.spaceBtwItems / 2),

                                  /// Status & Date
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Exper Name",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(appointment['expertName'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  /// Icon
                                  const Icon(Iconsax.book),
                                  const SizedBox(width: TSize.spaceBtwItems),

                                  /// Status & Date
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Book person Name",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(
                                          appointment['userName'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .apply(
                                                  color: TColors.black,
                                                  fontWeightDelta: 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: TSize.spaceBtwItems),

                        /// Row 2
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  /// Icon
                                  const Icon(Iconsax.calendar),
                                  const SizedBox(
                                      width: TSize.spaceBtwItems / 2),

                                  /// Status & Date
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
                                        Text(appointment['selectedDate'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  /// Icon
                                  const Icon(Iconsax.clock),
                                  const SizedBox(width: TSize.spaceBtwItems),

                                  /// Status & Date
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
                                        Text(
                                          appointment['selectedTime'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .apply(
                                                  color: TColors.black,
                                                  fontWeightDelta: 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: TSize.spaceBtwItems / 2,
                        ),
                        Text(
                          "Email :${appointment['useremail']}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .apply(color: TColors.black, fontWeightDelta: 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  )
                ],
              );
            },
          );
        }
      }),
    );
  }
}
