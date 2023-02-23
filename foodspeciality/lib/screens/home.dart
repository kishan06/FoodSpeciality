import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 17.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              hintText: "search recipes, ingredients or tips", 
                              validatorText: "",
                              leadingIcon: Icon(Icons.search,
                                size: 27.h,
                                color: AppColors.grey707070,
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
                    ),
      
                    CommanTabbar("My Community","Inspiration"),
                    
                    // Expanded(
                    //   child: TabBarView(
                    //     children: [
                          
                    //     ]
                    //   ),
                    // )
                  ],
                )
              ],
            )),
      ),
    );
  }

  
}
