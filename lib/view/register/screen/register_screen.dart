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
      appBar: AppBar(
          leading: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.back_arrow_Color,
              borderRadius: BorderRadius.circular(50.r)),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: MySize.iconSm,
              )),
        ),
      )),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Register Account', style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.center,),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(' Fill  your  details  or  continue  with  social media',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headlineMedium),
                            SizedBox(height: 20.h),
                          ],
                        )),
                    Text('Your Name', style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.blackColor)),
                    SizedBox(height: 30.h,),
                    CustomTextFormField(
                      controller: controller.nameController,
                      hintText: 'xxxxxxx',
                      textColor: AppColors.textFormColor,
                    ),
                    SizedBox(height: 20.h,),
                    Text('Email Address', style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.blackColor)),
                    CustomTextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'xyz@gmail.com',
                      textColor: AppColors.textFormColor,
                    ),
                    SizedBox(height: 20.h),
                    Text('Password', style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.blackColor)),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      hintText: '*******',
                      textColor: AppColors.textFormColor,
                      isPassword: controller.isPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.togglePasswordVisibility();
                        },
                        child: Icon(
                          size: MySize.iconSm,
                          color: AppColors.textFormColor,
                          controller.isPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    controller.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomButton(
                            text: 'Sign Up',
                            backgroundColor: AppColors.base_green_Color,
                            textColor: AppColors.whiteColor,
                            onPressed: () {
                              controller.signUp();
                            }),
                    SizedBox(height: 30.h,),
                    CustomButton(
                        text: 'Sign up with Google',
                        backgroundColor: AppColors.back_arrow_Color,
                        textColor: AppColors.blackColor,
                        image: SvgPicture.asset('assets/icons/google.svg'),
                        onPressed: () {}),
                    SizedBox(height: 100.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already Have Account?', style: Theme.of(context).textTheme.labelMedium),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.registerScreen);
                          },
                          child: Text(' Log In', style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.blackColor)),
                        ),
                      ],
                    ),
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
