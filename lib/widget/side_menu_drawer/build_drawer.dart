
import 'package:flutter/material.dart';
import 'package:flutter_api/core/const_data/app_colors.dart';
import 'package:flutter_api/core/const_data/my_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget buildDrawerItem({
  required String iconPath,
  required String label,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: SvgPicture.asset(iconPath),
    title: Text(
      label,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontFamily: 'Raleway',
        fontSize: MySize.fontSizeSm.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: SvgPicture.asset('assets/icons/forward_arrow.svg'),
    onTap: onTap,
  );
}

