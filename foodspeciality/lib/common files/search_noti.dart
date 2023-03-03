
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';

Widget searchNotification(){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 17.h),
    child: Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            hintText: "search recipes, ingredients or tips", 
            validatorText: "",
            leadingIcon: Icon(Icons.search,
              size: 27.h,
              color: AppColors.greyM707070,
            ),
            // pref
          ),
        ),

        sizedBoxWidth(26.w),

        Image.asset("assets/icons/notification.png",
          width: 28.w,
          height: 28.w,
        )
      ],
    ),
  );

}