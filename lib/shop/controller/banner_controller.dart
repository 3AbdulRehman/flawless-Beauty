

import 'package:flawless_beauty/data/repositories/banners/banner_repository.dart';
import 'package:get/get.dart';

import '../../utils/popups/loader.dart';
import '../models/bannner_model.dart';

class BannerController extends GetxController{

  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

 @override
  void onInit() {
   fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }


  // Fetch Banner
  Future<void> fetchBanners() async{
    try{
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);

    }catch (e){
      TLoader.errorSnackBar(title: 'Oh',message: e.toString());
    }finally{
      isLoading.value = false;

    }
  }
}