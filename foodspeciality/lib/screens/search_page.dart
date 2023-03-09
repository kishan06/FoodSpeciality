import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:foodspeciality/common%20files/search_noti.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/common/list_card.dart';
// import 'package:foodspeciality/screens/InsideBottomBar/SearchPage/common/list_card.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Future<void> share() async {
  //   await FlutterShare.share(
  //     title: 'Example share',
  //     text: 'Example share text',
  //     linkUrl: 'https://flutter.dev/',
  //     chooserTitle: 'Example Chooser Title'
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            // extendBody: true,
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Column(
                  children: [
                    // searchNotification(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
                      // padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(
                        hintText: "search recipes, ingredients or tips", 
                        validatorText: "",
                        leadingIcon: Icon(Icons.search,
                          size: 27.h,
                          color: AppColors.greyM707070,
                        ),
                        suffixIconConstraints: BoxConstraints(
                          maxWidth: 24.h,
                          maxHeight: 24.h
                        ),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 17.w),
                          child: SvgPicture.asset(
                            "assets/icons/filter.svg",
                            // height: 10.h,
                            // width: 10.h,
                            color: AppColors.greyD3B3F43,
                            // colorFilter: AppColors.greyD3B3F43,
                          ),
                        ),
                        // pref
                      ),
                    ),
                    CommanTabbar("Recipes", "Community"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      tabbarView1(), 
                      tabbarView2()
                    ]
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget tabbarView1() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(17.w,15.h,0,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textBlack20SP_Med("Quick Searches"),
                  
                textgreyM16Sp("South African Cuisine"),
            
                sizedBoxHeight(15.h),
            
                SizedBox(
                  height: 120.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 9.w);
                    },
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return commanCard(index);
                    },
                  ),
                ),
            
                sizedBoxHeight(26.h),
            
                textgreyM16Sp("International Cuisine"),
            
                sizedBoxHeight(14.h),
            
                SizedBox(
                  height: 120.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 9.w);
                    },
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return commanCard(index + 1);
                    },
                  ),
                ),
            
                sizedBoxHeight(24.h),
            
                textBlack20SP_Med("Trending Tags"),
            
                // commonSelectButton()
                sizedBoxHeight(13.h),
            
            
            
                SizedBox(
                  height: 30.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 9.w);
                    },
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return commonSelectButton(index,index + 1);
                    },
                  ),
                ),
            
                sizedBoxHeight(8.h),
            
                SizedBox(
                  height: 30.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 9.w);
                    },
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return commonSelectButton(index, index);
                    },
                  ),
                ),

                sizedBoxHeight(20.h),
            
                textBlack20SP_Med("Popular Searches"),
            
                sizedBoxHeight(15.h),
                
            
              ],
            ),
          ),
      
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
      
          // padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.7,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.w,
              //  maxCrossAxisExtent: 200,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    // height: 120.h,
                    // width: 232.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.h),
                        image: DecorationImage(
                            image: index.isEven ? AssetImage("assets/home/food.png") : AssetImage("assets/Chocolate 2.png"),
                            fit: BoxFit.fill)),

                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: textWhite18Robo(
                          index.isEven ? "Bobotie" : "Ethiopian Doro Wat"
                        ),
                      ),
                    ),
                  ),

                  // Positioned(
                  //   bottom: 10.h,
                  //   right: 10.h,
                  //   child: textWhite12Robo(
                  //     index.isEven ? "Bobotie" : "Ethiopian Doro Wat"
                  //   ),
                  // )

                ],
              );


              // return Container(
              //   // height: 14.h,
              //   // width: 14.w,
              //   decoration: BoxDecoration(
                  
              //       image: DecorationImage(
              //           image: index.isEven
              //               ? AssetImage("assets/home/17.png",
                              
              //               )
              //               : AssetImage("assets/home/12.png"),
              //           fit: BoxFit.cover
              //           // Image.asset("name")
              //           )),
              // );
              // // Image.asset("assets/home/17.png",
              // //   height: 150.h,
              //   width: 150.h,
              // );
            },
          ),
            )
        
        ],
      ),
    );
  }

  Widget tabbarView2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 9.h, 16.w, 0),
            // padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 9.h),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    communityTile(),
                    Divider(
                      color: Color(0xff979797),
                      thickness: 0.2.h,
                    )
                  ],
                );
                // Column(
                //   children: [listCard(), sizedBoxHeight(13.h)],
                // );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget communityTile(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 16.w,
          ),
          Stack(
            children: [
              SizedBox(
                width: 50,
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.grey,
                  child: Image.asset(
                    "assets/Mask Group 86.png",
                    height: 50,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0.h,
                  left: 35.w,
                  child: SvgPicture.asset(
                    "assets/rating-svgrepo-com.svg",
                    height: 22,
                  )),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Priyanka Joshi",
                style: TextStyle(
                    fontFamily: "StudioProR",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF54595F)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "@priyujoshi",
                style: TextStyle(
                    fontFamily: "StudioProR",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(59, 63, 67, 0.49)),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFF3B3F43),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    "Follow",
                    style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ),
    
          SizedBox(
            width: 16.w,
          )
        ],
      ),
    );
          
  }

  Widget commanCard(int index){
    return Stack(
      children: [
        Container(
          height: 120.h,
          width: 232.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.h),
              image: DecorationImage(
                  image: index.isEven ? AssetImage("assets/home/food.png") : AssetImage("assets/Chocolate 2.png"),
                  fit: BoxFit.fill)),
        ),

        Positioned(
          top: 8.h,
          left: 10.w,
          child: UnconstrainedBox(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.h),
                  color: AppColors.greyL979797.withOpacity(0.7)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/bottomBar/food.svg",
                      height: 11.h,
                      width: 13.w,
                      color: AppColors.white,
                    ),
                    sizedBoxWidth(4.w),
                    textWhite12Sp(
                      index.isEven ? "Limpopo" : "Mpumalanga")
                  ],
              
                ),
              ),
            ),
          ),
        ),
      
      ],
    );

  }

  Widget commonSelectButton(int index, int add){
    return UnconstrainedBox(
      child: Container(
        height: 30.h,
        // width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.h),
          color: index == 0 ? AppColors.greyL979797 : AppColors.greyM707070),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Center(
            child: textWhite12Sp(
              add.isEven ? "Limpopo" : "Simple greens"
            )
          ),
        ),
      ),
    );
  }
}
