import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/personalization/controller/user_controller.dart';
import 'package:flawless_beauty/shop/screen/home/widget/widget_controller.dart/form_product_controller.dart';
import 'package:flawless_beauty/utils/constants/constant.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddToBuyButton extends GetView<FormProductController> {
  const AddToBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = UserController.instance;
    final controller = Get.put(FormProductController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Cash on Delivery"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      const Icon(Iconsax.user),
                      SizedBox(width: Get.width * 0.03),
                      Text(
                        currentUser.user.value.fullName,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSize.spaceBtwInputFields),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      TValidator.ValidateEmptyText('PhoneNumber', value),
                  controller: controller.phoneNumberController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'),
                ),
                const SizedBox(height: TSize.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.streetController,
                      validator: (value) =>
                          TValidator.ValidateEmptyText('Street', value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street'),
                    )),
                    const SizedBox(width: TSize.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                      validator: (value) =>
                          TValidator.ValidateEmptyText('Postal Code', value),
                      controller: controller.postalCodeController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code'),
                    )),
                  ],
                ),
                const SizedBox(height: TSize.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      validator: (value) =>
                          TValidator.ValidateEmptyText('City', value),
                      controller: controller.cityController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City'),
                    )),
                    const SizedBox(width: TSize.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                      validator: (value) =>
                          TValidator.ValidateEmptyText('State', value),
                      controller: controller.stateController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State'),
                    )),
                  ],
                ),
                const SizedBox(height: TSize.spaceBtwInputFields),
                TextFormField(
                  controller: controller.countryController,
                  validator: (value) =>
                      TValidator.ValidateEmptyText('Country', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(height: TSize.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: TColors.primary),
                      onPressed: () {
                        controller.saveFormToFirestore();
                      },
                      child: const Text('Buy Now')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
