// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

import '../../../../common files/customtextformfield.dart';

class EditCommunity extends StatefulWidget {
  const EditCommunity({super.key});

  @override
  State<EditCommunity> createState() => _EditCommunityState();
}

class _EditCommunityState extends State<EditCommunity> {

  TextEditingController tecSubject = TextEditingController(text: "WDIPL");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 35.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            "assets/icons/back_arrow.svg",
                            height: 25.h,
                            // width: 40.w,
                            color: AppColors.greyD3B3F43,
                          ),
                        ),
                      ],
                    ),
        
                    sizedBoxHeight(10.h),
                  
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 120.h,
                          height: 120.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.white,
                              width: 3.h,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                // offset: Offset(0, 3), // changes the position of the shadow
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage("assets/community.png"),
                              fit: BoxFit.cover
                            )
                          ),
                          // child: YourChildWidget(),
                        ),
        
                        sizedBoxWidth(20.w),
        
                        SizedBox(
                          height: 40.h,
                          width: 130.w,
                          child: ElevatedButton(
                            onPressed: () {
                              // Get.to(DiscoveryRecipesScreen(),
                              //     duration: Duration(milliseconds: 500),
                              //     transition: Transition.rightToLeft);
                              // //Get.toNamed("/discoveryRecipes");
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: BorderSide(
                                    color: Color(0xFF54595F), width: 1.w),
                              ),
                              elevation: 0,
                              primary: Color(0xFF54595F),
                              onPrimary: Colors.grey,
                            ),
                            child: Text(
                              'Change Photo',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.h,
                                  fontFamily: "StudioProR"),
                            ),
                          ),
                        ),
                          
                      ],
                    ),
        
                    sizedBoxHeight(40.h),
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text(
                        //   "Enter Your Email",
                        //   style: textformstyle(""),
                        // ),
                        // Text(
                        //   "Enter Your Email",
                        //   style: TextStyle(
                        //     color: const Color.fromRGBO(112, 112, 112, 1),
                        //     fontSize: 14.sp,
                        //   ),
                        // ),
                        textBlack18bold("Add new subject")
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      textEditingController: tecSubject,
                      hintText: "Enter Community Name",
                      withOutPrefix: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Community Name';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Please enter a valid name';
                        }
                        // v1 = true;
                        return null;
                      },
                      validatorText: "",
                      // suffixIcon: Image.asset(
                      //   "assets/style=linear.png",
                      //   height: 20.h,
                      //   width: 17.w,
                      //   fit: BoxFit.contain,
                      // ),
                    ),
        
                    sizedBoxHeight(100.h),
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50.h,
                          width: MediaQuery.of(context).size.width / 2 - 30.w,
                          child: ElevatedButton(
                            onPressed: () {
                              // Get.to(DiscoveryRecipesScreen(),
                              //     duration: Duration(milliseconds: 500),
                              //     transition: Transition.rightToLeft);
                              //Get.toNamed("/discoveryRecipes");
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: BorderSide(
                                    color: Color(0xFF54595F), width: 1.w),
                              ),
                              elevation: 0,
                              primary: Color(0xFF54595F),
                              onPrimary: Colors.grey,
                            ),
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.h,
                                  fontFamily: "StudioProR"),
                            ),
                          ),
                        ),
                        
                        SizedBox(
                          height: 50.h,
                          width: MediaQuery.of(context).size.width / 2 - 30.w,
                          child: ElevatedButton(
                            onPressed: () {
                              //Get.toNamed("/discoveryRecipes");
                              // Get.to(BottomBar(),
                              //     duration: Duration(milliseconds: 500),
                              //     transition: Transition.rightToLeft);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: BorderSide(
                                    color: Colors.grey, width: 1.w),
                              ),
                              elevation: 0,
                              primary: Colors.transparent,
                              onPrimary: Colors.grey,
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.h,
                                  fontFamily: "StudioProR"),
                            ),
                          ),
                        ),
                    
                      ],
                    ),
              
                    
        
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(10.0),
                    //   child: Container(
                    //     // height: 100.0,
                    //     margin: const EdgeInsets.only(top: 6.0),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                    //       color: Colors.white,
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey,
                    //           offset: Offset(0.0, 1.0), //(x,y)
                    //           blurRadius: 5.0,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
        
                    // Container(
                    //   // height: 375.h,
                    //   // color: AppColors.white,
                    //   decoration: BoxDecoration(
                    //       color: AppColors.white,
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: AppColors.greyLtEBEBEB,
                    //           blurRadius: 1.h,
                    //           spreadRadius: 1.h,
                    //           offset: Offset(0, -5.h)
                    //         ),
                    //       ],
                          
                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(20.h),
                    //         topRight: Radius.circular(20.h)
                    //       )
                    //   ),
                    // )
                  
                  ],
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }

  Widget participantsList(String name){
    return Row(
      children: [
        Container(
          width: 60.h,
          height: 60.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/home/profile.png"),
              fit: BoxFit.cover
            )
          ),
        ),

        sizedBoxWidth(10.w),

        textBlack18bold(name),

        // sizedBoxHeight(20.h)
      ],
    );
  }
}