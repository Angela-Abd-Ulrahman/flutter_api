import 'package:flutter/material.dart';
import 'package:flutter_api/core/const_data/app_colors.dart';
import 'package:flutter_api/core/const_data/my_size.dart';
import 'package:flutter_api/core/const_data/routes.dart';
import 'package:flutter_api/view/sign_in/controller/sign_in_controller.dart';
import 'package:flutter_api/widget/custom_buttom/custom_buttom.dart';
import 'package:flutter_api/widget/custom_text_form_fild/custom_text_form_fild.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.back_arrow_Color,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: () {Get.back();},
              icon: const Icon(Icons.arrow_back_ios_rounded, size: MySize.iconSm),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<SignInController>(
            init: SignInController(),
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Hello Again!',style: Theme.of(context).textTheme.headlineLarge,textAlign: TextAlign.center,),
                          SizedBox(height: 8.h),
                          Text(
                            ' Fill  your  details  or  continue  with  social media',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                    Text('Email Address',style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.blackColor)),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'xyz@gmail.com',
                      textColor: AppColors.textFormColor,
                    ),
                    SizedBox(height: 20.h),
                    Text('Password',style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.blackColor)),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      hintText: '*******',
                      isPassword: controller.isPassword,
                      textColor: AppColors.textFormColor,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.togglePasswordVisibility();
                        },
                        child: Icon(
                          size: MySize.iconSm,
                          controller.isPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text('Recovery Password',style: Theme.of(context).textTheme.headlineSmall,textAlign: TextAlign.end,),
                    SizedBox(height: 20.h,),
                    controller.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                      text: 'Sign In',
                      backgroundColor: AppColors.base_green_Color,
                      textColor: AppColors.whiteColor,
                      onPressed: () {
                        controller.signIn();
                      },
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(text: 'Sign in with Google',
                        backgroundColor: AppColors.back_arrow_Color,
                        textColor: AppColors.blackColor,
                        image: SvgPicture.asset('assets/icons/google.svg'),
                        onPressed: (){}),
                    SizedBox(height: 150.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('New User?',style: Theme.of(context).textTheme.labelMedium),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.registerScreen);
                          },
                          child:Text('Create Account',style: Theme.of(context).textTheme.labelMedium!.apply(color: AppColors.blackColor)),
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
