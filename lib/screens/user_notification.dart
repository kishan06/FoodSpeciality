import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/notification_controller.dart';
import '../utils/colors.dart';
import '../utils/texts.dart';

class UserNotifications extends StatefulWidget {
  const UserNotifications({super.key});

  @override
  State<UserNotifications> createState() => _UserNotificationsState();
}

class _UserNotificationsState extends State<UserNotifications> {

  NotificationController notificationController = Get.put(NotificationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationController.getNotificationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleTxt: "Notifications"),
      body: GetBuilder<NotificationController>(builder: (builder){
        return notificationController.isLoading 
        ? Center(child: CircularProgressIndicator()) 
        : notificationController.notificationData == null
        ? Center(child: textgrey18BoldSP("Something went wrong"))
        : notificationController.notificationData!.data.userNotification.isEmpty 
        ? Center(child: textgrey18BoldSP("No notifications"))
        // ? /
        :Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ListView.builder(itemBuilder: (){

                      // })
                      // Text(
                      //   "Notifications",
                      //   style: TextStyle(
                      //       fontFamily: 'Studio Pro',
                      //       fontSize: 20.sp,
                      //       fontWeight: FontWeight.w500,
                      //       color: const Color(0xff54595F)),
                      // ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: notificationController.notificationData!.data.userNotification.length,
                        itemBuilder: (context, index) {
                          // print("length");
                          // print(notificationController.notificationData!.data.userNotification.length);
                          final data = notificationController.notificationData!.data.userNotification[index];
                          final type  = data.type;
                          // print(type);
                          print(index);
                          String originalDate = data.createdAt;
                          DateTime parsedDate = DateTime.parse(originalDate);
                          String formattedDate = DateFormat('dd/mm/yyyy').format(parsedDate);
                          String formattedTime = DateFormat('h:mm a').format(parsedDate);
                      
                          print(formattedDate);
                          print(formattedTime);
                          final time = formattedDate + " " + formattedTime;
                      
                          // return SizedBox();
                          if (type == "profile") {
                            print("profile");
                            return tileForFollowing(
                              image: data.associatedUser.profileImage,
                              msg: data.message, 
                              time: time, 
                              following: data.isFollowedByReqIdUser,
                              userId: data.associatedUser.id
                            );
                          } else if (type == "community") {
                            print("post");
                            return tileForCommunity(
                              image: data.associatedUser.profileImage,
                              msg: data.message, 
                              time: time
                            );
                          } else if(type == "post") {
                            print("community");

                            return tileForPost(
                              image: data.associatedUser.profileImage,
                              msg: data.message, 
                              time: time,
                              recipeId: data.postId!
                            );
                          } else {
                            return SizedBox();
                          }
                          // else if (){

                          // }
                          // return tileForFollowing(
                      
                          // );
                          // return SizedBox();
                          // return Column(
                          //   children: [
                          //     tileForlist(
                          //         controllerHome.commentLike[index]["comment"],
                          //         controllerHome.commentLike[index]["like"],
                          //         index,
                          //         controllerHome
                          //         ),
                          //     sizedBoxHeight(13.h)
                          //   ],
                          // );
                        },
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        
        
      
      })
      
    );
  }

