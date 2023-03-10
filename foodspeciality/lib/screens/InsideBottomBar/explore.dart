import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/search_noti.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
// import 'package:foodspeciality/common%20files/texts.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          searchNotification(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textgreyM20BoldSP("Join a cooking challenge"),
                sizedBoxHeight(7.h),
                mainChallengesCard(),
                sizedBoxHeight(25.h),
                textgreyM20BoldSP("Trending Recipes")
              ],
            ),
          ),

          sizedBoxHeight(11.h),

          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 98.h,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 9.w);
                    },
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return trendingRecipeCard();
                    },
                  ),
                ),

                sizedBoxHeight(20.h),
                // trendingRecipeCard()
                // textgreyM20BoldSP("Trending Recipes"),
                textgreyM20BoldSP("Explore"),

                sizedBoxHeight(15.h),
              ],
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //   child: Column(

          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       textgreyM20BoldSP("Explore"),

          //       sizedBoxHeight(7.h),

          //     ],
          //   ),
          // ),

          Expanded(
            child:
                // GridView.count(
                //     crossAxisCount: 3,
                //     childAspectRatio: 1.2,
                //     // crossAxisSpacing: 2,
                //     // mainAxisSpacing: ,
                //     children: List.generate(8, (index) {
                //       return Center(
                //         child: Image.asset("assets/home/17.png",
                //           // height: 100.h,
                //           // width: 100.h,
                //         ),
                //         // child: SelectCard(choice: choices[index]),
                //       );
                //     }
                //     )
                // )
                Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),

              // padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //  childAspectRatio: 1.2,
                  crossAxisSpacing: 7.w,
                  mainAxisSpacing: 7.w,
                  //  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: index == index.isEven
                                ? AssetImage("assets/home/17.png")
                                : AssetImage("assets/home/12.png"),
                            fit: BoxFit.cover
                            // Image.asset("name")
                            )),
                  );
                  // Image.asset("assets/home/17.png",
                  //   height: 150.h,
                  //   width: 150.h,
                  // );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget trendingRecipeCard() {
    return Container(
      height: 97.h,
      width: 250.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyL979797),
        borderRadius: BorderRadius.circular(9.h),
        // color: AppColors.lightBlueF2F2F2,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 58.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.h),
                      image: const DecorationImage(
                          image: AssetImage("assets/home/food_bowl.png"),
                          fit: BoxFit.fill)),
                ),
                sizedBoxWidth(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // textWhite17w500("George Smith"),
                    // e=
                    textBlack14SP_Med("Bunny Chow"),
                    // textgreyD16BoldSP("Priyanka Joshi"),

                    sizedBoxHeight(5.h),

                    textgreyM10Robo("@Priyujoshi")

                    // textgreyD12Robo("2 Days ago")

                    // textGrey15W500("21 Jan, 2022, 10:41 am")
                  ],
                )
              ],
            ),

            // sizedBoxHeight(.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Row(
                    //   children: [
                    //     Image.asset("assets/icons/like.png",
                    //       width: 18.w,
                    //       height: 16.h,
                    //     ),

                    //     textBlack10Robo("55")
                    //   ],
                    // ),

                    iconText("assets/icons/like.png", "55"),

                    sizedBoxWidth(25.w),

                    // InkWell(
                    //   onTap: (){
                    //     // commentbottomSheet();
                    //   },
                    //   child: Image.asset("assets/icons/comment.png",
                    //     width: 18.w,
                    //     height: 16.h,
                    //   ),
                    // ),

                    iconText("assets/icons/comment.png", "30"),

                    sizedBoxWidth(25.w),

                    // InkWell(
                    //   // onTap: share,
                    //   // (){
                    //   //   shar
                    //   //   // Share.share('https://www.google.co.in/');
                    //   // },
                    //   child: Image.asset("assets/icons/share.png",
                    //     width: 18.w,
                    //     height: 16.h,
                    //   ),
                    // ),
                    iconText("assets/icons/save.png", "25"),
                  ],
                ),

                // Image.asset("assets/icons/save.png",
                //   width: 18.w,
                //   height: 16.h,
                // ),
                Row(
                  children: [
                    // Image.asset(imagePath,
                    //   width: 18.w,
                    //   height: 16.h,
                    //   color: AppColors.greyM707070,
                    // ),
                    SvgPicture.asset(
                      "assets/icons/time.svg",
                      height: 16.h,
                      width: 18.w,
                      color: AppColors.greyM707070,
                      // colorFilter: AppColors.greyD3B3F43,
                    ),

                    sizedBoxWidth(2.w),

                    textBlack10Robo("30 Min")
                  ],
                ),
                // iconText("assets/icons/save.png", "30 Min")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget iconText(String imagePath, String text) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 18.w,
          height: 16.h,
          color: AppColors.greyM707070,
        ),
        sizedBoxWidth(2.w),
        textBlack10Robo(text)
      ],
    );
  }

  Widget mainChallengesCard() {
    return Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textBlack18SP_Bold('The "Main" Mains Challenges'),
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
            textgreyM10Robo("17 recipes shared so for!"),
            sizedBoxHeight(5.h),
            SizedBox(
              height: 119.h,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return index == 2 ? SizedBox() : SizedBox(width: 7.w);
                },
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return sharedRecipeCard();
                },
              ),
            ),
            sizedBoxHeight(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed("/joinchallenge");
                    },
                    child: textBlack14SP_Med("Join Challenge")),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.black,
                  size: 15.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sharedRecipeCard() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
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
                width: 113.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h),
                    image: DecorationImage(
                        image: AssetImage("assets/home/food_bowl.png"),
                        fit: BoxFit.fill)),
              ),
              sizedBoxHeight(5.h),
              textgreyD10Robo("Slappappoffer Recipe"),
              sizedBoxHeight(5.h),
            ],
          ),
        ),
      ),
    );
  }
}
