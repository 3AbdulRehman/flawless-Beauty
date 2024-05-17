
import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/feature/authentication/controllers/change_name_controller/update_name_controller.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/constants/text_String.dart';
import 'package:flawless_beauty/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(updateNameController());
    return  Scaffold(
      /// Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall),
      ),
      body:  Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text('Use real for any easy Verificaiton. This name will appear on Several page Screen',style: Theme.of(context).textTheme.labelMedium),

            const SizedBox(height: TSize.spaceBtwSections),

            /// Text Field and Button
            Form(
              key: controller.updateUserNameForKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => TValidator.ValidateEmptyText('First name',value),
                      expands: false,
                      decoration: const InputDecoration(labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(height: TSize.spaceBtwInputFields),

                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => TValidator.ValidateEmptyText('Last name',value),
                      expands: false,
                      decoration: const InputDecoration(labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                    )


                  ],
                )
            ),
            const SizedBox(height: TSize.spaceBtwSections),

            ///
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=> controller.updateUserName(),child: const Text('Save')),
            ),

          ],
        ),
      ),

    );
  }
}
