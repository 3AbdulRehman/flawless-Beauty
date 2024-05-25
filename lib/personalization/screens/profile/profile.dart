import 'package:flawless_beauty/common/styles/appbar/appbar.dart';
import 'package:flawless_beauty/common/styles/image/t_circular_image.dart';
import 'package:flawless_beauty/common/styles/text/section_heading.dart';
import 'package:flawless_beauty/feature/authentication/screens/change_name/change_name.dart';
import 'package:flawless_beauty/personalization/controller/user_controller.dart';
import 'package:flawless_beauty/personalization/screens/profile/widget/profile_menu.dart';
import 'package:flawless_beauty/utils/constants/image_String.dart';
import 'package:flawless_beauty/utils/constants/size.dart';
import 'package:flawless_beauty/common/styles/shimmers/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),

      /// Bodu
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : TImage.userprofileImage;
                        return controller.imageUploading.value
                            ? const TShimmerEffect(
                                width: 80, height: 80, radius: 80)
                            : TCircularImage(
                                image: image,
                                width: 80,
                                height: 80,
                                isNetworkImage: networkImage.isNotEmpty);
                      },
                    ),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Divider
              const SizedBox(height: TSize.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSize.spaceBtwItems),

              /// Heading Profile Information
              const TSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSize.spaceBtwItems),

              ///Profile Information
              TProfileMenu(
                  title: 'Name',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),
              TProfileMenu(
                  title: 'username',
                  value: controller.user.value.username,
                  onPressed: () {}),
              const SizedBox(height: TSize.spaceBtwItems),

              /// Divider
              const SizedBox(height: TSize.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSize.spaceBtwItems),

              /// Heading Personal Information
              const TSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSize.spaceBtwItems),

              ///Personal Infromations
              TProfileMenu(
                  title: 'User ID',
                  value: controller.user.value.id,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'E-mail',
                  value: controller.user.value.email,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                  onPressed: () {}),
              TProfileMenu(title: 'Gender', value: 'Female', onPressed: () {}),
              TProfileMenu(
                  title: 'Date of Birth',
                  value: '10 March 2000',
                  onPressed: () {}),

              const SizedBox(height: TSize.spaceBtwItems),

              ///Delete Button
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPop(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