  tileForFollowing({
    String? image, 
    required String msg, 
    required String time,
    required bool following,
    required String userId
  }){
    return 
    
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: (){
            // Get.toNamed("/viewuser");
            Get.toNamed("/viewuser",
              arguments: {
                  "userid": userId
              }
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: image == null 
              ? AssetImage('assets/default_profile.webp')
              : Image.network(ApiUrls.base + image) as ImageProvider
            ),
            title: Text(
              msg,
              // "Mokshada Kesarkar started Following you",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff000000)),
            ),
            subtitle: Text(
              time,
              // "\n09.20 AM",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff3B3F43)),
            ),
            trailing: following
            // recipeData!.following!
                ? Container(
                        width: 80.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(
                              8.r),
                      border: Border.all(
                        color: const Color(
                            0xFF3B3F43),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.all(5.h),
                      child: Center(
                        child: textgreyD14Robo(
                            "Following"),
                      ),
                    ),
                  )
                : Container(
                    //  width: 80.w,
                    width: 80.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color:
                          AppColors.greyD3B3F43,
                      borderRadius:
                          BorderRadius.circular(
                              8.r),
                      border: Border.all(
                          color: Colors
                              .grey.shade700),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.all(5.h),
                      child: Center(
                        child: textWhite14Robo(
                            "Follow"),
                      ),
                    ),
                  ),
            // SizedBox(
            //   height: 31.h,
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           side: BorderSide(
            //               width: 1.sp, color: const Color(0xff3B3F43)),
            //           elevation: 0,
            //           backgroundColor: Colors.white,
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(8.sp))),
            //       onPressed: () {},
            //       child: Text(
            //         "Following",
            //         style: TextStyle(
            //             fontFamily: 'Studio Pro',
            //             fontSize: 14.sp,
            //             color: const Color(0xff3B3F43)),
            //       )),
            // ),
          ),
        ),
       
       
        const Divider(
          color: Color(0xff7070707a),
          thickness: 0.2,
        ),
      ],
    );
  }

  tileForCommunity({
    String? image, 
    required String msg, 
    required String time,
    // required bool following
  }){
    return Column(
      children: [
        InkWell(
          onTap: (){
            
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: image == null 
              ? AssetImage('assets/defaultGroup2.png')
              : Image.network(ApiUrls.base + image) as ImageProvider
            ),
            title: Text(
              msg,
              // "You are invited to join WDIPL Community",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff000000)),
            ),
            subtitle: Text(
              time,
              // "\n09.20 AM",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff3B3F43)),
            ),
            trailing: SizedBox(
              height: 31.h,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromRGBO(84, 89, 95, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp))),
                  onPressed: () {
                    // buildSubscriptionPlan();
                  },
                  child: Text(
                    "View",
                    style: TextStyle(
                        fontFamily: 'Studio Pro',
                        fontSize: 14.sp,
                        color: Colors.white),
                  )),
            ),
          ),
        ),
        const Divider(
          color: Color(0xff7070707a),
          thickness: 0.2,
        ),
      ],
    );
  }

  tileForPost({
    String? image, 
    required String msg, 
    required String time,
    required String recipeId
    // required bool following
  }){
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: image == null 
            ? AssetImage('assets/default_profile.webp')
            : Image.network(ApiUrls.base + image) as ImageProvider
          ),
          title: Text(
            msg,
            // "You are invited to join WDIPL Community",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff000000)),
          ),
          subtitle: Text(
            time,
            // "\n09.20 AM",
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff3B3F43)),
          ),
          trailing: SizedBox(
            height: 31.h,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(84, 89, 95, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp))),
                onPressed: () {
                  // Get.toNamed("");
                  Get.toNamed("/InspirationRecipeComment",
                    arguments: recipeId
                  );
                  // buildSubscriptionPlan();
                },
                child: Text(
                  "View",
                  style: TextStyle(
                      fontFamily: 'Studio Pro',
                      fontSize: 14.sp,
                      color: Colors.white),
                )),
          ),
        ),
        const Divider(
          color: Color(0xff7070707a),
          thickness: 0.2,
        ),
      ],
    );
  }


  buildSubscriptionPlan() {
    return showDialog(
      context: context,
      builder: (context) => Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                  side: const BorderSide(color: Colors.white),
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: const Icon(
                              Icons.close,
                              color: Color(0xff54595F),
                            ),
                          ),
                        )
                      ],
                    ),
                    sizedBoxHeight(10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "WDIPL Community",
                        style: TextStyle(
                            fontFamily: 'Studio Pro',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: const Color(0xff54595F)),
                      ),
                    ),
                    const Divider(
                      color: Color(0xff7070707a),
                      thickness: 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff979797))),
                        margin: EdgeInsets.only(left: 11.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBoxHeight(9.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Community Description",
                                  style: TextStyle(
                                      fontFamily: 'Studio Pro',
                                      fontSize: 17.sp,
                                      color: const Color(0xff000000)),
                                ),
                              ],
                            ),
                            sizedBoxHeight(8.h),
                            Text(
                              "Lorem Ipsum is simply dummy text \nof the printing and typesetting industry. \nLorem Ipsum has been the industry's",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.sp,
                                  color: const Color(0xff54595F)),
                            ),
                            sizedBoxHeight(20.h),
                          ],
                        ),
                      ),
                    ),
                    sizedBoxHeight(17.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 9.w),
                          child: SizedBox(
                            width: 150.w,
                            height: 40.h,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        const Color.fromRGBO(84, 89, 95, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.sp))),
                                onPressed: () {
                                  Get.back();
                                  Get.toNamed("/chatcommunitydetail");
                                },
                                child: Text(
                                  "Accept",
                                  style: TextStyle(
                                      fontFamily: 'Studio Pro',
                                      fontSize: 14.sp,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9.w, right: 20.w),
                          child: SizedBox(
                            width: 150.w,
                            height: 40.h,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor:
                                        const Color.fromRGBO(84, 89, 95, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.sp))),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  "Reject",
                                  style: TextStyle(
                                      fontFamily: 'Studio Pro',
                                      fontSize: 14.sp,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 255.h,
              right: 0,
              left: 0,
              child: CircleAvatar(
                  radius: 44.r,
                  child:
                      Image.asset("assets/user notification/popuplogo.png"))),
        ],
      ),
    );
  }
}
