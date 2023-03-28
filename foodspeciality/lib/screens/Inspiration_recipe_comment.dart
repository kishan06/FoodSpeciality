import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/new_insp_reci_Comt.dart';
import 'package:foodspeciality/screens/recipe_ingredients.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

import 'common_chip.dart';

// import 'filter_bottom_sheet.dart';

class InspirationRecipeComment extends StatefulWidget {
  const InspirationRecipeComment({super.key});

  @override
  State<InspirationRecipeComment> createState() =>
      _InspirationRecipeCommentState();
}

class _InspirationRecipeCommentState extends State<InspirationRecipeComment>
    with SingleTickerProviderStateMixin {
  bool editChip = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _textList = [];
  final TextEditingController _textController = TextEditingController();
  bool textFieldVisibile = false;
  bool _colorchange = true;
  bool more = false;
  late TabController _tabController;
  int _currentIndex = 0;
  int selectedVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        switch (_tabController.index) {
          case 0:
            _currentIndex = 0;

            break;
          case 1:
            _currentIndex = 1;

            break;
          case 2:
            _currentIndex = 2;

            break;
          default:
            _currentIndex = 3;
        }
      });

      // // setState(() {});
      // if (_tabController.indexIsChanging) {
      //   setState(() {
      //     _currentIndex = _tabController.index;
      //   });
      // }
    });
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
          child: Column(
            children: [
              // sizedBoxHeight(8.h),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 258.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Mask Group 14.png"),
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
                                  "Chomolia Recipe",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                              ),
                              SizedBox(
                                height: 27.h,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 5.w);
                                  },
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 10,
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
                                              ? textgreyD12Robo("Video")
                                              : textWhite12Robo("Video"),
                                        ),
                                      ),
                                    );
                                  },
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
                            "30 Min",
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

              DataTabBarView()
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
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DataTabBarView() {
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
              title: Column(
                children: [
                  sizedBoxHeight(22.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedBoxWidth(16),
                          Column(
                            children: [
                              Image.asset(
                                'assets/icons/like.png',
                                height: 17.h,
                              ),
                              Text(
                                '23k',
                                style: TextStyle(
                                    color: const Color(0xff020202),
                                    fontSize: 10.sp),
                              )
                            ],
                          ),
                          sizedBoxWidth(20.w),
                          Column(
                            children: [
                              Image.asset(
                                'assets/icons/comment.png',
                                height: 17.h,
                              ),
                              Text(
                                '150',
                                style: TextStyle(
                                    color: const Color(0xff020202),
                                    fontSize: 10.sp),
                              )
                            ],
                          ),
                          sizedBoxWidth(20.w),
                          SvgPicture.asset(
                            'assets/share-svgrepo-com.svg',
                            height: 17.h,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/bookmark-svgrepo-com.png',
                                height: 19.h,
                              ),
                              Text(
                                '50',
                                style: TextStyle(
                                    color: const Color(0xff020202),
                                    fontSize: 10.sp),
                              )
                            ],
                          ),
                          sizedBoxWidth(16),
                        ],
                      ),
                    ],
                  ),
                  sizedBoxHeight(22.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 32.r,
                              backgroundColor: Colors.grey,
                              child: const Image(
                                  image:
                                      AssetImage("assets/Mask Group 40.png")),
                            ),
                            sizedBoxWidth(9.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Namrata Burondkar",
                                  style: TextStyle(
                                      fontSize: 16.h,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "@Namrata07",
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
                                      "South Africa",
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
                        SizedBox(
                          height: 31.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      width: 1.sp,
                                      color: const Color(0xff3B3F43)),
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.sp))),
                              onPressed: () {
                                filterBottomSheet();
                                // FilterBottomSheet();
                                // Get.to(const RecipeIngredientsTapbar());
                                // Get.to(const FilterBottomSheet());
                              },
                              child: Text(
                                "Following",
                                style: TextStyle(
                                    fontFamily: 'Studio Pro',
                                    fontSize: 15.sp,
                                    color: const Color(0xff3B3F43)),
                              )),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(13.h),
                  Column(
                    children: [
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and ty..",
                          maxLines: more ? null : 1,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Roboto',
                              color: const Color(0xff6B6B6B))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 23.w),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  more = !more;
                                });
                              },
                              child: Text(
                                more ? 'Less' : 'More',
                                style: TextStyle(
                                    color: const Color(0xff3B3F43),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Roboto',
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  sizedBoxHeight(14.h),
                  const Divider(thickness: 0.3, color: Color(0xff707070)),
                  sizedBoxHeight(21.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/Group 58247.svg",
                        height: 36.h,
                      ),
                      sizedBoxWidth(3.5.w),
                      Text(
                        "10 Serving",
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
              bottom: TabBar(
                // overlayColor: ,
                // color
                // controller: _tabController,
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2.5.sp),
                  // insets: EdgeInsets.symmetric(horizontal: 80.w),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 50),
                // indicatorWeight: 4,

                indicatorColor: const Color(0xFF3B3F43),
                unselectedLabelStyle: const TextStyle(color: Color(0xFF6B6B6B)),
                labelColor: const Color.fromRGBO(59, 63, 67, 1),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      "Recipe",
                      style:
                          TextStyle(fontFamily: "StudioProM", fontSize: 17.sp),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Comments",
                      style:
                          TextStyle(fontFamily: "StudioProM", fontSize: 17.sp),
                    ),
                  ),
                ],
              ),
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
            children: [
              _recipeTabbarView(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: _commentTabbarView(),
              )
            ]),
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

  Widget _recipeTabbarView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          sizedBoxHeight(22.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 17.h, fontWeight: FontWeight.w600),
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
          ),
          sizedBoxHeight(30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Instructions",
                  style: TextStyle(fontSize: 17.h, fontWeight: FontWeight.w600),
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
                            fontSize: 15.spMin,
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
                            fontSize: 15.spMin,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(14.h),
                Container(
                  height: 285.h,
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
                                fontSize: 15.spMin,
                              ),
                            ),
                          ],
                        ),
                        const Image(
                            image: AssetImage("assets/Mask Group 24.png"))
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(14.h),
                Container(
                  height: 285.h,
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
                                fontSize: 15.spMin,
                              ),
                            ),
                          ],
                        ),
                        const Image(
                            image: AssetImage("assets/Mask Group 25.png")),
                      ],
                    ),
                  ),
                ),
                sizedBoxHeight(42.h),
              ],
            ),
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
                    height: 150.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 93.h,
                                width: 115.w,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/Chocolate 2.png')),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(9.r),
                                        topRight: Radius.circular(9.r))),
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(9.sp),
                                elevation: 1.2,
                                child: Container(
                                  height: 49.h,
                                  width: 115.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(9.r),
                                          bottomRight: Radius.circular(9.r))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      sizedBoxHeight(3.5.h),
                                      Padding(
                                        padding: EdgeInsets.only(left: 7.4.w),
                                        child: Text(
                                          'Slappappoffer Recipe',
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 6.sp),
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
                                              fontSize: 5.sp,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
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
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 6.sp),
                                          ),
                                          sizedBoxWidth(16.w),
                                          Image.asset(
                                            'assets/comment-blank-svgrepo-com.png',
                                            height: 9.7.h,
                                            width: 10.18.w,
                                          ),
                                          Text(
                                            '150',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 6.sp),
                                          ),
                                          sizedBoxWidth(16.w),
                                          Image.asset(
                                            'assets/bookmark-svgrepo-com.png',
                                            height: 9.h,
                                            width: 6.8.w,
                                          ),
                                          Text(
                                            '50',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 6.sp),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
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
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 93.h,
                                width: 115.w,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/Chocolate 2.png')),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(9.r),
                                        topRight: Radius.circular(9.r))),
                                // child: Image.asset(
                                //   'assets/Chocolate 2.png',
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(9.sp),
                                elevation: 1.2,
                                child: Container(
                                  height: 49.h,
                                  width: 115.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(9.r),
                                          bottomRight: Radius.circular(9.r))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      sizedBoxHeight(3.5.h),
                                      Padding(
                                        padding: EdgeInsets.only(left: 7.4.w),
                                        child: Text(
                                          'Slappappoffer Recipe',
                                          style: TextStyle(
                                              fontSize: 8.sp,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 7.4.w),
                                        child: Text(
                                          '@Priyujoshi',
                                          style: TextStyle(
                                              color: const Color(0xff6B6B6B),
                                              fontSize: 5.sp,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
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
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 6.sp),
                                          ),
                                          sizedBoxWidth(16.w),
                                          Image.asset(
                                            'assets/comment-blank-svgrepo-com.png',
                                            height: 9.7.h,
                                            width: 10.18.w,
                                          ),
                                          Text(
                                            '150',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 6.sp),
                                          ),
                                          sizedBoxWidth(16.w),
                                          Image.asset(
                                            'assets/bookmark-svgrepo-com.png',
                                            height: 9.h,
                                            width: 6.8.w,
                                          ),
                                          Text(
                                            '50',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 6.sp),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
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
    );
  }

  Widget _commentTabbarView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            height: 200,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 14.r,
                              child: const Image(
                                  image:
                                      AssetImage("assets/Mask Group 40.png")),
                            ),
                            sizedBoxWidth(9.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Chaitali tatkare",
                                  style: TextStyle(
                                      fontSize: 14.h, fontFamily: 'StudioProR'),
                                ),
                                Container(
                                  width: 32.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffEEEEEE),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '11:36',
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 7.sp,
                                          color: const Color(0xff434343)),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and \ntypesetting industry..",
                                  style: TextStyle(
                                      fontSize: 12.h, fontFamily: 'Roboto'),
                                ),
                                Text(
                                  'Reply',
                                  style: TextStyle(
                                      fontFamily: 'StudioProB',
                                      fontSize: 10.sp,
                                      color: const Color(0xff54595F)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            sizedBoxHeight(25.h),
                            Image.asset(
                              'assets/like-svgrepo-com.png',
                              height: 17.h,
                            ),
                            Text(
                              '20',
                              style: TextStyle(
                                  color: const Color(0xff020202),
                                  fontSize: 10.sp),
                            )
                          ],
                        ),
                      ],
                    ),
                    sizedBoxHeight(16.h),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 50.h,
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(color: Color(0xff707070)),
                  ),
                  border: const OutlineInputBorder(),
                  hintText: "Add a comment",
                  hintStyle: TextStyle(
                      color: const Color(0xff6B6B6B),
                      fontFamily: 'Roboto',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Send',
                        style: TextStyle(
                            color: const Color(0xff6B6B6B),
                            fontFamily: 'Roboto',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Future<T?> filterBottomSheet<T>() {
    return Get.bottomSheet(
        Container(
            // height: double.infinity - 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r))),
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 35.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13.w, right: 29.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'StudioProB',
                                  color: const Color(0xff3B3F43)),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.filter_list_sharp),
                              Text(
                                'Filters',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'StudioProM',
                                    color: const Color(0xff6B6B6B)),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                              _textList.clear();
                              filterBottomSheet();
                            },
                            child: Text(
                              'Clear All',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'StudioProB',
                                  color: const Color(0xff3B3F43)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxHeight(36.h),
                    Text(
                      'Add Tags',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'StudioProM',
                          color: const Color(0xff54595F)),
                    ),
                    Column(
                      children: [
                        sizedBoxHeight(6.h),
                        Visibility(
                          visible: !textFieldVisibile,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    textFieldVisibile = true;
                                    Get.back();
                                    filterBottomSheet();
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.sp),
                                    color: AppColors.buttonGrey54595F,
                                  ),
                                  height: 27.h,
                                  width: 70.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      sizedBoxWidth(6.w),
                                      SvgPicture.asset(
                                        "assets/svg/add-circle-svgrepo-com.svg",
                                        // height: 15.h,
                                        // width: 15.w,
                                      ),
                                      Text(
                                        "  Custom",
                                        style: TextStyle(
                                            color: const Color(0xffffffff),
                                            fontFamily: "Studio Pro",
                                            fontSize: 10.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      editChip = !editChip;
                                      Get.back();
                                      filterBottomSheet();
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Icon(
                                      Icons.edit,
                                      color: editChip
                                          ? const Color(0xFFE1E1E1)
                                          : const Color.fromRGBO(84, 89, 95, 1),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Visibility(
                          visible: textFieldVisibile,
                          child: Form(
                            key: _formKey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      10.w,
                                  child: TextFormField(
                                    maxLength: 20,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter Text';
                                      } else if (value.length < 2) {
                                        return 'Please enter atleast 2 characters';
                                      }
                                      return null;
                                    },
                                    autofocus: true,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                    ),
                                    decoration: InputDecoration(
                                      isCollapsed: true,
                                      suffixIconConstraints:
                                          const BoxConstraints(),
                                      contentPadding: EdgeInsets.all(17.h),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: const Color(0xff54595f),
                                          fontSize: 10.sp,
                                          fontFamily: "Roboto"),
                                      hintText: 'Enter text here',
                                    ),
                                    cursorColor: const Color(0xFF3B3F43),
                                    onFieldSubmitted: (String value) {
                                      setState(() {
                                        final FormState? form =
                                            _formKey.currentState;

                                        if (form != null && form.validate()) {
                                          textFieldVisibile =
                                              !textFieldVisibile;
                                          _textController.clear();
                                          _textList.add(value);
                                          Get.back();
                                          filterBottomSheet();
                                        }
                                      });
                                    },
                                    controller: _textController,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xff54595f)),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          textFieldVisibile =
                                              !textFieldVisibile;
                                          Get.back();
                                          filterBottomSheet();
                                        });
                                      },
                                      child: const Text('Cancel')),
                                )
                              ],
                            ),
                          ),
                        ),
                        sizedBoxHeight(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Select Tags",
                              style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.spMin,
                                color: const Color(0xFF3E3D3D),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight(13.h),
                        Wrap(
                          spacing: 11.w,
                          runSpacing: 7.h,
                          children: [
                            ..._textList
                                .map((text) => Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CommonChip(text: text),
                                        Visibility(
                                          visible: editChip,
                                          child: Row(
                                            children: [
                                              sizedBoxWidth(3.w),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _textList.remove(text);
                                                    Get.back();
                                                    filterBottomSheet();
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.cancel,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ))
                                .toList(),
                            const CommonChip(text: "Savoury moments"),
                            const CommonChip(text: "Quarter to quick"),
                            const CommonChip(text: "Juicy Mondays"),
                            const CommonChip(text: "The healthy way"),
                            const CommonChip(text: "Fry-day!!"),
                            const CommonChip(text: "Simple greens"),
                            const CommonChip(text: "Flavour explosions"),
                            const CommonChip(text: "The healthy way"),
                            SizedBox(
                              height: 18.h,
                              width: double.infinity,
                            ),
                            Text(
                              "South Africa Cuisine",
                              style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.spMin,
                                color: const Color(0xFF3E3D3D),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                              width: double.infinity,
                            ),
                            const CommonChip(text: "Limpopo"),
                            const CommonChip(text: "Easy"),
                            const CommonChip(text: "Food"),
                            const CommonChip(text: "Carrot"),
                            const CommonChip(text: "Quick"),
                            const CommonChip(text: "Yoghurt"),
                            const CommonChip(text: "Breakfast"),
                            const CommonChip(text: "Quick"),
                            const CommonChip(text: "Yoghurt"),
                            SizedBox(
                              width: double.infinity,
                              height: 13.h,
                            ),
                            Text(
                              "International Cuisine",
                              style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.spMin,
                                color: const Color(0xFF3E3D3D),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                              width: double.infinity,
                            ),
                            const CommonChip(text: "Limpopo"),
                            const CommonChip(text: "Easy"),
                            const CommonChip(text: "Food"),
                            const CommonChip(text: "Carrot"),
                            const CommonChip(text: "Quick"),
                            const CommonChip(text: "Yoghurt"),
                            const CommonChip(text: "Breakfast"),
                            const CommonChip(text: "Quick"),
                            const CommonChip(text: "Yoghurt"),
                            SizedBox(
                              height: 13.h,
                              width: double.infinity,
                            ),
                            Text(
                              "Select Difficulty",
                              style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.spMin,
                                color: const Color(0xFF3E3D3D),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                              width: double.infinity,
                            ),
                            const CommonChip(text: "Easy"),
                            const CommonChip(text: "Medium"),
                            const CommonChip(text: "Hard"),
                          ],
                        ),
                        sizedBoxHeight(32.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 39.h,
                              width: 113.w,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff54595F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    side: BorderSide.none,
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  "Search",
                                  style: TextStyle(
                                    fontFamily: "StudioProR",
                                    fontSize: 16.sp,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight(23.h)
                      ],
                    ),
                  ],
                ),
              ),
            )),
        isScrollControlled: true);
  }
}
