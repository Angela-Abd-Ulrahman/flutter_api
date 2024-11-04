import 'package:flutter/material.dart';
import 'package:flutter_api/core/const_data/app_colors.dart';
import 'package:flutter_api/core/const_data/my_size.dart';
import 'package:flutter_api/view/notification/controller/notification_controller.dart';
import 'package:flutter_api/widget/build_items/build_items.dart';
import 'package:flutter_api/widget/custom_buttom/custom_buttom.dart';
import 'package:flutter_api/widget/custom_text/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text('Notifications'),
        leading:IconButton(
              onPressed: (){
                Get.back();
              }, icon:  SvgPicture.asset('assets/icons/back.svg',)
      ),
        actions: [
          SvgPicture.asset('assets/icons/trash.svg')
        ],
        ),
      body: SafeArea(
          child:SingleChildScrollView(
    child:  GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          return Padding(padding: EdgeInsets.all(25),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                      text: 'Recent',
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.left,
                    fontSize: MySize.fontSizeMd,
                    fontFamily: 'Raleway',
                  ),
                  SizedBox(height: 20.h,),
                  buildRecentItem(
                    context,
                    "Thanks you for purchasing",
                    "Your order will be shipped in 2-4 days",
                    "7 min ago",
                    "assets/images/1.jpg",
                    isOffer: false,
                  ),
                  SizedBox(height: 10.h,),
                  buildRecentItem(
                    context,
                    "We Have New Products With Offers",
                    "\$364.95   \$260.00",
                    "40 min ago",
                    "assets/images/2.jpg",
                    isOffer: true,
                  ),

                  SizedBox(height: 20.h),

                  const CustomText(
                    text: 'Yesterday',
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.left,
                    fontSize: MySize.fontSizeMd,
                    fontFamily: 'Raleway',
                  ),
                  SizedBox(height: 10.h,),

                  buildRecentItem(
                    context,
                    "We Have New Products With Offers",
                    "\$364.95   \$260.00",
                    "40 min ago",
                    "assets/images/2.jpg",
                    isOffer: true,
                  ),
                  SizedBox(height: 20.h,),

                  buildRecentItem(
                    context,
                    "We Have New Products With Offers",
                    "\$364.95   \$260.00",
                    "40 min ago",
                    "assets/images/3.jpg",
                    isOffer: true,
                  ),
                  SizedBox(height: 20.h,),
                  CustomButton(
                    text: 'Send Notification',
                    backgroundColor: AppColors.base_green_Color,
                    textColor: AppColors.whiteColor,
                    onPressed: () {
                      controller.sendMessage('Hallo', 'Welcome You');
                    },
                  ),
                ],
              ));

        }
    )),
    )
    );
  }
}
