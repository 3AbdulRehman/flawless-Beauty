import 'dart:io';

import 'package:flawless_beauty/data/repositories/banners/banner_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/popups/loader.dart';
import '../models/bannner_model.dart';

class BannerController extends GetxController {
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final bannerRepo = Get.put(BannerRepository());

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  // Fetch Banner
  Future<void> fetchBanners() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch Banners
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void uploadBannerImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        String imageUrl = await bannerRepo.uploadBannerImage(imageFile);
        await bannerRepo.saveBannerUrl(imageUrl);
        fetchBanners(); // Refresh the list after adding a new banner

        TLoader.successSnackBar(
            title: 'Success', message: 'Banner image successfully uploaded');
      } else {
        print('No image selected.');
      }
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh', message: e.toString());
    }
  }

  // delete Banner
  Future<void> deleteBanner(String imageUrl, String docId) async {
    try {
      isLoading(true);
      await bannerRepo.deleteBanner(imageUrl, docId);
      fetchBanners();
      Get.snackbar('Success', 'Banner successfully deleted');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
