// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:foodspeciality/utils/colors.dart';
// import 'package:foodspeciality/utils/texts.dart';
// import 'package:get/get.dart';

// import '../../../../Model/FollowesModel.dart';
// import '../../../../common files/global.dart';
// import '../../../../common files/sized_box.dart';
// import '../../../../controllers/user_data_controller.dart';
// import '../../../../services/follow_service.dart';
// import '../../../../services/follower_following_service.dart';
// import '../../explore/controller/explore_controller.dart';

// class myFollowingCard extends StatefulWidget {
//   const myFollowingCard({
//     super.key,
//   });

//   @override
//   State<myFollowingCard> createState() => _myFollowingState();
// }

// class _myFollowingState extends State<myFollowingCard> {
//   int currentIndex = 0;

//   var futureData;
//   List<Followers>? followers;
//   final FollowerFollowing followerFollowing = FollowerFollowing();
//   // ExploreController controllerExplore = Get.put(ExploreController());

//   UserDataController userDataController = Get.put(UserDataController());


//   // List<>? followings;



//   // int index = 0;

//   void _removeFollower({required String userId}) async {
//     try {
//       var resp = await FollowService.removeFollower(userId);
//       print("remove $resp");
//       if (resp) {
//         setState(() {
//           futureData = followerFollowing.getfollowfollowing();
//           userDataController.getUserProfile();

//         });

//         // followings
//         // print(object)sest
//         // setState(() {
//         //   followings![index].following!.isFollowing = !followings![index].following!.isFollowing;
//         // });
//       }
//       Get.back();
//     } catch (e) {
//       // Handle error here
//       print('Error Following user: $e');
//     }
//   }

// // >>>>>>> 5b0778e24c2631c7adfe2d784a7171fd93bad57f
//   @override
//   void initState() {
//     super.initState();
//     futureData = followerFollowing.getfollowfollowing();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 8.w),
//         child: Column(
//           children: [
//             FutureBuilder<Followes>(
//               future: futureData,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasData) {
//                   followers = snapshot.data!.data!.followers;
//                   return ListView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: followers!.length,
//                     itemBuilder: (context, index) {
//                       final follower = followers![index].follower;
//                       return followinglistCard(
//                           profileImage: follower!.profileImage,
//                           name: follower.firstName! + " " + follower.lastName!,
//                           userName: follower.username!,
//                           userId: follower.id!,
//                           index: index,
//                           isFollower: follower.isFollowing);
//                     },
//                   );
//                 } else if (snapshot.hasError) {
//                   return const Center(child: Text('Failed to load followers'));
//                 } else {
//                   return Container();
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget followinglistCard({
//     String? profileImage,
//     required String name,
//     required String userName,
//     required String userId,
//     required int index,
//     required bool isFollower,
//   }) {


//     return Column(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: 16.w,
//             ),
//             Stack(
//               children: [
//                 Container(
//                   width: 50.h,
//                   height: 50.h,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25.h),
//                       image: profileImage == null
//                           ? DecorationImage(
//                               image: AssetImage("assets/default_profile.webp"),
//                               fit: BoxFit.fill)
//                           : DecorationImage(
//                               image: NetworkImage(
//                                   ApiUrls.base + "${profileImage}"),
//                               fit: BoxFit.fill)),
//                 ),
//                 Positioned(
//                   bottom: 0.h,
//                   left: 35.w,
//                   child: SvgPicture.asset(
//                     "assets/rating-svgrepo-com.svg",
//                     height: 22.h,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   // title,
//                   name,
//                   // "Priyanka Joshi",
//                   style: TextStyle(
//                       fontFamily: "StudioProR",
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.bold,
//                       color: const Color(0xFF54595F)),
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 Text(
//                   // name,
//                   "@$userName",
//                   //    "@priyujoshi",
//                   style: TextStyle(
//                       fontFamily: "StudioProR",
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w500,
//                       color: const Color.fromRGBO(59, 63, 67, 0.49)),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             InkWell(
  
//   <<<<<<< HEAD
//   removeDailog({String? profileImage, required String userName}) {
// =======
//   removeDailog({String? profileImage,
//     required String userName,
//     required String userId
//   }) {
// >>>>>>> 5b0778e24c2631c7adfe2d784a7171fd93bad57f
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//         insetPadding: const EdgeInsets.symmetric(vertical: 10),
//         content: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 50.h,
//               height: 50.h,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25.h),
//                   image: profileImage == null
//                       ? DecorationImage(
//                           image: AssetImage("assets/default_profile.webp"),
//                           fit: BoxFit.fill)
//                       : DecorationImage(
//                           image: NetworkImage(ApiUrls.base + "${profileImage}"),
//                           fit: BoxFit.fill)),
//             ),
//             sizedBoxWidth(10.w),
// <<<<<<< HEAD
//             Text(
//               "Are you sure you want to remove @$userName",
//               style: TextStyle(
//                   fontFamily: 'Roboto',
//                   fontSize: 16.sp,
//                   color: const Color(0xff54595F)),
// =======
             
//             Flexible(
//               child: Text(
//                 "Are you sure you want to remove @$userName",
//                 style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontSize: 16.sp,
//                     color: const Color(0xff54595F)),
//               ),
// >>>>>>> 5b0778e24c2631c7adfe2d784a7171fd93bad57f
//             ),
//           ],
//         ),
//         actions: [
//           InkWell(
//             onTap: () {
//               Get.back();
//             },
//             child: Text(
//               "Cancel",
//               style: TextStyle(
//                   fontFamily: "Roboto",
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16.sp,
//                   color: const Color(0xff000000)),
//             ),
//           ),
//           sizedBoxWidth(15.sp),
//           InkWell(
// <<<<<<< HEAD
//             onTap: () async {},
// =======
//             onTap: () async {
//               _removeFollower(userId: userId);
//             },
// >>>>>>> 5b0778e24c2631c7adfe2d784a7171fd93bad57f
//             child: Text(
//               "Remove",
//               style: TextStyle(
//                   fontFamily: "Roboto",
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16.sp,
//                   color: const Color(0xffB90101)),
//             ),
//           ),
//           sizedBoxWidth(15.w),
//         ],
//       ),
//     );
//   }



// }
