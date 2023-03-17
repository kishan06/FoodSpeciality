import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/search_page.dart';
import 'package:foodspeciality/screens/user_notification.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

import 'customSearchTextfield.dart';

Widget searchNotification() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
    child: Row(
      children: [
        Image.asset(
          "assets/logo.png",
          width: 60.w,
          height: 60.w,
        ),

        sizedBoxWidth(5.w),


        Expanded(
          child: CustomSearchTextFormField(
            onTap: () {
              //Get.toNamed("/SearchPage");
              Get.to(SearchPage(),duration:Duration(milliseconds:500),
                  transition: Transition.downToUp);
            },
            readonly: true,
            hintText: "search recipes, ingredients or tips",
            validatorText: "",
            leadingIcon: Icon(
              Icons.search,
              size: 27.h,
              color: AppColors.greyM707070,
            ),
            // pref
          ),
        ),
        sizedBoxWidth(5.w),
        GestureDetector(
          onTap: () {
            //Get.toNamed("/notification");
            Get.to(UserNotifications(),duration:Duration(milliseconds:500),
                transition: Transition.downToUp);
          },
          child: Image.asset(
            "assets/icons/notification.png",
            width: 28.w,
            height: 28.w,
          ),
        )
      ],
    ),
  );
}
