import 'package:flutter_api/view/favourite/screen/favourite_screen.dart';
import 'package:flutter_api/view/home/screen/home_screen.dart';
import 'package:flutter_api/view/my_cart/screen/my_cart_screen.dart';
import 'package:flutter_api/view/notification/screen/notification_screen.dart';
import 'package:flutter_api/view/profile/screen/profile_screen.dart';
import 'package:flutter_api/view/register/screen/register_screen.dart';
import 'package:flutter_api/view/side_menu/screen/side_menu_screen.dart';
import 'package:flutter_api/view/sign_in/screen/sign_in_screen.dart';
import 'package:get/get.dart';
List <GetPage<dynamic>>? routes = [
  GetPage(
      name: '/favouriteScreen',
      page: () => const FavouriteScreen()),
  GetPage(
      name: '/homeScreen',
      page: () => const HomeScreen()),
  GetPage(
      name: '/myCartScreen',
      page: () => MyCartScreen()),
  GetPage(
      name: '/notificationScreen',
      page: () => const NotificationScreen()),
  GetPage(
      name: '/profileScreen',
      page: () => const ProfileScreen()),
  GetPage(
      name: '/registerScreen',
      page: () =>   RegisterScreen()),
  GetPage(
      name: '/sideMenuScreen',
      page: () => const SideMenuScreen()),
  GetPage(
      name: '/signInScreen',
      page: () => const SignInScreen())
];