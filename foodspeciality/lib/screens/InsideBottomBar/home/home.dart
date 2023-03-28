import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/common%20files/customSearchTextfield.dart';
import 'package:foodspeciality/common%20files/search_noti.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/common%20files/video_player.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/common/list_card.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/controller/home_controller.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

List listCardData = [
  {
    "like": 0,
    "save": 0,
    "selectedVideoInde": 0,
    "isFollowedByMe": 0,
  },
  {"like": 0, "save": 0, "selectedVideoInde": 0, "isFollowedByMe": 0},
  {"like": 0, "save": 0, "selectedVideoInde": 0, "isFollowedByMe": 0},
  {"like": 0, "save": 0, "selectedVideoInde": 0, "isFollowedByMe": 0},
  {"like": 0, "save": 0, "selectedVideoInde": 0, "isFollowedByMe": 0},
  {"like": 0, "save": 0, "selectedVideoInde": 0, "isFollowedByMe": 0},
  {"like": 0, "save": 0, "selectedVideoInde": 0, "isFollowedByMe": 0},
  {"like": 0, "save": 0, "selectedVideoInde": 0, "isFollowedByMe": 0},
  {"like": 0, "save": 0, "selectedVideoInde": 0, "isFollowedByMe": 0},
  {"like": 0, "save": 0, "selectedVideoInde": 0, "isFollowedByMe": 0},
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final tecComment = TextEditingController();
  int selectedVideoIndex = 0;

  List tags = [
    "Limpopo",
    "Simple greens",
    "Flavour explosions",
    "Limpopo",
    "Simple greens",
    "Flavour explosions"
  ];

  HomeController controllerHome = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          // extendBody: true,
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Column(
                children: [
                  searchNotification(),
                  CommanTabbar("My Community", "Inspiration"),
                ],
              ),
              Expanded(
                child: Container(
                  color: AppColors.greyLtEBEBEB,
                  // color: Colors.red,

                  child: TabBarView(children: [tabbarView1(), tabbarView2()]),
                ),
              )
            ],
          )),
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
                    child: textL_grey14Robo(
                        "Create your community and connect with your friends, family, chefs and other aspiring cooks."),
                  ),

                  sizedBoxHeight(50.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: customButtonWithBorder("Build Your Community",
                        onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => addCommunityDailog());
                    }),
                  ),

                  sizedBoxHeight(100.h),
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
            padding: EdgeInsets.fromLTRB(16.w, 9.h, 16.w, 0),
            // padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 9.h),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listCardData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    listCard(
                        listCardData[index]["like"],
                        listCardData[index]["save"],
                        index,
                        listCardData[index]["isFollowedByMe"]),
                    sizedBoxHeight(13.h)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listCard(int like, int save, int index, int isFollowedByMe) {
    // bool like = false;

    return Container(
        // height: 425.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.h),
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
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50.h,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.h),
                              image: const DecorationImage(
                                  image: AssetImage("assets/home/profile.png"),
                                  fit: BoxFit.fill)),
                        ),
                        sizedBoxWidth(10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // textWhite17w500("George Smith"),
                            // e=
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/viewuser");
                              },
                              child: textgreyD16BoldSP("Priyanka Joshi"),
                            ),

                            sizedBoxHeight(5.h),

                            textgreyD12Robo("2 Days ago")

                            // textGrey15W500("21 Jan, 2022, 10:41 am")
                          ],
                        )
                      ],
                    ),

                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              print("pressed");
                              setState(() {
                                listCardData[index]["isFollowedByMe"] =
                                    isFollowedByMe == 0 ? 1 : 0;
                              });
                            },
                            child: isFollowedByMe == 0
                                ? Container(
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.greyD3B3F43,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.grey.shade700),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.h),
                                      child: Center(
                                        child: textWhite14Robo("Follow"),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 80.w,
                                    // height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: Color(0xFF3B3F43),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5.h),
                                      child: Center(
                                          child: textgreyD14Robo("Following")
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
                                  )),
                        Container(
                          child: isFollowedByMe == 0
                              ? SizedBox()
                              : PopupMenuButton(
                                  offset: const Offset(0, 50),
                                  color: const Color(0xFFFFFFFF),
                                  tooltip: '',
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Color(0xFF3B3F43),
                                  ),
                                  onSelected: (value) {
                                    if (value == 'unfollow') {
                                      setState(() {
                                        listCardData[index]["isFollowedByMe"] =
                                            isFollowedByMe == 0 ? 1 : 0;
                                      });
                                    } else if (value == "Report") {
                                      Get.toNamed('/Report');
                                    } else if (value == "block") {
                                      showDialog(
                                        context: context,
                                        builder: (context) => Padding(
                                          padding: EdgeInsets.all(15.w),
                                          child: AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r)),
                                            insetPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10),
                                            title: Text(
                                              "Block User",
                                              style: TextStyle(
                                                  fontFamily: 'Studio Pro',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp,
                                                  color:
                                                      const Color(0xff3B3F43)),
                                            ),
                                            content: SizedBox(
                                              // margin: EdgeInsets.symmetric(horizontal: 10.w),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                "Are you sure you want to Block @priyujoshi?",
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 16.sp,
                                                    color: const Color(
                                                        0xff54595F)),
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16.sp,
                                                      color: const Color(
                                                          0xff000000)),
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16.sp,
                                                      color: const Color(
                                                          0xffB90101)),
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
                                        value: 'unfollow',
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.link_off,
                                                  size: 20.sp,
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Text(
                                                  "Unfollow",
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
                        )
                      ],
                    ),

                    // customButtonWithBorder(
                    //   "text",
                    //   onPressed: onPressed
                    // )
                  ],
                ),
              ),

              sizedBoxHeight(14.h),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 180.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.h),
                        image: DecorationImage(
                            image: AssetImage("assets/home/food.png"),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    height: 180.h,
                    child: Padding(
                      padding: EdgeInsets.all(9.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // Get.toNamed("/networkplayerwidget");
                              Get.to(AssetPlayerWidget());
                            },
                            child: Container(
                              width: 80.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.h),
                                  color: AppColors.white.withOpacity(0.5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/video.png",
                                    height: 10.h,
                                    width: 15.w,
                                  ),
                                  sizedBoxWidth(2.w),
                                  textgreyD12Robo("Video")
                                ],

                                // Image.asset("assets/icons/video.png"),
                              ),
                            ),
                          ),

                          // Spacer(),

                          SizedBox(
                            height: 27.h,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 5.w);
                              },
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: tags.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedVideoIndex = index;
                                      // listCardData[index]["selectedVideoInde"] = index;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.h),
                                        color: index == selectedVideoIndex
                                            ? AppColors.white.withOpacity(0.7)
                                            : AppColors.greyD3B3F43
                                                .withOpacity(0.7)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 7.w, vertical: 5.h),
                                      child: selectedVideoIndex == index
                                          ? textgreyD12Robo(tags[index])
                                          : textWhite12Robo(tags[index]),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15.h),
                          //     color: AppColors.white.withOpacity(0.5)
                          //   ),
                          //   child: Padding(
                          //     padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                          //     child: textgreyD12Robo("Video"),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              sizedBoxHeight(13.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // sets
                            // like = !like;
                            setState(() {
                              listCardData[index]["like"] = like == 0 ? 1 : 0;
                              // sdf
                            });
                          },
                          child: like == 0
                              ? Image.asset(
                                  "assets/icons/like.png",
                                  width: 20.w,
                                  height: 18.h,
                                  // color: like == 0 ? AppColors.red:AppColors.black,
                                  // color: like ?AppColors.white : null ,
                                )
                              : Image.asset(
                                  "assets/icons/like_filled.png",
                                  width: 20.w,
                                  height: 18.h,
                                  // color: like == 0 ? AppColors.red:AppColors.black,
                                  // color: like ?AppColors.white : null ,
                                ),
                        ),
                        sizedBoxWidth(25.w),
                        InkWell(
                          onTap: () {
                            commentbottomSheet();
                          },
                          child: Image.asset(
                            "assets/icons/comment.png",
                            width: 20.w,
                            height: 18.h,
                          ),
                        ),
                        sizedBoxWidth(25.w),
                        InkWell(
                          onTap: share,
                          // (){
                          //   shar
                          //   // Share.share('https://www.google.co.in/');
                          // },
                          child: Image.asset(
                            "assets/icons/share.png",
                            width: 20.w,
                            height: 18.h,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          listCardData[index]["save"] = save == 0 ? 1 : 0;
                        });
                      },
                      child: save == 0
                          ? Image.asset(
                              "assets/icons/save.png",
                              width: 20.w,
                              height: 18.h,
                            )
                          : Image.asset(
                              "assets/icons/save_filled.png",
                              width: 20.w,
                              height: 18.h,
                            ),
                    ),
                  ],
                ),
              ),

              sizedBoxHeight(10.h),

              Padding(
                padding: EdgeInsets.fromLTRB(11.w, 0.w, 0.w, 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textgreyD12Robo("1,320 Likes"),
                    textgreyD20BoldSP("Carrot Tzatzik"),
                    textgreyL12Robo("View all 30 comments"),
                    SizedBox(height: 5.w),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 27.h,
                          height: 27.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.h),
                              image: const DecorationImage(
                                  image: AssetImage("assets/home/profile.png"),
                                  fit: BoxFit.fill)),
                        ),
                        sizedBoxWidth(5.w),
                        InkWell(
                            onTap: () {
                              commentbottomSheet();
                            },
                            child: textgreyL12Robo("Add a comment"))
                      ],
                    ),

                    InkWell(
                        onTap: () {
                          Get.toNamed("/InspirationRecipeComment");
                        },
                        child: textgreyD12Robo("View Recipe >"))

                    // followButton("Follow",
                    //   onPressed: (){

                    //   }
                    // )

                    // customButtonWithBorder(
                    //   "text",
                    //   onPressed: onPressed
                    // )
                  ],
                ),
              ),

              // Image.asset(
              //   sliderImage,
              //   fit: BoxFit.fill,
              // ),
            ],
          ),
        ));
  }

  Widget tileForlist(String comment, int like, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 35.h,
          height: 35.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.h),
              image: const DecorationImage(
                  image: AssetImage("assets/home/profile.png"),
                  fit: BoxFit.fill)),
        ),
        sizedBoxWidth(10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // textWhite17w500("George Smith"),
            // e=
            textBlack16SP("Chaitali tatkare"),

            sizedBoxHeight(5.h),

            // textgreyD12Robo("2 Days ago")
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.h),
                  color: AppColors.greyLtEBEBEB),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                child: textgreyD10Robo("11:36"),
              ),
            ),

            sizedBoxHeight(5.h),

            Row(
              children: [
                SizedBox(
                    // hei
                    width: 290.w,
                    child: textBlack15Robo(comment
                        // "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
                        )),
                sizedBoxWidth(10.w),
                Column(
                  children: [
                    // /
                    InkWell(
                      onTap: () {
                        controllerHome.likeMethod(index, like);
                        // sets
                        // like = !like;
                        // setState(() {
                        //   commentLike[index]["like"] = like == 0 ? 1 : 0;
                        //   // sdf
                        // });
                        // controllerHome.commentLike
                      },
                      child: like == 0
                          ? Image.asset(
                              "assets/icons/like.png",
                              width: 20.w,
                              height: 18.h,
                            )
                          : Image.asset(
                              "assets/icons/like_filled.png",
                              width: 20.w,
                              height: 18.h,
                            ),
                    ),

                    sizedBoxHeight(2.h),

                    textgreyL12Robo("20")
                  ],
                )
              ],
            ),

            sizedBoxHeight(5.h),

            textgreyM14Sp("Reply")

            // textGrey15W500("21 Jan, 2022, 10:41 am")
          ],
        )
      ],
    );
  }

  Future<T?> commentbottomSheet<T>() {
    return Get.bottomSheet(
      Container(
          height: 375.h,
          // color: AppColors.white,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),

            // padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // tileForlist()
                Expanded(child: GetBuilder<HomeController>(builder: (_) {
                  return ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: controllerHome.commentLike.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          tileForlist(
                              controllerHome.commentLike[index]["comment"],
                              controllerHome.commentLike[index]["like"],
                              index),
                          sizedBoxHeight(13.h)
                        ],
                      );
                    },
                  );
                })
                    // ListView.builder(
                    //   // physics: const NeverScrollableScrollPhysics(),
                    //   // shrinkWrap: true,
                    //   itemCount: 5,
                    //   itemBuilder: (context, index) {
                    //     return Column(
                    //       children: [
                    //         tileForlist(
                    //             controllerHome.commentLike[index]["comment"],
                    //             controllerHome.commentLike[index]["like"],
                    //             index),
                    //         sizedBoxHeight(13.h)
                    //       ],
                    //     );
                    //   },
                    // ),

                    ),

                sizedBoxHeight(15.h),

                CustomSearchTextFormField(
                    textEditingController: tecComment,
                    autofocus: false,
                    hintText: "Add a comment",
                    validatorText: '',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: SizedBox(
                          height: 50.h,
                          width: 40.w,
                          child: Center(
                              child: InkWell(
                                  onTap: () {
                                    if (tecComment.text.isNotEmpty) {
                                      // print(tecComment.text);
                                      controllerHome
                                          .commentMethod(tecComment.text);
                                      tecComment.clear();
                                    }
                                  },
                                  child: textgreyM14Sp("Send")))),
                    ))
              ],
            ),
          )),
      // barrierColor: Colors.red[50],
      // isDismissible: false,
    );
  }
}

