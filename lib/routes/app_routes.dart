import 'package:flawless_beauty/feature/authentication/screens/OnBoarding/onbording.dart';
import 'package:flawless_beauty/feature/authentication/screens/Password_configuration/forget_password.dart';
import 'package:flawless_beauty/feature/authentication/screens/Signup/signup.dart';
import 'package:flawless_beauty/feature/authentication/screens/Signup/verify_email.dart';
import 'package:flawless_beauty/feature/authentication/screens/login/login.dart';
import 'package:flawless_beauty/personalization/screens/address/address.dart';
import 'package:flawless_beauty/personalization/screens/profile/profile.dart';
import 'package:flawless_beauty/personalization/screens/settings/settings.dart';
import 'package:flawless_beauty/routes/routes.dart';
import 'package:flawless_beauty/shop/screen/cart/cart.dart';
import 'package:flawless_beauty/shop/screen/checkout/checkout.dart';
import 'package:flawless_beauty/shop/screen/home/home.dart';
import 'package:flawless_beauty/shop/screen/order/order.dart';
import 'package:flawless_beauty/shop/screen/product_reviews/product_reviews.dart';
import 'package:flawless_beauty/shop/screen/store/store.dart';
import 'package:flawless_beauty/shop/screen/wishlist/wishlist.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.store, page: () => const Store()),
    GetPage(name: Routes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: Routes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: Routes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: Routes.order, page: () => const OrderScreen()),
    GetPage(name: Routes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: Routes.cart, page: () => const CartScreen()),
    GetPage(name: Routes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: Routes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: Routes.signup, page: () => const SignupScreen()),
    GetPage(name: Routes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: Routes.signIn, page: () => const LoginScreen()),
    GetPage(name: Routes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: Routes.onBoarding, page: () => const OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
