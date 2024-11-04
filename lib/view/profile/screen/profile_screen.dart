import 'package:flutter/material.dart';
import 'package:flutter_api/core/const_data/app_colors.dart';
import 'package:flutter_api/core/const_data/app_image.dart';
import 'package:flutter_api/core/const_data/my_size.dart';
import 'package:flutter_api/view/profile/controller/profile_controller.dart';
import 'package:flutter_api/widget/custom_buttom/custom_buttom.dart';
import 'package:flutter_api/widget/custom_text/custom_text.dart';
import 'package:flutter_api/widget/custom_text_form_fild/custom_text_form_fild.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          onPressed: (){Get.back();},
          icon: SvgPicture.asset('assets/icons/back_arrow.svg')),
          centerTitle: true,
          title: const Text('Profile', textAlign: TextAlign.center,),
      ),
      body:SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (controller){
                return  Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                       SizedBox(height: 40.h),
                      Stack(
                         children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50.r)),
                            child: Image.asset(AppImage.profile,
                              width: 81.w,
                              height: 81.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 2.5.h,
                           right: 2.5.w,
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                height: 19.h,
                                width: 19.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.whiteColor),
                                  color: AppColors.base_green_Color,
                                  borderRadius:  BorderRadius.all(Radius.circular(30.r),),
                                ),
                                  padding: EdgeInsets.all(4),
                                  child: InkWell(
                                    onTap: (){
                                      controller.pickImageFromGallery();
                                    },
                                    child: SvgPicture.asset('assets/icons/pin.svg',),
                                  ),
                          ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             CustomText(text: 'Your Name ',
                              fontFamily: 'Raleway',fontSize: MySize.fontSizeSm.sp),
                              SizedBox(height: 20.h,),
                            CustomTextFormField(
                              controller: controller.nameController,
                              hintText: 'xxxxxxx',
                              textColor: AppColors.textFormColor,
                            ),
                              SizedBox(height: 20.h),
                             CustomText(text: 'Email Address',
                              fontFamily: 'Raleway',fontSize: MySize.fontSizeSm.sp),// Email TextField
                            CustomTextFormField(
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              hintText: 'xyz@gmail.com',
                            ),
                              SizedBox(height: 20.h),
                             CustomText(text: 'Password',
                              fontFamily: 'Raleway'),
                            // Password TextFormField
                            CustomTextFormField(
                              controller: controller.passwordController,
                              hintText: '*******',
                              textColor: AppColors.textFormColor,
                              isPassword: controller.isPassword,
                              suffixIcon:  GestureDetector(
                                onTap: (){
                                  controller.togglePasswordVisibility();
                                },
                                child: Icon(size: MySize.iconSm,color: AppColors.textFormColor,
                                    controller.isPassword
                                        ? FontAwesomeIcons.eyeSlash
                                        : FontAwesomeIcons.eye
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                       SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            text: 'Recovery Password',
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            textAlign:TextAlign.right,
                          fontSize: MySize.fontSizeXs.sp,),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      CustomButton(text: 'Save Now',
                          backgroundColor: AppColors.base_green_Color,
                          textColor: AppColors.whiteColor,
                          onPressed: (){
                        controller.saveEditedData();
                          }),
            
                    ],
                  ),
                );
              }
            ),
          )),

    );
  }
}
