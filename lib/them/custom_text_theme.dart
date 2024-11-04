
import 'package:flutter/material.dart';
import 'package:flutter_api/core/const_data/app_colors.dart';
import 'package:flutter_api/core/const_data/my_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextTheme {

  static TextTheme textTheme = TextTheme(
    //register
      headlineLarge: const TextStyle().copyWith(
        fontSize: MySize.fontSizeXl.sp, fontWeight: FontWeight.w700,fontFamily: 'Raleway1'),

      headlineMedium: const TextStyle().copyWith(
          fontSize: MySize.fontSizeSm.sp, fontWeight: FontWeight.w400,fontFamily: 'poppins', color: AppColors.gryTextColor),
     //recovery password
      headlineSmall: const TextStyle().copyWith(
          fontSize: MySize.fontSizeXxs, fontWeight: FontWeight.w400, fontFamily: 'poppins',color: AppColors.gryTextColor),

      // titleLarge: const TextStyle().copyWith(
      //     fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),

      //sign in/google
      titleMedium: const TextStyle().copyWith(
          fontSize: MySize.fontSizeXs.sp, fontWeight: FontWeight.w600,fontFamily: 'Raleway'),

    // gmail.com/7 min ago/$450/programrs field
      titleSmall: const TextStyle().copyWith(
          fontSize: MySize.fontSizeXs.sp, fontWeight: FontWeight.w500,fontFamily: 'poppins', color: AppColors.gryTextColor),
     //notification/profile page/password gray
      bodyMedium: const TextStyle().copyWith(
          fontSize:  MySize.fontSizeSm.sp, fontWeight: FontWeight.w600,fontFamily: 'Raleway1'),
      //we have new product
      bodySmall: const TextStyle().copyWith(
          fontSize:  MySize.fontSizeXs.sp, fontWeight: FontWeight.w500, fontFamily: 'Raleway'),
     //programrs x page
      bodyLarge: const TextStyle().copyWith(
          fontSize: MySize.fontSizeLg.sp,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor),


       //recnt/yesterday
      labelLarge: const TextStyle().copyWith(
        fontSize: MySize.fontSizeMd.sp,
        fontWeight: FontWeight.w600,fontFamily: 'Raleway'),
      // Email address/create account/profile
      labelMedium: const TextStyle().copyWith(
          fontSize: MySize.fontSizeSm.sp, fontWeight: FontWeight.w500, fontFamily: 'Raleway',color: AppColors.gryTextColor),

      //your order
      labelSmall: const TextStyle().copyWith(
        fontSize: MySize.fontSizeXxs.sp,
        fontFamily: 'poppins',
        fontWeight: FontWeight.w500, color: AppColors.gryTextColor)
  );
}