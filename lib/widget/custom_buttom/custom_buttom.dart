import 'package:flutter/material.dart';
import 'package:flutter_api/core/const_data/my_size.dart';
import 'package:flutter_api/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final SvgPicture? image;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.image,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,  // Full width button
      height: 50.h,  // Set the height of the button
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),  // Rounded corners
          ),
          elevation: 0, // No shadow effect
        ),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) image!,
            if (image != null)  SizedBox(width: 10.w), // Add spacing between icon and text
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontFamily: 'Raleway',
                fontSize: MySize.fontSizeSm.sp,
                fontWeight: FontWeight.w600, // Bold text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
