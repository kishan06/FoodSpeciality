
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../common files/sized_box.dart';
import '../../../utils/colors.dart';
import '../../../utils/texts.dart';
import '../../edit_profile.dart';
import '../../setting/setting/setting.dart';

class NewChangedProfile extends StatefulWidget {
  const NewChangedProfile({super.key});

  @override
  State<NewChangedProfile> createState() => _NewChangedProfileState();
}

class _NewChangedProfileState extends State<NewChangedProfile> {

  double? profileCompleted = 0.7;
  ScrollController? _scrollviewcontroller;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFFFFFFFF),
            centerTitle: true,
            title: Text(
              "Complete Your Profile",
              style: TextStyle(
                  fontFamily: "StudioProR",
                  fontSize: 16.sp,
                  color: Colors.black),
            ),
            actions: [
              InkWell(
                onTap: () {
                  // Get.to(EditProfile());
                  // Get.toNamed("/EditProfile");
                  Get.to(EditProfile(),
                      duration:
                          const Duration(milliseconds: 500),
                      transition: Transition.downToUp);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 30.h,
                ),
              ),
              sizedBoxWidth(20.w),
              GestureDetector(
                onTap: () {
                  // Get.toNamed("/setting");
                  Get.to(const Setting(),
                      duration:
                          const Duration(milliseconds: 500),
                      transition: Transition.downToUp);
                },
                child: Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                  size: 30.h,
                ),
              ),
              sizedBoxWidth(18.w)
            ],
          ),
      body: NestedScrollView(
          // controller: _scrollviewcontroller,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (context, index) => DefaultTabController(
            length: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      // SizedBox(
                      //   // height: 200.w,
                      //   // width: 200.w,
                      //   child: CircularProgressIndicator(
                      //     value: 0.42,
                      //     strokeWidth: 5.w,
                      //     // semanticsValue: "df",
                      //     // color: AppColors.redFA5658,
                      //     backgroundColor: AppColors.lightBlueF2F2F2,
                      //     valueColor: AlwaysStoppedAnimation(Colors.red),
                      //   ),
                      // ),
                
                      sizedBoxWidth(10.w),
                
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 80.h,
                            height: 80.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 3.h,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    // offset: Offset(0, 3), // changes the position of the shadow
                                  ),
                                ],
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/profile.png"),
                                    fit: BoxFit.cover)),
                            // child: YourChildWidget(),
                          ),
                          SizedBox(
                            height: 75.h,
                            width: 75.h,
                            child: CircularProgressIndicator(
                              value: 0.7,
                              strokeWidth: 4.w,
                              // semanticsValue: "df",
                              // color: AppColors.redFA5658,
                              backgroundColor:
                                  AppColors.lightBlueF2F2F2,
                              valueColor: AlwaysStoppedAnimation(
                                  AppColors.grey54595F),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxWidth(5.w),
                
                      textgreyM14Robo((profileCompleted! * 100)
                              .toStringAsFixed(0) +
                          " %"),
                
                      sizedBoxWidth(10.w),
                
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          //   Text(
                          //   "Namrata Burondkar",
                          //   style: TextStyle(
                          //       fontFamily: "Roboto",
                          //       fontSize: 18.sp,
                          //       fontWeight: FontWeight.w500,
                          //       color: const Color(0xFF54595F)),
                          // ),
                          textBlack18bold("Namrata Burondkar"),
                
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "@Namrata07",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(
                                    59, 63, 67, 0.49)),
                          ),
                        ],
                      ),
                
                      Spacer(),
                
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            20.w, 7.h, 20.w, 0),
                        decoration: BoxDecoration(
                            color: AppColors.lightBlueF2F2F2,
                            borderRadius:
                                BorderRadius.circular(8.r)),
                        child: Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/svg/Coin.png'),
                            Column(
                              children: [
                                textgreyM16Robo("500"),
                                // Obx(
                                //   () => Text(
                                //     totalCoins.string,
                                //     style: TextStyle(
                                //         fontSize: 17.sp,
                                //         fontWeight: FontWeight.w600),
                                //   ),
                                // ),
                                sizedBoxHeight(5.h)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 30.h),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30.h,
                          width: 20.h,
                          child: Image.asset(
                            "assets/svg/rankTag.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        textBlack18bold("Level : Bronze")
                        // Text(
                        //   "Level : Bronze",
                        //   style: TextStyle(
                        //       fontSize: 16.sp,
                        //       // fontFamily: "StudioProR",
                        //       fontWeight: FontWeight.w500),
                        // )
                      ],
                    ),
                
                    SizedBox(
                      height: 60.h,
                      child: VerticalDivider(
                        thickness: 3.w,
                      )
                    ),
                
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textBlack18bold("20"),
                        textBlack18bold("Following")
                        
                        // Text(
                        //   "Level : Bronze",
                        //   style: TextStyle(
                        //       fontSize: 16.sp,
                        //       // fontFamily: "StudioProR",
                        //       fontWeight: FontWeight.w500),
                        // )
                      ],
                    ),
                
                    SizedBox(
                      height: 60.h,
                      child: VerticalDivider(
                        thickness: 3.w,
                      )
                    ),
                
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textBlack18bold("30"),
                        textBlack18bold("Followers")
                        
                        // Text(
                        //   "Level : Bronze",
                        //   style: TextStyle(
                        //       fontSize: 16.sp,
                        //       // fontFamily: "StudioProR",
                        //       fontWeight: FontWeight.w500),
                        // )
                      ],
                    ),
                
                  ],
                ),
                
                sizedBoxHeight(15.h),
          
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/dart.svg",
                      height: 40.h,
                      width: 40.h,
                    ),
          
                    Expanded(
                      // height: 20.h,
                      child: TabBar(
                          // indicatorSize: i,
                          indicatorSize: TabBarIndicatorSize.label,
                    
                          indicatorColor: const Color(0xFF3B3F43),
                          // unselectedLabelStyle: const TextStyle(color: AppColors.grey),
                          labelColor: AppColors.black,
                          unselectedLabelStyle:
                              const TextStyle(color: Color(0xFF6B6B6B,)),
                          // labelStyle: TextStyle(color: Color(0xFF6B6B6B),fontSize: 12),
                          tabs: [
                            Tab(
                              child: Text(
                                
                                'MY CHALLENGES',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "StudioProR",
                                    fontWeight: FontWeight.bold,
                                    // color: const Color(0xff000000),
                                    fontSize: 12.sp),
                              ),
                            
                            ),
                    
                            Tab(
                              child: Text(
                                'JOINED',
                                textAlign: TextAlign.center,
                    
                                style: TextStyle(
                                    fontFamily: "StudioProR",
                                    fontWeight: FontWeight.bold,
                                    // color: const Color(0xff000000),
                                    fontSize: 12.sp),
                              ),
                            
                            ),
                    
                            Tab(
                              child: Text(
                                'COMPLETED',
                                textAlign: TextAlign.center,
                    
                                style: TextStyle(
                                    fontFamily: "StudioProR",
                                    fontWeight: FontWeight.bold,
                                    // color: const Color(0xff000000),
                                    fontSize: 12.sp),
                              ),
                            
                            ),
                    
                          ]),
                    ),
                  ],
                ),
                
                SizedBox(
                  height: 280.h,
                  child: TabBarView(children: [
                    mainChallengesCard(1),
                    mainChallengesCard(2),
                    mainChallengesCard(3),
                
                  ]),
                ),
          
              ],
            ),
          ),
                  ))          
      ];
          },
          body: Expanded(
                  child: DefaultTabController(
                    initialIndex: 0,
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 35.h,
                          // width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.h),
                                border:
                                    Border.all(color: AppColors.grey54595F, width: 1)),
                            child: ButtonsTabBar(
                              
                              buttonMargin: EdgeInsets.zero,
                              contentPadding: EdgeInsets.only(left: 70.w, right: 70.w),
                              radius: 20.h,
                              backgroundColor: AppColors.grey54595F,
                              unselectedBorderColor: Colors.white,
                              //borderWidth: 1,
                              //borderColor: Color(0XFf0E5F02),
                              unselectedBackgroundColor: Color(0xFFFFFFFF),
                              unselectedLabelStyle:
                                  TextStyle(color: AppColors.grey54595F),
                              labelStyle: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              tabs: [
                                Tab(
                                  text: "Recipes",
                                  // child: textBlack10Robo("sd"),
                                ),
                                Tab(
                                  text: "Saved ",
                                  // child: textBlack10Robo("sdf"),
                            
                                ),
                                // Tab(
                                //   text: "Repairmen",
                                // ),
                              ],
                            ),
                          ),
                        ),
                        sizedBoxHeight(10.h),
                        Expanded(
                          child: TabBarView(
                            children: [
                              tab1(),
                              tab1(),
                              

                              // FirstTab(),
                              // SecondTab(),
                              // ThirdTab(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        
    
        ),
   
    );
  }

  Widget tab1(){
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 13,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 7.w,
        mainAxisSpacing: 7.w,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.toNamed("/InspirationRecipeComment");
          },
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: index.isEven
                        ? AssetImage("assets/home/17.png")
                        : AssetImage("assets/home/12.png"),
                    fit: BoxFit.cover
                    // Image.asset("name")
                    )),
          ),
        );
      },
    );
             
  }


  Widget mainChallengesCard(int? tabNum) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Get.toNamed("/joinchallenge");
        },
        child: Container(
          // height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.h),
            color: AppColors.lightBlueF2F2F2,
            boxShadow: [
              BoxShadow(
                color: AppColors.greyL979797,
                blurRadius: 2.h,
                spreadRadius: 1.h,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 19.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textBlack18SP_Bold('The "Biryani" Challenge'),
                        textgreyD12Robo("10 Oct - 16 Oct")
                      ],
                    ),
                    Image.asset(
                      "assets/icons/trophy.png",
                      height: 38.h,
                      width: 39.w,
                    ),
                  ],
                ),
                sizedBoxHeight(12.h),
                // textgreyM10Robo("17 recipes shared so for!"),
                // sizedBoxHeight(5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) => sharedRecipeCard()),
                ),
      
                sizedBoxHeight(15.h),
      
                tabNum == 3 ?SizedBox() : Center(
                  child: SizedBox(
                    height: 40.h,
                    width: 100.w,
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
                        tabNum == 1 ? 'Join': "Joined",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.h,
                            fontFamily: "StudioProR"),
                      ),
                    ),
                  ),
                ),
                            
          
                // SizedBox(
                //   height: 119.h,
                //   child: ListView.separated(
                //     separatorBuilder: (context, index) {
                //       return index == 2 ? SizedBox() : SizedBox(width: 7.w);
                //     },
                //     scrollDirection: Axis.horizontal,
                //     physics: const BouncingScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: 4,
                //     itemBuilder: (context, index) {
                //       return sharedRecipeCard();
                //     },
                //   ),
                // ),
                // sizedBoxHeight(16.h),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sharedRecipeCard() {
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
                      image: AssetImage("assets/home/food_bowl.png"),
                      fit: BoxFit.fill)),
            ),
            // sizedBoxHeight(5.h),
            Spacer(),
            textgreyD10Robo("Slappappoffer Recipe"),
            // sizedBoxHeight(5.h),
            Spacer()
          ],
        ),
      ),
    );
  }


}

class MyHomePageWithNestedScrollViewAndFloatingAppBar extends StatelessWidget {
  const MyHomePageWithNestedScrollViewAndFloatingAppBar({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      // Changes the way the inner and outer scroll are linked together
      floatHeaderSlivers: true,
      // This builds the scrollable content above the body
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          title: const Text('App Bar'),
          expandedHeight: 200,
          floating: true,
          forceElevated: innerBoxIsScrolled,
        ),
      ],
      // The content of the scroll view
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'Text $index',
          ),
        ),
      ),
    );
  }
}