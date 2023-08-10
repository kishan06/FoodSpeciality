import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/comman_comment.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/common%20files/customSearchTextfield.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/controllers/recipe_ingre_controller.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/common/list_card.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/controller/home_controller.dart';
import 'package:foodspeciality/screens/new_insp_reci_Comt.dart';
import 'package:foodspeciality/screens/recipe_ingredients.dart';
import 'package:foodspeciality/services/view_recipe_contro.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

import '../Model/recipe_details.dart';
import 'filter_bottom_sheet.dart';

class InspirationRecipeComment extends StatefulWidget {
  const InspirationRecipeComment({super.key});

  @override
  State<InspirationRecipeComment> createState() =>
      _InspirationRecipeCommentState();
}

class _InspirationRecipeCommentState extends State<InspirationRecipeComment>
    with SingleTickerProviderStateMixin {
  bool more = false;
  // late TabController _tabController;
  int _currentIndex = 0;
  int selectedVideoIndex = 0;
  final tecComment = TextEditingController();
  bool like = false;
  bool save = false;

  HomeController controllerHome = Get.put(HomeController());
  ViewRecipeController viewRecipeController  = Get.put(ViewRecipeController());

  List tags = [
    "Limpopo",
    "Simple greens",
    "Flavour explosions",
    "Limpopo",
    "Simple greens",
    "Flavour explosions"
  ];

  @override
  void initState() {
    super.initState();
    final recipeId = Get.arguments;
    viewRecipeController.getRecipeDetails(recipeId: recipeId);
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  // int _selectedIndex = 0;

  Color _getTabColor(int index) {
    if (_currentIndex == index) {
      return const Color(0xffE1E1E1);
    } else {
      return const Color.fromRGBO(84, 95, 90, 0.71);
    }
  }

  Color _getTextColor(int index) {
    if (_currentIndex == index) {
      return const Color(0xff000000);
    } else {
      return const Color(0xffFFFFFF);
    }
  }

  ScrollController? _scrollViewController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appBar: AppBar(
        //   title: ,
        // ),
        body: SafeArea(
          child: GetBuilder<ViewRecipeController>(builder: (context){
            if (viewRecipeController.isLoadingRecipeDetails) {
              return Center(child: CircularProgressIndicator());
            } else if(viewRecipeController.recipeDetails == null){
              return Center(child: textgrey18BoldSP("Something went wrong"));
            }
            else {
              final recipeDetailsData = viewRecipeController.recipeDetails!.data[0];
              return Column(
                children: [
                  // sizedBoxHeight(8.h),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 258.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: 
                            NetworkImage(ApiUrls.base + "${recipeDetailsData.coverImage}"),
                            // AssetImage("assets/Mask Group 14.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sizedBoxHeight(26.h),
                                  GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: SvgPicture.asset(
                                        'assets/Path 39.svg',
                                        height: 18.h,
                                        width: 27.w,
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/media-play-circle-svgrepo-com.svg",
                                    height: 63.h,
                                    width: 63.h,
                                  ),
                                  sizedBoxHeight(30.h),
                                  sizedBoxHeight(5.h),
                                  Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.9),
                                        blurRadius: 25.0, // soften the shadow
                                        spreadRadius: 20.0, //extend the shadow
                                        offset: const Offset(
                                          5.0, // Move to right 5  horizontally
                                          5.0, // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ]),
                                    height: 35.h,
                                    width: double.infinity,
                                    child: Text(
                                      // "Chomolia Recipe",
                                      recipeDetailsData.name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      height: 27.h,
                                      child: ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return SizedBox(width: 5.w);
                                        },
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: recipeDetailsData.tags.length,
                                        // tags.length,
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
                                                      ? AppColors.white
                                                          .withOpacity(0.7)
                                                      : AppColors.greyD3B3F43
                                                          .withOpacity(0.7)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 7.w, vertical: 5.h),
                                                child: selectedVideoIndex == index
                                                    ? textgreyD12Robo(recipeDetailsData.tags[index].tag.name)
                                                    : textWhite12Robo(recipeDetailsData.tags[index].tag.name),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  sizedBoxHeight(8.h),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 80.h,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 14.sp,
                                color: Colors.white,
                              ),
                              sizedBoxWidth(3.w),
                              Text(
                                // "30 Min",
                                recipeDetailsData.cookingTime + " Min",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'StudioProM',
                                    fontSize: 12.sp,
                                    color: const Color(0xffFFFFFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  DataTabBarView(recipeDetailsData)
                  // Expanded(
                  //   child: SizedBox(
                  //     // height: MediaQuery.of(context).size.height,
                  //     child: TabBarView(
                  //       controller: _tabController,
                  //       children: [
                  //         DataTabBarView(),
                  //         DataTabBarView(),
                  //         DataTabBarView(),
                  //         DataTabBarView()
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              );
          
            }
          
          })
          
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DataTabBarView(Data recipeDetailsData) {
    return Expanded(
      child: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                backgroundColor: AppColors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                toolbarHeight: 280.h,
                pinned: true,
                floating: true,
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBoxHeight(5.h),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // sizedBoxHeight(5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // sizedBoxWidth(5.h),
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          like = !like;
                                        });
                                      },
                                      child: !recipeDetailsData.liked
                                          ? Image.asset(
                                              'assets/icons/like.png',
                                              height: 18.h,
                                              width: 20.w,
                                            )
                                          : Image.asset(
                                              'assets/icons/like_filled.png',
                                              height: 18.h,
                                              width: 20.w,
                                            )),
                                  Text(
                                    // '23k',
                                    recipeDetailsData.likes > 0 ? recipeDetailsData.likes.toString() : "",
                                    style: TextStyle(
                                        color: const Color(0xff020202),
                                        fontSize: 10.sp),
                                  )
                                ],
                              ),
                              sizedBoxWidth(20.w),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      commentbottomSheet(controllerHome);
                                    },
                                    child: Image.asset(
                                      'assets/icons/comment.png',
                                      height: 18.h,
                                      width: 20.w,
                                    ),
                                  ),
                                  Text(
                                    recipeDetailsData.comments > 0 ? recipeDetailsData.comments.toString() : "",
                                    style: TextStyle(
                                        color: const Color(0xff020202),
                                        fontSize: 10.sp),
                                  )
                                ],
                              ),
                              sizedBoxWidth(20.w),
                              InkWell(
                                onTap: share,
                                child: SvgPicture.asset(
                                  'assets/share-svgrepo-com.svg',
                                  height: 18.h,
                                  width: 20.w,
                                  // color: AppColors.greyD3B3F43,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          save = !save;
                                        });
                                        // save = !save;
                                      },
                                      child: !recipeDetailsData.saved
                                          ? Image.asset(
                                              'assets/icons/save.png',
                                              height: 18.h,
                                              width: 20.w,
                                            )
                                          : Image.asset(
                                              'assets/icons/save_filled.png',
                                              height: 18.h,
                                              width: 20.w,
                                            )),
                                  // Text(
                                  //   '50',
                                  //   style: TextStyle(
                                  //       color: const Color(0xff020202),
                                  //       fontSize: 10.sp),
                                  // )
                                ],
                              ),
                              // sizedBoxWidth(16),
                            ],
                          ),
                        ],
                      ),
                      sizedBoxHeight(22.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // CircleAvatar(
                              //   radius: 32.r,
                              //   backgroundColor: Colors.grey,
                              //   child: Image(
                              //     image: NetworkImage(ApiUrls.base + "${recipeDetailsData.user.profileImage}")
                              //           // AssetImage("assets/Mask Group 40.png")),
                              //   )
                              // ),
                              Container(
                                width: 64.h,
                                height: 64.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32.h),
                                    image:  DecorationImage(
                                        // image: 
                                  image: NetworkImage(ApiUrls.base + "${recipeDetailsData.user.profileImage}"),

                                        // AssetImage("assets/home/profile.png"),
                                        fit: BoxFit.cover)),
                              ),
                              sizedBoxWidth(9.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "Namrata Burondkar",
                                    recipeDetailsData.user.firstName + " " + recipeDetailsData.user.lastName,
                                    style: TextStyle(
                                        fontSize: 16.h,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff979797),
                                        
                                        ),
                                  ),
                                  Text(
                                    // "@Namrata0",
                                    "@${recipeDetailsData.user.username}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xff979797),
                                    ),
                                  ),
                                  sizedBoxHeight(5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 16.sp,
                                        color: const Color(0xff54595F),
                                      ),
                                      Text(
                                        // "South Africa",
                                        recipeDetailsData.user.location??"",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: const Color(0xff54595F)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
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
                        ],
                      ),

                      sizedBoxHeight(13.h),

                      Text(
                        recipeDetailsData.description,
                          // "Lorem Ipsum is simply dummy text of the printing and ty..",
                          // maxLines: more ? null : 1,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Roboto',
                              color: const Color(0xff6B6B6B))),

                      sizedBoxHeight(15.h),

                      const Divider(thickness: 0.3, color: Color(0xff707070)),

                      sizedBoxHeight(15.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/Group 58247.svg",
                            height: 36.h,
                          ),
                          sizedBoxWidth(3.5.w),
                          Text(
                            "${recipeDetailsData.servings} Serving",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 15.sp,
                                color: const Color(0xff000000)),
                          ),
                          sizedBoxWidth(11.5.w),
                          SvgPicture.asset(
                            "assets/svg/Group 58248.svg",
                            height: 36.h,
                          ),
                          sizedBoxWidth(3.5.w),
                          Text(
                            "30 Minutes",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 15.sp,
                                color: const Color(0xff000000)),
                          ),
                        ],
                      ),

                      sizedBoxHeight(15.h),

                      //     Column(
                      //       children: [
                      //         Column(
                      //           children: [
                      //             PreferredSize(
                      //               preferredSize: const Size.fromHeight(20),
                      //               child: TabBar(
                      //                 // controller: _tabController,
                      //                 indicator: UnderlineTabIndicator(
                      //                   borderRadius: BorderRadius.circular(10),
                      //                   borderSide: BorderSide(width: 2.5.sp),
                      //               // insets: EdgeInsets.symmetric(horizontal: 80.w),
                      //                 ),
                      //                 indicatorSize: TabBarIndicatorSize.tab,
                      //                 indicatorPadding:
                      //                 const EdgeInsets.symmetric(horizontal: 50),
                      //                 // indicatorWeight: 4,

                      //                 indicatorColor: const Color(0xFF3B3F43),
                      //                 unselectedLabelStyle:
                      //                 const TextStyle(color: Color(0xFF6B6B6B)),
                      //                 labelColor: const Color.fromRGBO(59, 63, 67, 1),
                      //                 labelStyle: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 18.sp,
                      //                 ),
                      //                 tabs: [
                      //                   Tab(
                      //                     child: Text(
                      //                       "Recipe",
                      //                       style: TextStyle(
                      //                           fontFamily: "StudioProM", fontSize: 17.sp),
                      //                     ),
                      //                   ),
                      //                   Tab(
                      //                     child: Text(
                      //                       "Comments",
                      //                       style: TextStyle(
                      //                           fontFamily: "StudioProM", fontSize: 17.sp),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),

                      //             // Expanded(
                      //             //   child: TabBarView(
                      //             //   // physics: NeverScrollableScrollPhysics(),
                      //             //     children: [
                      //             //       _recipeTabbarView(),
                      //             //       Padding(
                      //             //         padding: EdgeInsets.symmetric(horizontal: 22.w),
                      //             //         child: _commentTabbarView(),
                      //             //       )
                      //             //     ]
                      //             //   ),
                      //             // )

                      //             // SizedBox(
                      //             //     // height: 200.h,
                      //             //     child: TabBarView(
                      //             //       // physics: NeverScrollableScrollPhysics(),
                      //             //         children: [
                      //             //           _recipeTabbarView(),
                      //             //           Padding(
                      //             //             padding: EdgeInsets.symmetric(horizontal: 22.w),
                      //             //             child: _commentTabbarView(),
                      //             //           )
                      //             //         ])
                      //             // ),
                      //           ],
                      //         ),
                      //   ],
                      // )
                    ],
                  ),
                ),
                bottom: CommanTabbarTab("Recipe", "Comments")
                // TabBar(
                //   // overlayColor: ,
                //   // color
                //       // controller: _tabController,
                //   indicator: UnderlineTabIndicator(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: BorderSide(width: 2.5.sp),
                //   // insets: EdgeInsets.symmetric(horizontal: 80.w),
                //   ),
                //   indicatorSize: TabBarIndicatorSize.tab,
                //   indicatorPadding:
                //   const EdgeInsets.symmetric(horizontal: 50),
                //   // indicatorWeight: 4,

                //   indicatorColor: const Color(0xFF3B3F43),
                //   unselectedLabelStyle:
                //   const TextStyle(color: Color(0xFF6B6B6B)),
                //   labelColor: const Color.fromRGBO(59, 63, 67, 1),
                //   labelStyle: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 18.sp,
                //   ),
                //   tabs: [
                //     Tab(
                //       child: Text(
                //         "Recipe",
                //         style: TextStyle(
                //             fontFamily: "StudioProM", fontSize: 17.sp),
                //       ),
                //     ),
                //     Tab(
                //       child: Text(
                //         "Comments",
                //         style: TextStyle(
                //             fontFamily: "StudioProM", fontSize: 17.sp),
                //       ),
                //     ),
                //   ],
                // ),

                )
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     childCount: 1,
            //         (context, index) =>Column(
            //           children: [
            //             sizedBoxHeight(22.h),
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Row(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     sizedBoxWidth(16),
            //                     Column(
            //                       children: [
            //                         Image.asset(
            //                           'assets/icons/like.png',
            //                           height: 17.h,
            //                         ),
            //                         Text(
            //                           '23k',
            //                           style: TextStyle(
            //                               color: const Color(0xff020202), fontSize: 10.sp),
            //                         )
            //                       ],
            //                     ),
            //                     sizedBoxWidth(20.w),
            //                     Column(
            //                       children: [
            //                         Image.asset(
            //                           'assets/icons/comment.png',
            //                           height: 17.h,
            //                         ),
            //                         Text(
            //                           '150',
            //                           style: TextStyle(
            //                               color: const Color(0xff020202), fontSize: 10.sp),
            //                         )
            //                       ],
            //                     ),
            //                     sizedBoxWidth(20.w),
            //                     SvgPicture.asset(
            //                       'assets/share-svgrepo-com.svg',
            //                       height: 17.h,
            //                     )
            //                   ],
            //                 ),
            //                 Row(
            //                   children: [
            //                     Column(
            //                       children: [
            //                         Image.asset(
            //                           'assets/bookmark-svgrepo-com.png',
            //                           height: 19.h,
            //                         ),
            //                         Text(
            //                           '50',
            //                           style: TextStyle(
            //                               color: const Color(0xff020202), fontSize: 10.sp),
            //                         )
            //                       ],
            //                     ),
            //                     sizedBoxWidth(16),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //             sizedBoxHeight(22.h),
            //             Padding(
            //               padding: EdgeInsets.symmetric(horizontal: 16.w),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Row(
            //                     children: [
            //                       CircleAvatar(
            //                         radius: 32.r,
            //                         backgroundColor: Colors.grey,
            //                         child: const Image(
            //                             image: AssetImage("assets/Mask Group 40.png")),
            //                       ),
            //                       sizedBoxWidth(9.w),
            //                       Column(
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             "Namrata Burondkar",
            //                             style: TextStyle(
            //                                 fontSize: 16.h, fontWeight: FontWeight.bold),
            //                           ),
            //                           Text(
            //                             "@Namrata07",
            //                             style: TextStyle(
            //                               fontSize: 14.sp,
            //                               color: const Color(0xff979797),
            //                             ),
            //                           ),
            //                           sizedBoxHeight(5.h),
            //                           Row(
            //                             mainAxisAlignment: MainAxisAlignment.start,
            //                             children: [
            //                               Icon(
            //                                 Icons.location_on_outlined,
            //                                 size: 16.sp,
            //                                 color: const Color(0xff54595F),
            //                               ),
            //                               Text(
            //                                 "South Africa",
            //                                 textAlign: TextAlign.left,
            //                                 style: TextStyle(
            //                                     fontSize: 14.sp,
            //                                     color: const Color(0xff54595F)),
            //                               ),
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(
            //                     height: 31.h,
            //                     child: ElevatedButton(
            //                         style: ElevatedButton.styleFrom(
            //                             side: BorderSide(
            //                                 width: 1.sp, color: const Color(0xff3B3F43)),
            //                             elevation: 0,
            //                             backgroundColor: Colors.white,
            //                             shape: RoundedRectangleBorder(
            //                                 borderRadius: BorderRadius.circular(8.sp))),
            //                         onPressed: () {
            //                           FilterBottomSheet();
            //                           // Get.to(const RecipeIngredientsTapbar());
            //                           // Get.to(const FilterBottomSheet());
            //                         },
            //                         child: Text(
            //                           "Following",
            //                           style: TextStyle(
            //                               fontFamily: 'Studio Pro',
            //                               fontSize: 15.sp,
            //                               color: const Color(0xff3B3F43)),
            //                         )),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             sizedBoxHeight(13.h),
            //             Column(
            //               children: [
            //                 Text("Lorem Ipsum is simply dummy text of the printing and ty..",
            //                     maxLines: more ? null : 1,
            //                     style: TextStyle(
            //                         fontSize: 14.sp,
            //                         fontFamily: 'Roboto',
            //                         color: const Color(0xff6B6B6B))),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.end,
            //                   children: [
            //                     Padding(
            //                       padding: EdgeInsets.only(right: 23.w),
            //                       child: GestureDetector(
            //                         onTap: () {
            //                           setState(() {
            //                             more = !more;
            //                           });
            //                         },
            //                         child: Text(
            //                           more ? 'Less' : 'More',
            //                           style: TextStyle(
            //                               color: const Color(0xff3B3F43),
            //                               fontWeight: FontWeight.w500,
            //                               fontFamily: 'Roboto',
            //                               fontSize: 12.sp),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //             sizedBoxHeight(14.h),
            //             const Divider(thickness: 0.3, color: Color(0xff707070)),
            //             sizedBoxHeight(21.h),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 SvgPicture.asset(
            //                   "assets/svg/Group 58247.svg",
            //                   height: 36.h,
            //                 ),
            //                 sizedBoxWidth(3.5.w),
            //                 Text(
            //                   "10 Serving",
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(
            //                       fontFamily: 'Roboto',
            //                       fontSize: 15.sp,
            //                       color: const Color(0xff000000)),
            //                 ),
            //                 sizedBoxWidth(11.5.w),
            //                 SvgPicture.asset(
            //                   "assets/svg/Group 58248.svg",
            //                   height: 36.h,
            //                 ),
            //                 sizedBoxWidth(3.5.w),
            //                 Text(
            //                   "30 Minutes",
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(
            //                       fontFamily: 'Roboto',
            //                       fontSize: 15.sp,
            //                       color: const Color(0xff000000)),
            //                 ),
            //               ],
            //             ),

            //             Column(
            //               children: [
            //                 Column(
            //                   children: [
            //                     PreferredSize(
            //                       preferredSize: const Size.fromHeight(20),
            //                       child: TabBar(
            //                         // controller: _tabController,
            //                         indicator: UnderlineTabIndicator(
            //                           borderRadius: BorderRadius.circular(10),
            //                           borderSide: BorderSide(width: 2.5.sp),
            //                       // insets: EdgeInsets.symmetric(horizontal: 80.w),
            //                         ),
            //                         indicatorSize: TabBarIndicatorSize.tab,
            //                         indicatorPadding:
            //                         const EdgeInsets.symmetric(horizontal: 50),
            //                         // indicatorWeight: 4,

            //                         indicatorColor: const Color(0xFF3B3F43),
            //                         unselectedLabelStyle:
            //                         const TextStyle(color: Color(0xFF6B6B6B)),
            //                         labelColor: const Color.fromRGBO(59, 63, 67, 1),
            //                         labelStyle: TextStyle(
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 18.sp,
            //                         ),
            //                         tabs: [
            //                           Tab(
            //                             child: Text(
            //                               "Recipe",
            //                               style: TextStyle(
            //                                   fontFamily: "StudioProM", fontSize: 17.sp),
            //                             ),
            //                           ),
            //                           Tab(
            //                             child: Text(
            //                               "Comments",
            //                               style: TextStyle(
            //                                   fontFamily: "StudioProM", fontSize: 17.sp),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),

            //                     // Expanded(
            //                     //   child: TabBarView(
            //                     //   // physics: NeverScrollableScrollPhysics(),
            //                     //     children: [
            //                     //       _recipeTabbarView(),
            //                     //       Padding(
            //                     //         padding: EdgeInsets.symmetric(horizontal: 22.w),
            //                     //         child: _commentTabbarView(),
            //                     //       )
            //                     //     ]
            //                     //   ),
            //                     // )

            //                     // SizedBox(
            //                     //     // height: 200.h,
            //                     //     child: TabBarView(
            //                     //       // physics: NeverScrollableScrollPhysics(),
            //                     //         children: [
            //                     //           _recipeTabbarView(),
            //                     //           Padding(
            //                     //             padding: EdgeInsets.symmetric(horizontal: 22.w),
            //                     //             child: _commentTabbarView(),
            //                     //           )
            //                     //         ])
            //                     // ),
            //                   ],
            //                 ),
            //           ],
            //         )

            //           ],
            //         )
            //   ),
            // ),
          ];
        },
        body: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            children: [_recipeTabbarView(), _commentTabbarView()]),
        //     Column(
        //       children: [
        //         DefaultTabController(
        //           length: 2,
        //           child:
        //           Column(
        //             children: [
        //               PreferredSize(
        //                 preferredSize: const Size.fromHeight(20),
        //                 child: TabBar(
        //                   // controller: _tabController,
        //                   indicator: UnderlineTabIndicator(
        //                     borderRadius: BorderRadius.circular(10),
        //                     borderSide: BorderSide(width: 2.5.sp),
        //                 // insets: EdgeInsets.symmetric(horizontal: 80.w),
        //                   ),
        //                   indicatorSize: TabBarIndicatorSize.tab,
        //                   indicatorPadding:
        //                   const EdgeInsets.symmetric(horizontal: 50),
        //                   // indicatorWeight: 4,

        //                   indicatorColor: const Color(0xFF3B3F43),
        //                   unselectedLabelStyle:
        //                   const TextStyle(color: Color(0xFF6B6B6B)),
        //                   labelColor: const Color.fromRGBO(59, 63, 67, 1),
        //                   labelStyle: TextStyle(
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 18.sp,
        //                   ),
        //                   tabs: [
        //                     Tab(
        //                       child: Text(
        //                         "Recipe",
        //                         style: TextStyle(
        //                             fontFamily: "StudioProM", fontSize: 17.sp),
        //                       ),
        //                     ),
        //                     Tab(
        //                       child: Text(
        //                         "Comments",
        //                         style: TextStyle(
        //                             fontFamily: "StudioProM", fontSize: 17.sp),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),

        //               // Expanded(
        //               //   child: TabBarView(
        //               //   // physics: NeverScrollableScrollPhysics(),
        //               //     children: [
        //               //       _recipeTabbarView(),
        //               //       Padding(
        //               //         padding: EdgeInsets.symmetric(horizontal: 22.w),
        //               //         child: _commentTabbarView(),
        //               //       )
        //               //     ]
        //               //   ),
        //               // )

        //               // SizedBox(
        //               //     // height: 200.h,
        //               //     child: TabBarView(
        //               //       // physics: NeverScrollableScrollPhysics(),
        //               //         children: [
        //               //           _recipeTabbarView(),
        //               //           Padding(
        //               //             padding: EdgeInsets.symmetric(horizontal: 22.w),
        //               //             child: _commentTabbarView(),
        //               //           )
        //               //         ])
        //               // ),
        //             ],
        //           ),

        //     ),
        //   ],
        // )
      ),
    );
  }

  Widget OtherRecipeCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 93.h,
          width: 115.w,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Chocolate 2.png')),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(9.r),
                  topRight: Radius.circular(9.r))),
        ),
        Material(
          borderRadius: BorderRadius.circular(9.sp),
          elevation: 1.2,
          child: Container(
            // height: 49.h,
            width: 115.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(9.r),
                    bottomRight: Radius.circular(9.r))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxHeight(3.5.h),
                Padding(
                  padding: EdgeInsets.only(left: 7.4.w),
                  child: Text(
                    'Slappappoffer Recipe',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 10.sp),
                  ),
                  // sizedBoxWidth(16.w),
                  // Image.asset(
                  //   'assets/icons/save.png',
                  //   height: 9.h,
                  //   width: 6.8.w,

                  // ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.4.w),
                  child: Text(
                    '@Priyujoshi',
                    style: TextStyle(
                        color: const Color(0xff6B6B6B),
                        fontSize: 8.sp,
                        fontFamily: 'Roboto'),
                  ),
                ),
                sizedBoxHeight(5.h),
                Row(
                  children: [
                    sizedBoxWidth(8.w),
                    Image.asset(
                      'assets/like-svgrepo-com.png',
                      height: 10.h,
                      width: 11.8.w,
                    ),
                    Text(
                      '23k',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 6.sp),
                    ),
                    sizedBoxWidth(16.w),
                    Image.asset(
                      'assets/comment-blank-svgrepo-com.png',
                      height: 9.7.h,
                      width: 10.18.w,
                    ),
                    Text(
                      '150',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 6.sp),
                    ),
                    sizedBoxWidth(16.w),
                    Image.asset(
                      'assets/bookmark-svgrepo-com.png',
                      height: 9.h,
                      width: 6.8.w,
                    ),
                    Text(
                      '50',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 6.sp),
                    ),
                  ],
                ),
                sizedBoxHeight(3.5.h),

                // sizedBoxHeight(5.h)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _recipeTabbarView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(22.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ingredients",
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
                sizedBoxHeight(11.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "chomolia, finely chopped",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                    Text(
                      "1 Bunch",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                ),
                sizedBoxHeight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Onion, finely chopped",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                ),
                sizedBoxHeight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Yellow pepper, finely chopped",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                ),
                sizedBoxHeight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Olive oil",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                    Text(
                      "2 TBS",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                ),
                sizedBoxHeight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Benny spice",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                    Text(
                      "To Taste",
                      style: TextStyle(
                          fontSize: 14.sp, color: const Color(0xff414141)),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                  thickness: 0.5,
                ),
              ],
            ),
            sizedBoxHeight(30.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Instructions",
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
                sizedBoxHeight(15.h),
                Container(
                  height: 80.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xff7070705E)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxWidth(6.w),
                        CircleAvatar(
                          radius: 11.sp,
                          backgroundColor: const Color(0xff6B6B6B),
                          child: Text(
                            "1",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                        sizedBoxWidth(7.w),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xff707070),
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(14.h),
                Container(
                  height: 80.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xff7070705E)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxWidth(6.w),
                        CircleAvatar(
                          radius: 11.sp,
                          backgroundColor: const Color(0xff6B6B6B),
                          child: Text(
                            "2",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
                          ),
                        ),
                        sizedBoxWidth(7.w),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xff707070),
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(14.h),
                Container(
                  // height: 80.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xff7070705E)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBoxWidth(6.w),
                            CircleAvatar(
                              radius: 11.sp,
                              backgroundColor: const Color(0xff6B6B6B),
                              child: Text(
                                "3",
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                            sizedBoxWidth(7.w),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color(0xff707070),
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight(6.h),
                        Image.asset(
                          "assets/Mask Group 24.png",
                          height: 173.h,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        )
                        // Image(
                        //   height: 173.h,
                        //   // fit:
                        //   // ,
                        //   width: double.infinity,
                        //   image: AssetImage("assets/Mask Group 24.png",
                        //     // heigh
                        //   ))
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(14.h),
                Container(
                  // height: 285.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xff7070705E)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBoxWidth(6.w),
                            CircleAvatar(
                              radius: 11.sp,
                              backgroundColor: const Color(0xff6B6B6B),
                              child: Text(
                                "4",
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              ),
                            ),
                            sizedBoxWidth(7.w),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing \nand typesetting industry.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color(0xff707070),
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),

                        sizedBoxHeight(6.h),
                        Image.asset(
                          "assets/Mask Group 25.png",
                          height: 173.h,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        )
                        // const Image(
                        //     image: AssetImage("assets/Mask Group 25.png")),
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(42.h),
              ],
            ),
            const Divider(
              height: 0,
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Other Recipes By @Priyujoshi',
                    style: TextStyle(fontSize: 17.sp, fontFamily: 'StudioProM'),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      height: 155.h,
                      child: ListView.separated(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return OtherRecipeCard();
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 11.3.w,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Similar Recipes',
                    style: TextStyle(fontSize: 17.sp, fontFamily: 'StudioProM'),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      height: 150.h,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return OtherRecipeCard();
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Container(
                            //       height: 93.h,
                            //       width: 115.w,
                            //       decoration: BoxDecoration(
                            //           image: const DecorationImage(
                            //               fit: BoxFit.cover,
                            //               image: AssetImage(
                            //                   'assets/Chocolate 2.png')),
                            //           borderRadius: BorderRadius.only(
                            //               topLeft: Radius.circular(9.r),
                            //               topRight: Radius.circular(9.r))),
                            //       // child: Image.asset(
                            //       //   'assets/Chocolate 2.png',
                            //       //   fit: BoxFit.cover,
                            //       // ),
                            //     ),
                            //     Material(
                            //       borderRadius: BorderRadius.circular(9.sp),
                            //       elevation: 1.2,
                            //       child: Container(
                            //         height: 49.h,
                            //         width: 115.w,
                            //         decoration: BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.only(
                            //                 bottomLeft: Radius.circular(9.r),
                            //                 bottomRight: Radius.circular(9.r))),
                            //         child: Column(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //           children: [
                            //             sizedBoxHeight(3.5.h),
                            //             Padding(
                            //               padding: EdgeInsets.only(left: 7.4.w),
                            //               child: Text(
                            //                 'Slappappoffer Recipe',
                            //                 style: TextStyle(
                            //                     fontSize: 8.sp,
                            //                     fontFamily: 'Roboto'),
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: EdgeInsets.only(left: 7.4.w),
                            //               child: Text(
                            //                 '@Priyujoshi',
                            //                 style: TextStyle(
                            //                     color: const Color(0xff6B6B6B),
                            //                     fontSize: 5.sp,
                            //                     fontFamily: 'Roboto'),
                            //               ),
                            //             ),
                            //             Row(
                            //               children: [
                            //                 sizedBoxWidth(8.w),
                            //                 Image.asset(
                            //                   'assets/like-svgrepo-com.png',
                            //                   height: 10.h,
                            //                   width: 11.8.w,
                            //                 ),
                            //                 Text(
                            //                   '23k',
                            //                   style: TextStyle(
                            //                       fontFamily: 'Roboto',
                            //                       fontSize: 6.sp),
                            //                 ),
                            //                 sizedBoxWidth(16.w),
                            //                 Image.asset(
                            //                   'assets/comment-blank-svgrepo-com.png',
                            //                   height: 9.7.h,
                            //                   width: 10.18.w,
                            //                 ),
                            //                 Text(
                            //                   '150',
                            //                   style: TextStyle(
                            //                       fontFamily: 'Roboto',
                            //                       fontSize: 6.sp),
                            //                 ),
                            //                 sizedBoxWidth(16.w),
                            //                 Image.asset(
                            //                   'assets/bookmark-svgrepo-com.png',
                            //                   height: 9.h,
                            //                   width: 6.8.w,
                            //                 ),
                            //                 Text(
                            //                   '50',
                            //                   style: TextStyle(
                            //                       fontFamily: 'Roboto',
                            //                       fontSize: 6.sp),
                            //                 ),
                            //               ],
                            //             )
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 11.3.w,
                            );
                          },
                          itemCount: 5),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _commentTabbarView() {
    return Container(
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
                            index,
                            controllerHome),
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
        ));
  }
}
