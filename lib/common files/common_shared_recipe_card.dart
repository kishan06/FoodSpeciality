import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/texts.dart';
import 'global.dart';

Widget sharedRecipeCard({
    required String recipeImage,
    required String recipeName,
    
  }) {
    return Container(
      height: 114.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.h),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyL979797,
            blurRadius: 2.h,
            spreadRadius: 1.h,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          children: [
            Container(
              height: 85.h,
              width: 110.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.h),
                image: DecorationImage(
                    image: NetworkImage(ApiUrls.base + recipeImage),
                    // AssetImage("assets/home/food_bowl.png"),
                    fit: BoxFit.fill)
              ),
            ),
            // sizedBoxHeight(5.h),
            Spacer(),
            // textgreyD10Robo("Slappappoffer Recipe"),
            textgreyD10Robo(recipeName),

            // sizedBoxHeight(5.h),
            Spacer()
          ],
        ),
      ),
    );
  }
