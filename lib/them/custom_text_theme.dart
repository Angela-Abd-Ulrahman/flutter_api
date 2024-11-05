import 'package:flutter/material.dart';
import 'package:flutter_api/core/const_data/app_colors.dart';
import 'package:flutter_api/core/const_data/my_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextTheme {
  static TextTheme textTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(
          fontSize: MySize.fontSizeXl.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Raleway1'),
      headlineMedium: const TextStyle().copyWith(
          fontSize: MySize.fontSizeSm.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'poppins',
          color: AppColors.gryTextColor),
      headlineSmall: const TextStyle().copyWith(
          fontSize: MySize.fontSizeXxs,
          fontWeight: FontWeight.w400,
          fontFamily: 'poppins',
          color: AppColors.gryTextColor),

      // titleLarge: const TextStyle().copyWith(
      //     fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),

      titleMedium: const TextStyle().copyWith(
          fontSize: MySize.fontSizeXs.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Raleway'),
      titleSmall: const TextStyle().copyWith(
          fontSize: MySize.fontSizeXs.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'poppins',
          color: AppColors.gryTextColor),
      bodyMedium: const TextStyle().copyWith(
          fontSize: MySize.fontSizeSm.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Raleway',
          color: AppColors.gryTextColor),
      bodySmall: const TextStyle().copyWith(
          fontSize: MySize.fontSizeXs.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Raleway'),
      bodyLarge: const TextStyle().copyWith(
          fontSize: MySize.fontSizeLg.sp,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor),
      labelLarge: const TextStyle().copyWith(
          fontSize: MySize.fontSizeMd.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Raleway'),
      labelMedium: const TextStyle().copyWith(
          fontSize: MySize.fontSizeSm.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Raleway',
          color: AppColors.gryTextColor),
      labelSmall: const TextStyle().copyWith(
          fontSize: MySize.fontSizeXxs.sp,
          fontFamily: 'poppins',
          fontWeight: FontWeight.w500,
          color: AppColors.gryTextColor));
}
