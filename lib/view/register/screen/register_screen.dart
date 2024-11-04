import 'package:flutter/material.dart';
import 'package:flutter_api/core/const_data/app_colors.dart';
import 'package:flutter_api/core/const_data/my_size.dart';
import 'package:flutter_api/core/const_data/routes.dart';
import 'package:flutter_api/view/register/controller/register_controoler.dart';
import 'package:flutter_api/widget/custom_buttom/custom_buttom.dart';
import 'package:flutter_api/widget/custom_text/custom_text.dart';
import 'package:flutter_api/widget/custom_text_form_fild/custom_text_form_fild.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.back_arrow_Color,
              borderRadius: BorderRadius.circular(50.r)
          ),
          child: IconButton(
              onPressed: (){
                Get.back();
              }, icon: const Icon(Icons.arrow_back_ios_rounded,
            size: MySize.iconSm,)),
        ),
      )
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<RegisterController>(
                init: RegisterController(),
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                           child:  Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               CustomText(
                                   text: 'Register Account',
                                     fontSize: MySize.fontSizeXl.sp,
                                     fontWeight: FontWeight.w700,
                                     fontFamily: 'Raleway1'),
                               SizedBox(height: 8.h,),
                               Text('Fill Your details Or Continue With Social Media',
                                 maxLines: 2,
                                 overflow: TextOverflow.ellipsis,
                                 textAlign: TextAlign.center,
                                 style:  TextStyle(
                                     fontSize: MySize.fontSizeMd.sp,
                                     fontWeight: FontWeight.w400,
                                     fontFamily: 'poppins',
                                     color: AppColors.gryTextColor),),
                               SizedBox(height: 20.h),
                             ],
                           )
                          ),
                         CustomText(
                             text: 'Your Name ',
                          textAlign: TextAlign.left,
                          fontFamily: 'Raleway',
                             fontWeight: FontWeight.w500,
                             fontSize: MySize.fontSizeSm.sp,
                         ),
                         SizedBox(height: 30.h,),
                        CustomTextFormField(
                          controller: controller.nameController,
                          hintText: 'xxxxxxx',
                          textColor: AppColors.textFormColor,
                        ),
                         SizedBox(height: 20.h,),
                         CustomText(
                             text: 'Email Address',
                          textAlign: TextAlign.left,
                          fontFamily: 'Raleway',
                             fontSize: MySize.fontSizeSm.sp),// Email TextField
                        CustomTextFormField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'xyz@gmail.com',
                          textColor: AppColors.textFormColor,
                        ),
                         SizedBox(height: 20.h),
                         CustomText(
                            text: 'Password',
                          textAlign: TextAlign.left,
                          fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        fontSize: MySize.fontSizeSm.sp),
                        // Password TextFormField
                        CustomTextFormField(
                          controller: controller.passwordController,
                          hintText: '*******',
                          textColor: AppColors.textFormColor,
                          isPassword: controller.isPassword,
                            suffixIcon: GestureDetector(
                              onTap: (){
                                controller.togglePasswordVisibility();
                              },
                                child: Icon(
                                    size: MySize.iconSm,color: AppColors.textFormColor,
                                    controller.isPassword ? Icons.visibility_off : Icons.visibility,
                                ),
                            ),
                        ),
                         SizedBox(height: 20.h),
                        controller.isLoading
                            ? Center(child: CircularProgressIndicator())
                            : CustomButton(text: 'Sign Up',
                            backgroundColor: AppColors.base_green_Color,
                            textColor: AppColors.whiteColor,
                            onPressed: (){
                          controller.signUp();
                            }),

                         SizedBox(height: 30.h,),
                       CustomButton(text: 'Sign up with Google',
                           backgroundColor: AppColors.back_arrow_Color,
                           textColor: AppColors.blackColor,
                           image: SvgPicture.asset('assets/icons/google.svg'),
                           onPressed: (){}),
                        SizedBox(height: 100.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             CustomText(
                              text: 'Already Have Account?',
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              fontSize: MySize.fontSizeSm.sp,
                              color: AppColors.gryTextColor,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.signInScreen);
                              },
                              child:  CustomText(
                                text: 'Log In',
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500,
                                fontSize: MySize.fontSizeSm.sp,
                                color: AppColors.blackColor,),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
        ),
              ),
    );
  }
}


