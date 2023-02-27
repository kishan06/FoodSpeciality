import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/common/list_card.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 36.w, vertical: 17.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
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
                          sizedBoxWidth(26.w),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed("/viewuser");
                            },
                            child: Image.asset(
                              "assets/icons/notification.png",
                              width: 28.w,
                              height: 28.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommanTabbar("My Community", "Inspiration"),
                  ],
                ),
                Expanded(
                  child: Container(
                    color: AppColors.greyLtEBEBEB,
                    child: TabBarView(children: [tabbarView1(), tabbarView2()]),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget tabbarView1() {
    return Column(
      children: [
        Container(
          height: 10.h,
          color: AppColors.white,
        ),
        Expanded(
          child: Stack(
            children: [
              Image.asset(
                "assets/home/tab1_image.jpeg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // sizedBoxHeight(500.h),

                  textgrey22BoldSP("Let's Build Your Community."),

                  sizedBoxHeight(7.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    child: textL_grey16Robo(
                        "Create your community and connect with your friends, family, chefs and other aspiring cooks."),
                  ),

                  sizedBoxHeight(50.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: customButtonWithBorder("Build Your Community",
                        onPressed: () {}),
                  ),

                  sizedBoxHeight(50.h),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget tabbarView2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [listCard(), sizedBoxHeight(13.h)],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
