import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/Model/ViewUserModel.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/common/list_card.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingCard.dart';
import 'package:foodspeciality/services/follow_service.dart';
import 'package:foodspeciality/services/like_service.dart';
import 'package:foodspeciality/services/private_chatdetail_service.dart';
import 'package:foodspeciality/services/save_recipe.dart';
import 'package:foodspeciality/services/view_user_service.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class viewUser extends StatefulWidget {
  const viewUser({super.key});

  @override
  State<viewUser> createState() => _viewUserState();
}

ScrollController? controller;
ScrollController? _scrollviewcontroller;

class _viewUserState extends State<viewUser> {
  Future<ViewUserModel>? myfuture;

  bool isfollowing = false;

  final userId = Get.arguments["userid"];
  ViewUserModel? ViewUser;
  bool? isFollow;

  @override
  void initState() {
    myfuture = ViewUserService().fetchUserProfile(userId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _handleFollowButton(id) async {
      try {
        var resp = await FollowService.followRecipe(id ?? "");
        if (resp) {
          setState(() {
            // isFollow = !isFollow!;
          });
        }
      } catch (e) {
        // Handle error here
        print('Error Following user: $e');
      }
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFF3B3F43),
            ),
          ),
          actions: [
            PopupMenuButton(
              offset: const Offset(0, 50),
              color: const Color(0xFFFFFFFF),
              tooltip: '',
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(59, 63, 67, 0.49),
                  ),
                  // height: 30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                        child: Text(
                      "Links",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14.sm,
                      ),
                    )),
                  ),
                ),
              ),
              onSelected: (value) {
                if (value == '/logout') {
                } else if (value == "/myProfile") {
                  Get.toNamed('/myprofile');
                }
              },
              itemBuilder: (BuildContext bc) {
                return [
                  PopupMenuItem(
                    value: '',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/website-ui-web-svgrepo-com.svg",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Website",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: '',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/instagram-svgrepo-com.svg",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Instagram",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: '',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/twitter-svgrepo-com.svg",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Twitter",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: '',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/pinterest-svgrepo-com.svg",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Pintrest",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: '',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/facebook-svgrepo-com.svg",
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Facebook",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ];
              },
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.snackbar(
                  "Notifications",
                  "Notification turned on",
                );
              },
              child: Icon(
                Icons.notifications_none_outlined,
                color: Color(0xFF3B3F43),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            PopupMenuButton(
              offset: const Offset(0, 50),
              color: const Color(0xFFFFFFFF),
              tooltip: '',
              child: Icon(
                Icons.more_vert,
                color: Color(0xFF3B3F43),
              ),
              onSelected: (value) {
                if (value == 'share') {
                  share();
                } else if (value == "Report") {
                  Get.toNamed('/Report');
                } else if (value == "block") {
                  showDialog(
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsets.all(15.w),
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        insetPadding: const EdgeInsets.symmetric(vertical: 10),
                        title: Text(
                          "Block User",
                          style: TextStyle(
                              fontFamily: 'Studio Pro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: const Color(0xff3B3F43)),
                        ),
                        content: SizedBox(
                          // margin: EdgeInsets.symmetric(horizontal: 10.w),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Are you sure you want to Block @priyujoshi?",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.sp,
                                color: const Color(0xff54595F)),
                          ),
                        ),
                        actions: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color(0xff000000)),
                            ),
                          ),
                          sizedBoxWidth(15.sp),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed("/blocklistfull");
                              // Get.back();

                              // _canPop = true;
                            },
                            child: Text(
                              "Block User",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color(0xffB90101)),
                            ),
                          ),
                          sizedBoxWidth(15.sp),
                        ],
                      ),
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext bc) {
                return [
                  PopupMenuItem(
                    value: 'share',
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/share-svgrepo-com.svg",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Report',
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/question-circle-svgrepo-com.svg",
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              "Report",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'block',
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/block-svgrepo-com.svg",
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          "Block",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
            SizedBox(
              width: 13.w,
            ),
          ],
        ),
        body: FutureBuilder<ViewUserModel>(
          future: ViewUserService().fetchUserProfile(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              ViewUser = snapshot.data!;
              isFollow = ViewUser!.recipes!.first.following;
              return NestedScrollView(
                controller: _scrollviewcontroller,
                headerSliverBuilder:
                    (BuildContext context, bool boxIsScrolled) {
                  return <Widget>[
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: 1,
                            (context, index) => Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 150.h,
                                          height: 150.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(75.h),
                                              image: ViewUser!
                                                          .user!.profileImage ==
                                                      null
                                                  ? DecorationImage(
                                                      image:
                                                          // recipeData.user.profileImage == null
                                                          // ?
                                                          AssetImage(
                                                              "assets/default_profile.webp"),
                                                      // :
                                                      //  NetworkImage(
                                                      //     ApiUrls.base + "${recipeData.user!.profileImage}"),
                                                      fit: BoxFit.fill)
                                                  : DecorationImage(
                                                      image:
                                                          // recipeData.user.profileImage == null
                                                          // ?
                                                          // AssetImage("assetName")
                                                          // :
                                                          NetworkImage(ApiUrls
                                                                  .base +
                                                              "${ViewUser!.user!.profileImage!}"),
                                                      fit: BoxFit.fill)),
                                        ),
                                        Positioned(
                                            bottom: 0.h,
                                            left: 100.w,
                                            child: SvgPicture.asset(
                                                "assets/rating-svgrepo-com.svg")),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text(
                                      "${ViewUser!.user!.firstName} ${ViewUser!.user!.lastName}",
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
                                      "@${ViewUser!.user!.username}",
                                      style: TextStyle(
                                          fontFamily: "StudioProR",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(59, 63, 67, 0.49)),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Text(
                                      ViewUser!.user!.bio ?? "",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF54595F),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    isFollow ?? true
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  width: 150.w,
                                                  height: 40.h,
                                                  child: OutlinedButton(
                                                      style: ButtonStyle(
                                                        shape:
                                                            MaterialStateProperty
                                                                .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            side:
                                                                const BorderSide(
                                                              width: 3,
                                                              color: Color(
                                                                  0xFF3B3F43),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        _handleFollowButton(
                                                            ViewUser!.user!.id);
                                                      },
                                                      child: Text(
                                                        "Following",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "StudioProR",
                                                            fontSize: 18.sm,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: const Color(
                                                                0xFF3B3F43)),
                                                      )),
                                                ),
                                                SizedBox(
                                                  width: 150.w,
                                                  height: 40.h,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      elevation: 0,
                                                      // ignore: deprecated_member_use
                                                      primary: const Color(
                                                          0xFF3B3F43),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: const BorderSide(
                                                            color: Color(
                                                                0xFF707070)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.h),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                            "assets/messages.svg"),
                                                        SizedBox(
                                                          width: 10.h,
                                                        ),
                                                        Text(
                                                          "Message",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18.sm,
                                                            fontFamily:
                                                                'StudioProR',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onPressed: () {
                                                      Get.toNamed("/chatdetail",
                                                          arguments: {
                                                            "userid": ViewUser!
                                                                .user!.id,
                                                            "username":
                                                                ViewUser!.user!
                                                                    .username,
                                                            "profileimage":
                                                                ViewUser!.user!
                                                                    .profileImage,
                                                            "targetUserId":
                                                                ViewUser!
                                                                    .user!.id
                                                          });
                                                      PrivateChatDetailService()
                                                          .getPrivateChatDetailData(
                                                              ViewUser!.user!
                                                                      .id ??
                                                                  "");
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 103.0),
                                            child: CustomNextButton(
                                                text: "Follow",
                                                ontap: () {
                                                  _handleFollowButton(
                                                      ViewUser!.user!.id);
                                                }),
                                          ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                  ],
                                ))),
                  ];
                },
                body: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    TabBar(
                        indicatorColor: const Color(0xFF3B3F43),
                        unselectedLabelStyle:
                            const TextStyle(color: Color(0xFF6B6B6B)),
                        tabs: [
                          Tab(
                            height: 70.h,
                            child: Column(
                              children: [
                                Text(
                                  ViewUser!.recipes!.length.toInt().toString(),
                                  style: TextStyle(
                                      fontFamily: "StudioProR",
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff000000),
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  'Recipes',
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff54595F),
                                      fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            height: 70.h,
                            child: Column(
                              children: [
                                Text(
                                  ViewUser!.user!.followingLength!
                                      .toInt()
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: "StudioProR",
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff000000),
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff54595F),
                                      fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            height: 70.h,
                            child: Column(
                              children: [
                                Text(
                                  ViewUser!.user!.followersLength!
                                      .toInt()
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: "StudioProR",
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff000000),
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff54595F),
                                      fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(
                            controller: controller,
                            child: Column(
                              children: [
                                gridView(),
                                SizedBox(
                                  height: 20.h,
                                )
                              ],
                            )),
                        userFollowing(),
                        userFollower(),
                      ]),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Failed to load followers'));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget gridView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (0.45 / 0.5),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10),
                itemCount: ViewUser!.recipes!.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed("/InspirationRecipeComment");
                    },
                    child: gridCard(
                      index,
                    ),
                  );
                  // listCardData[index]["isFollowedByMe"]);
                }),
          ],
        ),
      ),
    );
  }

  Widget gridCard(
    int index,
  ) {
    // bool like = false;

    // print(griddata);
    bool? isLiked;
    bool? isSaved;

    void _handleLikeButton(id) async {
      try {
        var resp = await LikeService.likeRecipe(id ?? "");
        if (resp) {
          setState(() {
            isLiked = !isLiked!;
          });
        }
      } catch (e) {
        // Handle error here
        print('Error liking recipe: $e');
      }
    }

    void _handleSaveButton(id) async {
      try {
        var resp = await SaveService.saveRecipe(id ?? "");
        if (resp) {
          setState(() {
            isSaved = !isSaved!;
          });
        }
      } catch (e) {
        // Handle error here
        print('Error saving recipe: $e');
      }
    }

    isLiked = ViewUser!.recipes?.elementAt(index).liked;
    isSaved = ViewUser!.recipes?.elementAt(index).saved;

    return Container(
        height: 180.h,
        width: 190.w,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                3.0, // Move to right 5  horizontally
                3.0, // Move to bottom 5 Vertically
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.h),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.h),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "http://77.68.102.23:8000/${ViewUser!.recipes!.elementAt(index).coverImage}"),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7.0, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ViewUser!.recipes!.elementAt(index).name!,
                    style: TextStyle(fontFamily: "Roboto", fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    ViewUser!.recipes!.elementAt(index).name!,
                    style: TextStyle(
                        color: const Color(0xFF6B6B6B),
                        fontFamily: "Roboto",
                        fontSize: 10.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _handleLikeButton(
                                  ViewUser!.recipes!.elementAt(index).id);
                            },
                            child: isLiked!
                                ? Image.asset(
                                    "assets/icons/like_filled.png",
                                    width: 20.w,
                                    height: 18.h,
                                    // color: like == 0 ? AppColors.red:AppColors.black,
                                    // color: like ?AppColors.white : null ,
                                  )
                                : Image.asset(
                                    "assets/icons/like.png",
                                    width: 20.w,
                                    height: 18.h,
                                    // color: like == 0 ? AppColors.red:AppColors.black,
                                    // color: like ?AppColors.white : null ,
                                  ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            ViewUser!.recipes!
                                .elementAt(index)
                                .likes
                                .toString(),
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 12.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // commentbottomSheet(controllerHome);
                            },
                            child: Image.asset(
                              "assets/icons/comment.png",
                              width: 20.w,
                              height: 18.h,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 12.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _handleSaveButton(
                                  ViewUser!.recipes!.elementAt(index).id);
                              // setState(() {
                              //   listCardData[index]
                              //           ["save"] =
                              //       save == 0 ? 1 : 0;
                              // });
                            },
                            child: isSaved!
                                ? Image.asset(
                                    "assets/icons/save_filled.png",
                                    width: 20.w,
                                    height: 18.h,
                                  )
                                : Image.asset(
                                    "assets/icons/save.png",
                                    width: 20.w,
                                    height: 18.h,
                                  ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            ViewUser!.recipes!
                                .elementAt(index)
                                .savedLength
                                .toString(),
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 12.sp),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget userFollowing() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ViewUser!.userfollowing!.length,
                itemBuilder: (context, index) {
                  final following =
                      ViewUser!.userfollowing!.elementAt(index).following;
                  return followinglistCard(
                      profileImage: following!.profileImage,
                      name: following.firstName! + " " + following.lastName!,
                      userName: following.username!,
                      userId: following.id!,
                      index: index,
                      isFollower:
                          ViewUser!.userfollowing!.elementAt(index).isfollow!);
                })
          ],
        ),
      ),
    );
  }

  Widget followinglistCard({
    String? profileImage,
    required String name,
    required String userName,
    required String userId,
    required int index,
    required bool isFollower,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 16.w,
            ),
            Stack(
              children: [
                Container(
                  width: 50.h,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.h),
                      image: profileImage == null
                          ? DecorationImage(
                              image: AssetImage("assets/default_profile.webp"),
                              fit: BoxFit.fill)
                          : DecorationImage(
                              image: NetworkImage(
                                  ApiUrls.base + "${profileImage}"),
                              fit: BoxFit.fill)),
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
                  // title,
                  name,
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
                  // name,
                  "@$userName",
                  //    "@priyujoshi",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(59, 63, 67, 0.49)),
                ),
              ],
            ),
            Spacer(),
            ViewUser!.userfollowing!.elementAt(index).following!.id == myUserId
                ? SizedBox()
                : InkWell(
                    onTap: () {
                      removeDailog(userName: userName, index: index);
                    },
                    child: Container(
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: AppColors.greyD3B3F43,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Colors.grey.shade700),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: textWhite14Robo("Remove"),
                        ),
                      ),
                    )),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
        Divider(
          endIndent: 20.w,
          indent: 20.w,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }

  Widget userFollower() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ViewUser!.userfollower!.length,
                itemBuilder: (context, index) {
                  final follower =
                      ViewUser!.userfollower!.elementAt(index).follower;
                  return followerlistCard(
                      profileImage: follower!.profileImage,
                      name: follower.firstName! + " " + follower.lastName!,
                      userName: follower.username!,
                      userId: follower.id!,
                      index: index,
                      isFollower:
                          ViewUser!.userfollower!.elementAt(index).isfollow!);
                })
          ],
        ),
      ),
    );
  }

  Widget followerlistCard({
    String? profileImage,
    required String name,
    required String userName,
    required String userId,
    required int index,
    required bool isFollower,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 16.w,
            ),
            Stack(
              children: [
                Container(
                  width: 50.h,
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.h),
                      image: profileImage == null
                          ? DecorationImage(
                              image: AssetImage("assets/default_profile.webp"),
                              fit: BoxFit.fill)
                          : DecorationImage(
                              image: NetworkImage(
                                  ApiUrls.base + "${profileImage}"),
                              fit: BoxFit.fill)),
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
                  // title,
                  name,
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
                  // name,
                  "@$userName",
                  //    "@priyujoshi",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(59, 63, 67, 0.49)),
                ),
              ],
            ),
            Spacer(),
            ViewUser!.userfollower!.elementAt(index).follower!.id == myUserId
                ? SizedBox()
                : InkWell(
                    onTap: () {
                      removeDailog(userName: userName, index: index);
                    },
                    child: Container(
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: AppColors.greyD3B3F43,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Colors.grey.shade700),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: textWhite14Robo("Remove"),
                        ),
                      ),
                    )),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
        Divider(
          endIndent: 20.w,
          indent: 20.w,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }

  removeDailog({String? profileImage, required String userName, index}) {
    void _handleFollowButton(id) async {
      try {
        var resp = await FollowService.followRecipe(id ?? "");
        if (resp) {
          setState(() {
            // isFollow = !isFollow!;
          });
        }
      } catch (e) {
        // Handle error here
        print('Error Following user: $e');
      }
    }

    final followerUserId =
        ViewUser!.userfollower!.elementAt(index).follower!.id;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        insetPadding: const EdgeInsets.symmetric(vertical: 10),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50.h,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.h),
                  image: profileImage == null
                      ? DecorationImage(
                          image: AssetImage("assets/default_profile.webp"),
                          fit: BoxFit.fill)
                      : DecorationImage(
                          image: NetworkImage(ApiUrls.base + "${profileImage}"),
                          fit: BoxFit.fill)),
            ),
            sizedBoxWidth(10.w),
            Text(
              "Are you sure you want to remove @$userName",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.sp,
                  color: const Color(0xff54595F)),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0xff000000)),
            ),
          ),
          sizedBoxWidth(15.sp),
          InkWell(
            onTap: () {
              _handleFollowButton(followerUserId);
            },
            child: Text(
              "Remove",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0xffB90101)),
            ),
          ),
          sizedBoxWidth(15.w),
        ],
      ),
    );
  }
}
