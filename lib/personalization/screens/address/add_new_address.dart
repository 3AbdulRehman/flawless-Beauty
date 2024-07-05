import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/personalization/controller/address_controller.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return  Scaffold(
      appBar: const TAppBar(
        title: Text("Add New Address"),
        showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSize.defaultSpace),
        child: Form(
          key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value)=> TValidator.ValidateEmptyText('Name', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),),
                const SizedBox(height: TSize.spaceBtwInputFields),
                TextFormField(
                  validator: (value)=> TValidator.ValidateEmptyText('PhoneNumber', value),
                  controller: controller.phoneNumber,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'),),
                const SizedBox(height: TSize.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      controller: controller.street,
                      validator: (value)=> TValidator.ValidateEmptyText('Street', value),
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'),)),
                    const SizedBox(width: TSize.spaceBtwInputFields),
                    Expanded(child: TextFormField(
                      validator: (value)=> TValidator.ValidateEmptyText('Postal Code', value),
                      controller: controller.postalCode,
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Postal Code'),)),
                  ],
                ),
                const SizedBox(height: TSize.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      validator: (value)=> TValidator.ValidateEmptyText('City', value),
                      controller: controller.city,
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'City'),)),
                    const SizedBox(width: TSize.spaceBtwInputFields),
                    Expanded(child: TextFormField(
                      validator: (value)=> TValidator.ValidateEmptyText('State', value),
                      controller: controller.state,
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'),)),
                  ],
                ),
                const SizedBox(height: TSize.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value)=> TValidator.ValidateEmptyText('Country', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),),
                const SizedBox(height: TSize.defaultSpace),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
                  controller.addNewAddresses();
                }, child: const Text('Save')),)
              ],
            )
        ),
        ),
      ),
    );
  }
}
