import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowers/myFollowerContent.dart';

import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingContent.dart';
import 'package:foodspeciality/screens/viewUser.dart';
import 'package:get/get.dart';


import '../../../../Model/FollowesModel.dart';
import '../../../../services/follower_following_service.dart';
import '../../../../utils/texts.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class MyfollowingCardNew extends StatefulWidget {
  const MyfollowingCardNew({
    super.key,
  });

  @override
  State<MyfollowingCardNew> createState() => _myFollowerCardState();
}

class _myFollowerCardState extends State<MyfollowingCardNew> {
  int currentIndex = 0;

  // get followerFollowing => null;
  final FollowerFollowing followerFollowing = FollowerFollowing();
  // extension StringCasingExtension on String {
  //   String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  //   String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
  // }

  // int index = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          FutureBuilder<Followes>(
            future: followerFollowing.getfollowfollowing(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final followings = snapshot.data!.data!.followings;
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: followings!.length,
                  itemBuilder: (context, index) {
                    final following = followings[index].following!;

                    return followerlistCard(
                      // followerData[index]["recipeimage"],
                      following.profileImage,

                      // followerData[index]["title"],
                      following.firstName! + " " + following.lastName!,
                      // followerData[index]["name"],
                      following.username,
                      index,
                      followerData[index]["isFollowedByMe"],
                    );
                    // final follower = followers[index].follower;
                    // return invite(
                    //   firstname: follower!.firstName!,
                    //   username: follower.username!,
                    //   profileimage: follower.profileImage,
                    //   userId: follower.id!,
                    //   index: index,
                    //   selectedIds: selectedIds,
                    //   onInvitePressed: (id) {
                    //     // Handle invite button pressed
                    //     print('Invite button pressed for: $id');
                    //   },
                    // );
                  },
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Failed to load followers'));
              } else {
                return Container();
              }
            },
          ),

          // ListView.builder(
          //     physics: const NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: followerData.length,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         children: [
          //           followerlistCard(
          //             followerData[index]["recipeimage"],
          //             followerData[index]["title"],
          //             followerData[index]["name"],
          //             index,
          //             followerData[index]["isFollowedByMe"],
          //           )
          //         ],
          //       );
          //     })
        ],
      ),
    );
  }

  Widget followerlistCard(dynamic profileImage, String title, dynamic name,
      int index, int isFollowedByMe) {
    // bool like = false;

    return Container(
        child: Column(
      children: [
        Container(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 16.w,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 50.w,
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.grey,
                      child: Image.asset(
                        profileImage ?? "assets/Mask Group 86.png",
                        height: 50.h,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    left: 35.w,
                    child: SvgPicture.asset(
                      "assets/rating-svgrepo-com.svg",
                      height: 22.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toTitleCase(),
                    // "Priyanka Joshi",
                    style: TextStyle(
                        fontFamily: "StudioProR",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF54595F)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    name,
                    //    "@priyujoshi",
                    style: TextStyle(
                        fontFamily: "StudioProR",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(59, 63, 67, 0.49)),
                  ),
                ],
              ),

              const Spacer(),

              // Container(
              //   //  width: 80.w,
              //   decoration: BoxDecoration(
              //     color:
              //         AppColors.greyD3B3F43,
              //     borderRadius:
              //         BorderRadius.circular(
              //             8.r),
              //     border: Border.all(
              //         color: Colors
              //             .grey.shade700),
              //   ),
              //   child: Padding(
              //     padding:
              //         EdgeInsets.all(5.h),
              //     child: Center(
              //       child: textWhite14Robo(
              //           "Follow"),
              //     ),
              //   ),
              // )
              InkWell(
                onTap: (){
                  
                },
                child: Container(
                  //     width: 60.w,
                  // height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: const Color(0xFF3B3F43),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.h),
                    child: Center(child: textgreyD14Robo("Following")
                        // Text(
                        //   "Following",
                        //   style: TextStyle(
                        //     fontFamily: "StudioProR",
                        //     fontSize: 14.sp,
                        //     fontWeight: FontWeight.w500,
                        //     color: Color(0xFF3B3F43),
                        //   ),
                        // ),
                        ),
                  ),
                ),
              ),

              // InkWell(
              //     onTap: () {
              //       // Get.snackbar(
              //       //     snackPosition: SnackPosition.BOTTOM, "", "Removed");
              //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //           backgroundColor: Colors.grey,
              //           content: Center(child: Text('Removed'))));
              //     },
              //     child:
              //         // Container(
              //         //     height: 30,
              //         //     decoration: BoxDecoration(
              //         //       color: Colors.white,
              //         //       borderRadius: BorderRadius.circular(8),
              //         //       border: Border.all(
              //         //         color: Color(0xFF3B3F43),
              //         //       ),
              //         //     ),
              //         //     child: Padding(
              //         //       padding: EdgeInsets.symmetric(horizontal: 16.0),
              //         //       child: Center(
              //         //         child: Text(
              //         //           "Remove",
              //         //           style: TextStyle(
              //         //             fontFamily: "StudioProR",
              //         //             fontSize: 14.sp,
              //         //             fontWeight: FontWeight.w500,
              //         //             color: Color(0xFF3B3F43),
              //         //           ),
              //         //         ),
              //         //       ),
              //         //     ),
              //         //   )
              //         Container(
              //       height: 30.h,
              //       decoration: BoxDecoration(
              //         color: const Color(0xFF3B3F43),
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 16.w),
              //         child: Center(
              //           child: Text(
              //             "Remove",
              //             style: TextStyle(
              //               fontFamily: "StudioProR",
              //               fontSize: 14.sp,
              //               fontWeight: FontWeight.w500,
              //               color: const Color(0xFFFFFFFF),
              //             ),
              //           ),
              //         ),
              //       ),
              //     )),

              SizedBox(
                width: 16.w,
              )
            ],
          ),
        ),
        Divider(
          endIndent: 20.w,
          indent: 20.w,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    ));
  }
}
