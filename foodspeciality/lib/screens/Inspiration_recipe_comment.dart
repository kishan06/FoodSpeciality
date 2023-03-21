import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/recipe_ingredients.dart';
import 'package:get/get.dart';

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
  late TabController _tabController;
  int _currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                                  child:
                                      SvgPicture.asset('assets/Path 39.svg',
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
                                  width: double.infinity,
                                  child: TabBar(
                                      controller: _tabController,
                                      // onTap: (int index) {
                                      //   setState(() {
                                      //     _selectedIndex = index;
                                      //   });
                                      // },
                                      indicatorColor: Colors.transparent,
                                      unselectedLabelColor:
                                          Colors.amberAccent,
                                      labelPadding:
                                          EdgeInsets.only(right: 9.w),
                                      isScrollable: true,
                                      indicator: null,
                                      // indicatorWeight: 0,
                                      tabs: [
                                        Container(
                                          height: 27,
                                          decoration: BoxDecoration(
                                              color: _getTabColor(0),
                                              //  Color(0xffE1E1E1),
                                              borderRadius:
                                                  BorderRadius.circular(14)),
                                          child: Center(
                                            widthFactor: 1.3,
                                            child: Text(
                                              "Limpopo",
                                              style: TextStyle(
                                                  color: _getTextColor(0),
                                                  fontFamily: "StudioProR",
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: 27,
                                            decoration: BoxDecoration(
                                                color: _getTabColor(1),
                                                //  Color(0xffE1E1E1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        14)),
                                            child: Center(
                                              widthFactor: 1.3,
                                              child: Text(
                                                "Simple greens",
                                                style: TextStyle(
                                                    color: _getTextColor(1),
                                                    fontFamily: "Studio Pro",
                                                    fontSize: 10),
                                              ),
                                            )),
                                        Container(
                                            height: 27,
                                            decoration: BoxDecoration(
                                                color: _getTabColor(2),
                                                //  Color(0xffE1E1E1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        14)),
                                            child: Center(
                                              widthFactor: 1.3,
                                              child: Text(
                                                "Flavour explosions",
                                                style: TextStyle(
                                                    color: _getTextColor(2),
                                                    fontFamily: "Studio Pro",
                                                    fontSize: 10),
                                              ),
                                            )),
                                        Container(
                                            height: 27,
                                            decoration: BoxDecoration(
                                                color: _getTabColor(3),
                                                //  Color(0xffE1E1E1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        14)),
                                            child: Center(
                                              widthFactor: 1.3,
                                              child: Text(
                                                "The healthy way",
                                                style: TextStyle(
                                                    color: _getTextColor(3),
                                                    fontFamily: "Studio Pro",
                                                    fontSize: 10),
                                              ),
                                            )),
                                      ])),
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
              // xd
              Expanded(
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      DataTabBarView(),
                      DataTabBarView(),
                      DataTabBarView(),
                      DataTabBarView()
                    ],
                  ),
                ),
              ),
          
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: 
                  // NestedScrollView(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   scrollDirection: Axis.vertical,
                  //   headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  //     SliverToBoxAdapter(
                  //       child: Column(
                  //         children: [
                  //           TabBar(
                  //             indicator: UnderlineTabIndicator(
                  //               borderRadius: BorderRadius.circular(10),
                  //               borderSide: BorderSide(width: 2.5.sp),
                  //               // insets: EdgeInsets.symmetric(horizontal: 80.w),
                  //             ),
                  //             indicatorSize: TabBarIndicatorSize.tab,
                  //             indicatorPadding:
                  //                 const EdgeInsets.symmetric(horizontal: 50),
                  //             // indicatorWeight: 4,
                    
                  //             indicatorColor: const Color(0xFF3B3F43),
                  //             unselectedLabelStyle:
                  //                 const TextStyle(color: Color(0xFF6B6B6B)),
                  //             labelColor: const Color.fromRGBO(59, 63, 67, 1),
                  //             labelStyle: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 18.sp,
                  //             ),
                  //             tabs: [
                  //               Tab(
                  //                 child: Text(
                  //                   "Recipe",
                  //                   style: TextStyle(
                  //                       fontFamily: "StudioProM", fontSize: 17.sp),
                  //                 ),
                  //               ),
                  //               Tab(
                  //                 child: Text(
                  //                   "Comments",
                  //                   style: TextStyle(
                  //                       fontFamily: "StudioProM", fontSize: 17.sp),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  //   ], 
                  //   body: 
                  //   // SizedBox(
                  //   //   height: 10.h,
                  //   // )
                  //   TabBarView(
                  //     physics: NeverScrollableScrollPhysics(),
                  //     children: [
                  //     _recipeTabbarView(),
                  //     Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 22.w),
                  //       child: _commentTabbarView(),
                  //     )
                  //   ])
                  // )
               
                  Column(
                    children: [
                      PreferredSize(
                        preferredSize: const Size.fromHeight(20),
                        child: TabBar(
                          indicator: UnderlineTabIndicator(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 2.5.sp),
                            // insets: EdgeInsets.symmetric(horizontal: 80.w),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding:
                              const EdgeInsets.symmetric(horizontal: 50),
                          // indicatorWeight: 4,
                
                          indicatorColor: const Color(0xFF3B3F43),
                          unselectedLabelStyle:
                              const TextStyle(color: Color(0xFF6B6B6B)),
                          labelColor: const Color.fromRGBO(59, 63, 67, 1),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                          tabs: [
                            Tab(
                              child: Text(
                                "Recipe",
                                style: TextStyle(
                                    fontFamily: "StudioProM", fontSize: 17.sp),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Comments",
                                style: TextStyle(
                                    fontFamily: "StudioProM", fontSize: 17.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBoxHeight(23.h),
                      SizedBox(
                          height: MediaQuery.of(context).size.shortestSide,
                          child: TabBarView(
                            // physics: NeverScrollableScrollPhysics(),
                            children: [
                            _recipeTabbarView(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22.w),
                              child: _commentTabbarView(),
                            )
                          ])
                  ),
                    ],
                  ),
              
                ),
              ),
            
            ],
          ),
        ),
        
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget DataTabBarView() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          sizedBoxHeight(23.h),
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
                            color: const Color(0xff020202), fontSize: 10.sp),
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
                            color: const Color(0xff020202), fontSize: 10.sp),
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
                            color: const Color(0xff020202), fontSize: 10.sp),
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
                          image: AssetImage("assets/Mask Group 40.png")),
                    ),
                    sizedBoxWidth(9.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Namrata Burondkar",
                          style: TextStyle(
                              fontSize: 16.h, fontWeight: FontWeight.bold),
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
                              width: 1.sp, color: const Color(0xff3B3F43)),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp))),
                      onPressed: () {
                        FilterBottomSheet();
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
              Text("Lorem Ipsum is simply dummy text of the printing and ty..",
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
          sizedBoxHeight(21.h),
          // DefaultTabController(
          //   length: 2,
          //   child: NestedScrollView(
          //     scrollDirection: Axis.vertical,
          //     headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //       SliverToBoxAdapter(
          //         child: Column(
          //           children: [
          //             TabBar(
          //               indicator: UnderlineTabIndicator(
          //                 borderRadius: BorderRadius.circular(10),
          //                 borderSide: BorderSide(width: 2.5.sp),
          //                 // insets: EdgeInsets.symmetric(horizontal: 80.w),
          //               ),
          //               indicatorSize: TabBarIndicatorSize.tab,
          //               indicatorPadding:
          //                   const EdgeInsets.symmetric(horizontal: 50),
          //               // indicatorWeight: 4,
              
          //               indicatorColor: const Color(0xFF3B3F43),
          //               unselectedLabelStyle:
          //                   const TextStyle(color: Color(0xFF6B6B6B)),
          //               labelColor: const Color.fromRGBO(59, 63, 67, 1),
          //               labelStyle: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 18.sp,
          //               ),
          //               tabs: [
          //                 Tab(
          //                   child: Text(
          //                     "Recipe",
          //                     style: TextStyle(
          //                         fontFamily: "StudioProM", fontSize: 17.sp),
          //                   ),
          //                 ),
          //                 Tab(
          //                   child: Text(
          //                     "Comments",
          //                     style: TextStyle(
          //                         fontFamily: "StudioProM", fontSize: 17.sp),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       )
          //     ], 
          //     body: 
          //     SizedBox(
          //       height: 10.h,
          //     )
          //     // TabBarView(
          //     //   // physics: NeverScrollableScrollPhysics(),
          //     //   children: [
          //     //   _recipeTabbarView(),
          //     //   Padding(
          //     //     padding: EdgeInsets.symmetric(horizontal: 22.w),
          //     //     child: _commentTabbarView(),
          //     //   )
          //     // ])
          //   )
          //   // Column(
          //   //   children: [
          //   //     PreferredSize(
          //   //       preferredSize: const Size.fromHeight(20),
          //   //       child: TabBar(
          //   //         indicator: UnderlineTabIndicator(
          //   //           borderRadius: BorderRadius.circular(10),
          //   //           borderSide: BorderSide(width: 2.5.sp),
          //   //           // insets: EdgeInsets.symmetric(horizontal: 80.w),
          //   //         ),
          //   //         indicatorSize: TabBarIndicatorSize.tab,
          //   //         indicatorPadding:
          //   //             const EdgeInsets.symmetric(horizontal: 50),
          //   //         // indicatorWeight: 4,
          
          //   //         indicatorColor: const Color(0xFF3B3F43),
          //   //         unselectedLabelStyle:
          //   //             const TextStyle(color: Color(0xFF6B6B6B)),
          //   //         labelColor: const Color.fromRGBO(59, 63, 67, 1),
          //   //         labelStyle: TextStyle(
          //   //           fontWeight: FontWeight.bold,
          //   //           fontSize: 18.sp,
          //   //         ),
          //   //         tabs: [
          //   //           Tab(
          //   //             child: Text(
          //   //               "Recipe",
          //   //               style: TextStyle(
          //   //                   fontFamily: "StudioProM", fontSize: 17.sp),
          //   //             ),
          //   //           ),
          //   //           Tab(
          //   //             child: Text(
          //   //               "Comments",
          //   //               style: TextStyle(
          //   //                   fontFamily: "StudioProM", fontSize: 17.sp),
          //   //             ),
          //   //           ),
          //   //         ],
          //   //       ),
          //   //     ),
          //   //     sizedBoxHeight(23.h),
          //   //     SizedBox(
          //   //         height: MediaQuery.of(context).size.shortestSide,
          //   //         child: TabBarView(
          //   //           // physics: NeverScrollableScrollPhysics(),
          //   //           children: [
          //   //           _recipeTabbarView(),
          //   //           Padding(
          //   //             padding: EdgeInsets.symmetric(horizontal: 22.w),
          //   //             child: _commentTabbarView(),
          //   //           )
          //   //         ])
          //   // ),
          //   //   ],
          //   // ),
          // ),
        
        ],
      ),
    );
  }

  Widget _recipeTabbarView() {
    return SingleChildScrollView(
      child: Column(
        children: [
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
          sizedBoxHeight(50)
        ],
      ),
    );
  }
}
