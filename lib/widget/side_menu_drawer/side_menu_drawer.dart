import 'package:flutter/material.dart';
import 'package:flutter_api/core/const_data/app_colors.dart';
import 'package:flutter_api/core/const_data/app_image.dart';
import 'package:flutter_api/core/const_data/my_size.dart';
import 'package:flutter_api/core/const_data/routes.dart';
import 'package:flutter_api/view/side_menu/controller/side_menu_controller.dart';
import 'package:flutter_api/widget/custom_text/custom_text.dart';
import 'package:flutter_api/widget/side_menu_drawer/build_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SideMenuDrawer extends StatelessWidget {
  const SideMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.side_menu_Color,
        padding: EdgeInsets.all(35),
        child: GetBuilder<SideMenuController>(
          init: SideMenuController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(96.r)),
                  child: Image.asset(
                    AppImage.profile,
                    width: 96.w,
                    height: 96.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 30.h),
                 CustomText(
                   text: 'Programmer X',
                    color: AppColors.whiteColor,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    fontSize: MySize.fontSizeMd.sp,
                ),
                SizedBox(height: 50.h),
                buildDrawerItem(
                  iconPath: 'assets/icons/profile.svg',
                  label: 'Profile',
                  onTap: () => Get.toNamed(Routes.profileScreen),
                ),
                buildDrawerItem(
                  iconPath: 'assets/icons/shopping_bag.svg',
                  label: 'My Cart',
                  onTap: () => Get.toNamed(Routes.myCartScreen),
                ),
                buildDrawerItem(
                  iconPath: 'assets/icons/favorite.svg',
                  label: 'Favorite',
                  onTap: () => Get.toNamed(Routes.favouriteScreen),
                ),
                buildDrawerItem(
                  iconPath: 'assets/icons/orders.svg',
                  label: 'Orders',
                  onTap: () => Get.toNamed(Routes.homeScreen),
                ),
                buildDrawerItem(
                  iconPath: 'assets/icons/bell.svg',
                  label: 'Notifications',
                  onTap: () => Get.toNamed(Routes.notificationScreen),
                ),
                buildDrawerItem(
                  iconPath: 'assets/icons/setting.svg',
                  label: 'Settings',
                  onTap: () => Get.toNamed(Routes.homeScreen),
                ),
                Divider(
                  thickness: 2,
                  height: 50.h,
                ),
                buildDrawerItem(
                  iconPath: 'assets/icons/signout.svg',
                  label: 'Sign Out',
                  onTap: controller.signOut,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
