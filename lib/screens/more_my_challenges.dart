import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
// import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myMoreMyChallengess/myMoreMyChallengesCard.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingCard.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../common files/common_shared_recipe_card.dart';
import '../common files/common_view_rules.dart';
import '../common files/sized_box.dart';
import '../controllers/user_data_controller.dart';
import '../utils/texts.dart';

class MoreMyChallenges extends StatefulWidget {
  const MoreMyChallenges({super.key});

  @override
  State<MoreMyChallenges> createState() => _FollowingState();
}

ScrollController? followingcontroller;

class _FollowingState extends State<MoreMyChallenges> {

  UserDataController userDataController = Get.put(UserDataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final challengeNum = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: "Completed Challenges"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w,20.h,16.w,0),
        child: ListView.builder(
              itemCount: userDataController.myChallenges!.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.w),
                      child: InkWell(
                        onTap: () {
                          // if (tabNum == 3) {
                            Get.toNamed("/CompletedChallenge");
                          // } else {
                          //   Get.toNamed("/joinchallenge");
                          // // }
                          // Get.toNamed("/joinchallenge");
                        },
                        child: GetBuilder<UserDataController>(builder: (context){
                          final completedChallengeData = userDataController.myChallenges!.data[index];
                          final recipesShared = userDataController.myChallenges!.data[index].challengeRecipe;
                          String startDate = completedChallengeData.startDate;
                          DateTime parsedStartDate = DateTime.parse(startDate);
                          String formattedStartDate = DateFormat('d MMMM').format(parsedStartDate);
      
                          String endDate = completedChallengeData.endDate;
                          DateTime parsedEndDate = DateTime.parse(endDate);
                          String formattedEndDate = DateFormat('d MMMM').format(parsedEndDate);
                          return Container(
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
                                          // textBlack18SP_Bold('The "Biryani" Challenge'),
                                          textBlack18SP_Bold(completedChallengeData.title),
      
                                          // textgreyD12Robo("10 Oct - 16 Oct")
                                          textgreyD12Robo("$formattedStartDate - $formattedEndDate")
      
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
      
                                  recipesShared.isEmpty 
                                  ? textgrey18BoldSP("No recipes shared")
                                  : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                    List.generate(
                                      recipesShared.length, 
                                      (index) => Padding(
                                        padding: EdgeInsets.only(right: 5.w),
                                        child: sharedRecipeCard(
                                          recipeImage: recipesShared[index].receipe.coverImage,
                                          recipeName: recipesShared[index].receipe.name,
                                        ),
                                      )
                                    ),
                                  ),
      
                                  sizedBoxHeight(15.h),
      
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // tabNum == 3
                                      //     ? SizedBox()
                                      //     :
                                          // Row(
                                          //     children: [
                                          //       textBlack14SP_Med(
                                          //         // tabNum == 1
                                          //         //   ? "Join Challenge"
                                          //         //   : 
                                          //           "Joined Challenge"),
                                          //       Icon(
                                          //         Icons.arrow_forward_ios,
                                          //         color: AppColors.black,
                                          //         size: 15.h,
                                          //       ),
                                          //       sizedBoxWidth(15.w),
                                          //     ],
                                          //   ),
                                      GestureDetector(
                                          onTap: () {
                                            getViewRulesDailog();
                                          },
                                          child: textBlack14SP_Med("View Rules")),
                                    ],
                                  ),
      
                                ],
                              ),
                            ),
                          );
                      
                        })
                        
                      ),
                    ),
                    sizedBoxHeight(10.h)
                  ],
                );
              
              },
            ),
      )
       
    );
  }
}
