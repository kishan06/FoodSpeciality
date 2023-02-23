import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/common%20files/texts.dart';
import 'package:foodspeciality/utils/colors.dart';

Widget listCard(){
  return Container( 
            // height: 425.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.h),
      color: AppColors.white
    ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 9.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50.h,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.h),
                          image: const DecorationImage(
                            image: AssetImage("assets/home/profile.png"),
                            fit: BoxFit.fill
                          )  
                        ),
                      ),
            
                      sizedBoxWidth(10.w),
            
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // textWhite17w500("George Smith"),
                          // e=
                          textgreyD16BoldSP("Priyanka Joshi"),
            
                          sizedBoxHeight(5.h),
            
                          textgreyD12Robo("2 Days ago")
                          
                          // textGrey15W500("21 Jan, 2022, 10:41 am")
            
                        ],
                      )
                    ],
                  ),
            
                  followButton("Follow", 
                    onPressed: (){
                      
                    }
                  )
            
                  // customButtonWithBorder(
                  //   "text", 
                  //   onPressed: onPressed
                  // )
            
                ],
              ),
            ),

            sizedBoxHeight(14.h),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.h),
                    image: DecorationImage(
                      image: AssetImage("assets/home/food.png"),
                      fit: BoxFit.fill
                    )
                  ),
                ),

                Container(
                  height: 180.h,
                  child: Padding(
                    padding:  EdgeInsets.all(9.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.h),
                            color: AppColors.white.withOpacity(0.5)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/video.png",
                                height: 10.h,
                                width: 15.w,
                              ),
                          
                              sizedBoxWidth(2.w),
                                                
                              textgreyD12Robo("Video")
                            ],
                                                
                                                
                            // Image.asset("assets/icons/video.png"),
                          ),
                        ),
                    
                        // Spacer(),      
                    
                        SizedBox(
                          height: 27.h,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 5.w);
                            },
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 8,
                            itemBuilder: (context,index){
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.h),
                                  color: index == 0 ? AppColors.white.withOpacity(0.7) : AppColors.greyD3B3F43.withOpacity(0.7)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                                  child: index == 0 ? textgreyD12Robo("Video") : textWhite12Robo("video"),
                                ),
                              );
                            },
                          ),
                        ),
                                        
                                            
                                            
                        // Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(15.h),
                        //     color: AppColors.white.withOpacity(0.5)
                        //   ),
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                        //     child: textgreyD12Robo("Video"),
                        //   ),
                        // )
                      
                      ],
                    ),
                  ),
                )
              ],
            ),
                
            sizedBoxHeight(13.h),  

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/icons/like.png",
                        width: 20.w,
                        height: 18.h,
                      ),
            
                      sizedBoxWidth(25.w),
            
                      Image.asset("assets/icons/comment.png",
                        width: 20.w,
                        height: 18.h,
                      ),
            
                      sizedBoxWidth(25.w),
            
                      Image.asset("assets/icons/share.png",
                        width: 20.w,
                        height: 18.h,
                      ),
            
                    ],
                  ),
            
                  Image.asset("assets/icons/save.png",
                    width: 20.w,
                    height: 18.h,
                  ),
                ],
              ),
            ),

            sizedBoxHeight(10.h),

            Padding(
              padding: EdgeInsets.fromLTRB(11.w, 0.w, 0.w, 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textgreyD12Robo("1,320 Likes"),
              
                  textgreyD20BoldSP("Carrot Tzatzik"),
              
                  textgreyL12Robo("View all 30 comments"),
              
                  SizedBox(height: 5.w),
            
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 27.h,
                        height: 27.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.h),
                          image: const DecorationImage(
                            image: AssetImage("assets/home/profile.png"),
                            fit: BoxFit.fill
                          )  
                        ),
                      ),
            
                      sizedBoxWidth(5.w),
            
                      textgreyL12Robo("Add a comment")
                    ],
                  ),

                  textgreyD12Robo("View Recipe >")
            
                  // followButton("Follow", 
                  //   onPressed: (){
                      
                  //   }
                  // )
            
                  // customButtonWithBorder(
                  //   "text", 
                  //   onPressed: onPressed
                  // )
            
                ],
              ),
            ),

            // Image.asset(
            //   sliderImage,
            //   fit: BoxFit.fill,
            // ),
          ],
        ),
      )
    );
     
}