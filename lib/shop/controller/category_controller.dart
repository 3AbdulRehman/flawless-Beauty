

import 'package:flawless_beauty/data/repositories/categories/category_repository.dart';
import 'package:flawless_beauty/shop/models/category/category_model.dart';
import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// - Loader Category Data
 Future<void> fetchCategories() async{
    try{
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch Categories from data source (FireStore, API, etc)
        final categories = await _categoryRepository.getAllCategories();

      // upload the Categories List
      allCategories.assignAll(categories);

      // Filter featured categories
     featuredCategories.assignAll(allCategories.where((category)=> category.isFeatured && category.parentId.isEmpty).take(8).toList());
    }catch (e){
      TLoader.errorSnackBar(title: 'Oh',message: e.toString());
    }finally{
      isLoading.value = false;

    }
 }
  /// Load selected category data

  /// Get Category or Sub Category Products



}