Widget addCommunityDailog() {
  return Dialog(
    elevation: 0,
    backgroundColor: Colors.transparent,
    insetPadding: EdgeInsets.all(16.w),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.h),
            color: AppColors.white,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 25.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        size: 30.h,
                        color: AppColors.greyM707070,
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight(35.h),
                SizedBox(
                  width: 200.w,
                  height: 24.h,
                  child: TextFormField(
                    style: TextStyle(
                        color: Color(0xFF979797),
                        fontSize: 20.sp,
                        fontFamily: "StudioProR"),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                          color: Color(0xFF979797),
                          fontSize: 20.sp,
                          fontFamily: "StudioProR"),
                      hintText: "Community Name",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                sizedBoxHeight(15.h),
                TextFormField(
                  style: TextStyle(
                      color: Color(0xFF979797),
                      fontSize: 20.sp,
                      fontFamily: "StudioProR"),
                  cursorColor: const Color(0xFFFFB600),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14.sp),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: const Color(0xFF979797), width: 0.5.w),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: const Color(0xFF979797), width: 0.5.w),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: const Color(0xFF979797), width: 0.5.w),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: Colors.red, width: 1.w),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: Colors.red, width: 1.w),
                    ),
                    hintStyle: TextStyle(
                        fontFamily: "StudioProR",
                        color: const Color(0x80000000),
                        fontSize: 17.sp),
                    hintText: "Community Description",
                  ),
                  minLines: 4,
                  maxLines: null,
                ),
                sizedBoxHeight(15.h),
                SizedBox(
                  height: 50.h,
                  width: 170.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      // ignore: deprecated_member_use
                      primary: const Color(0xFF3B3F43),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFF707070)),
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontFamily: 'StudioProR',
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed("communityaddparticipants");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: -50.h,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.w,
                      color: AppColors.greyL979797,
                      spreadRadius: 2.w)
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.h,
                child: SvgPicture.asset("assets/community.svg"),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
