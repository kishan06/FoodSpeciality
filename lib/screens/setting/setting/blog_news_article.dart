import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/controllers/blogs_controller.dart';
import 'package:foodspeciality/screens/setting/setting/view_blog.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Model/blogs_model.dart';
import '../../../utils/texts.dart';

class BlogsNewsArticles extends StatefulWidget {
  const BlogsNewsArticles({super.key});

  @override
  State<BlogsNewsArticles> createState() => _BlogsNewsArticlesState();
}

class _BlogsNewsArticlesState extends State<BlogsNewsArticles> with SingleTickerProviderStateMixin {

  BlogsController controllerBlog = Get.put(BlogsController());
  String _filterBlog = '';
  List<Dessert>? dessertData;
  List<Healthy>? healthyData;
  List<Breakfast>? breakFastData;
  List<Dessert>? dessertDataSearch;
  List<Healthy>? healthyDataSearch;
  List<Breakfast>? breakFastDataSearch;
  
  final tecSearch = TextEditingController();
  late TabController _tabController;
  int? currentTabIndex;


  void initState() {
    // TODO: implement initState
    super.initState();
    controllerBlog.getBlogsData();
    _tabController = TabController(length: 3, vsync: this); // Number of tabs

    // Add a listener to the TabController to get the current index when it changes.
    _tabController.addListener(() {
      // print("Current Tab Index: ${_tabController.index}");
      currentTabIndex = _tabController.index;
      // tecSearch.clear();
      dessertData = dessertDataSearch;
      breakFastData = breakFastDataSearch;
      healthyData = healthyDataSearch;
      setState(() {
        tecSearch.clear();
      });
      print("currentTabIndex $currentTabIndex");

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const CustomAppBar(titleTxt: "Blogs/News/Articles"),
        body: GetBuilder<BlogsController>(builder: (builder){
          return controllerBlog.isLoading 
          ? Center(child: CircularProgressIndicator())
          : controllerBlog.blogsData == null
            ? Center(child: textgrey18BoldSP("Something went wrong"))
            : GetBuilder<BlogsController>(builder: (builder){
              if (dessertData == null) {
                dessertData = controllerBlog.blogsData!.data.dessert;
                dessertDataSearch = dessertData;
              } 
              if(breakFastData == null) {
                breakFastData = controllerBlog.blogsData!.data.breakfast;
                breakFastDataSearch = breakFastData;
              }
              if(healthyData == null) {
                healthyData = controllerBlog.blogsData!.data.healthy;
                healthyDataSearch = healthyData;
              }

              // breakFastData = 
              return Column(
                children: [
                  sizedBoxHeight(2),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        sizedBoxHeight(20.h),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Discover",
                                  style: TextStyle(
                                      fontFamily: "Studio Pro",
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            sizedBoxHeight(15.h),
                            SizedBox(
                              height: 44.h,
                              child: TextFormField(
                                controller: tecSearch,
                                onChanged: (value) {
                                  setState(() {
                                    _filterBlog = value;
                                    print(healthyData);
                                    // currentTabIndex;
                                    print(currentTabIndex);
                                    // if (healthyData != null) {
                                      if (currentTabIndex == 0) {
                                        dessertData = dessertDataSearch!.where((element) => element.title.toLowerCase().contains(_filterBlog.toLowerCase())).toList();
                                        
                                      }
                                      if (currentTabIndex == 1) {
                                        breakFastData = breakFastDataSearch!.where((element) => element.title.toLowerCase().contains(_filterBlog.toLowerCase())).toList();
                                        
                                      }
                                      if (currentTabIndex == 2) {
                                        healthyData = healthyDataSearch!.where((element) => element.title.toLowerCase().contains(_filterBlog.toLowerCase())).toList();
                                        
                                      }
                                      
                                      print(healthyData);
                                      
                                    // }
                                    // dessertData = 
                                  });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide:
                                          BorderSide(color: Color(0xFF707070), width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide:
                                          BorderSide(color: Color(0xFF707070), width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide:
                                          BorderSide(color: Color(0xFF707070), width: 1),
                                    ),
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                        color: const Color(0xff41414169), fontSize: 14.h),
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: const Icon(
                                      Icons.search,
                                      color: Color(0xff41414169),
                                    )),
                              ),
                            ),
                          
                          ],
                        ),
                        
                        sizedBoxHeight(25.h),
                        // TabBar(
                        //     indicatorSize: TabBarIndicatorSize.label,
                        //     indicatorWeight: 4.h,
                        //     indicatorColor: AppColors.greyD3B3F43,
                        //     unselectedLabelStyle:
                        //         const TextStyle(color: AppColors.greyL979797),
                        //     labelColor: AppColors.greyD3B3F43,
                        //     labelStyle: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 18.sp,
                        //     ),
                        //     tabs: [
                        //       Text(
                        //         "Dessert",
                        //         style: TextStyle(
                        //             fontFamily: "Studio Pro",
                        //             fontSize: 18.sp,
                        //             fontWeight: FontWeight.w500),
                        //       ),
                        //       Text(
                        //         "Breakfast",
                        //         style: TextStyle(
                        //             fontFamily: "Studio Pro",
                        //             fontSize: 18.sp,
                        //             fontWeight: FontWeight.w500),
                        //       ),
                        //       Text(
                        //         "Healthy",
                        //         style: TextStyle(
                        //             fontFamily: "Studio Pro",
                        //             fontSize: 18.sp,
                        //             fontWeight: FontWeight.w500),
                        //       ),
                        //     ])
                        TabBar(
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorWeight: 4.h,
                          indicatorColor: AppColors.greyD3B3F43,
                          unselectedLabelStyle:
                              const TextStyle(color: AppColors.greyL979797),
                          labelColor: AppColors.greyD3B3F43,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                          tabs: [
                            Tab(
                              child:
                                  // textgrey18BoldSP(label1)
                                  Text(
                                "Dessert",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18.sp),
                              ),
                            ),
                            Tab(
                              child:
                                  // textgrey18BoldSP(label2)
                                  Text(
                                "Breakfast",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18.sp),
                              ),
                            ),
                            Tab(
                              child:
                                  // textgrey18BoldSP(label2)
                                  Text(
                                "Healthy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                      DessertView(dessertData: dessertData),
                      BreakfastView(breakFastData: breakFastData),
                      HealthyView(healthyData: healthyData),
                    ]),
                  )
                ],
              );
        
            });
            
        })
        
      ),
    );
  }

  Widget DessertView({
    dessertData,
  }) {

    return SingleChildScrollView(
      child: Container(
        color: Color(0xffF2F2F2),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(31.h),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dessertData!.length,
              itemBuilder: (context, index) {
                final blogData = dessertData[index];
                String originalDate = blogData.publishDate;
                DateTime parsedDate =
                    DateTime.parse(originalDate);
                String formattedDate =
                    DateFormat('d MMMM y').format(parsedDate);
                // return blogsCard();
                return blogsCard(
                  imageUrl: blogData.contentImage, 
                  title: blogData.title, 
                  date: formattedDate, 
                  readTime: blogData.readTime,
                  name: blogData.name,
                  description: blogData.description
                );
              },
            ),
              
            // Column(
            //   children: [
            //     Stack(
            //       children: [
            //         Container(
            //           height: 154.h,
            //           width: double.infinity,
            //           decoration: BoxDecoration(
            //               image: DecorationImage(
            //                   fit: BoxFit.cover,
            //                   image:
            //                   NetworkImage(ApiUrls.base + dessertData![0].contentImage)
            //                       // AssetImage("assets/Chocolate-Chip-Cookies.png")
            //                       )),
            //         ),
            //         Container(
            //           margin: EdgeInsets.only(top: 8.h, left: 4.w),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(19.sp),
            //             color: const Color.fromRGBO(59, 63, 67, 0.71),
            //           ),
            //           height: 38.h,
            //           width: 135.w,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               sizedBoxWidth(6.w),
            //               const Icon(
            //                 Icons.watch_later_outlined,
            //                 color: Color(0xffffffff),
            //               ),
            //               Text(
            //                 " 5 min read",
            //                 style: TextStyle(
            //                     color: Color(0xffffffff),
            //                     fontFamily: "Studio Pro",
            //                     fontSize: 18.sp),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.only(
            //             bottomRight: Radius.circular(10.sp),
            //             bottomLeft: Radius.circular(10.sp)),
            //         color: Colors.white,
            //       ),
            //       padding: const EdgeInsets.only(left: 15, right: 15, bottom: 17),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           sizedBoxHeight(9.h),
            //           Text(
            //             "Glutten free pumpkin cookies",
            //             style: TextStyle(fontFamily: "Studio Pro", fontSize: 18.sp),
            //           ),
            //           sizedBoxHeight(5.h),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Row(
            //                 children: [
            //                   const Icon(Icons.calendar_today_outlined),
            //                   Text(
            //                     "14 October, 2022",
            //                     style: TextStyle(
            //                         fontFamily: "Roboto", fontSize: 14.sp),
            //                   ),
            //                 ],
            //               ),
            //               ElevatedButton(
            //                 style: ElevatedButton.styleFrom(
            //                   backgroundColor: const Color(0xff3B3F43),
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(8.r),
            //                     side: BorderSide.none,
            //                   ),
            //                   elevation: 0,
            //                 ),
            //                 onPressed: () {
            //                   // Get.to(Dessert());
            //                   Get.to(ViewBlogs());
            //                 },
            //                 child: Text(
            //                   "View",
            //                   style: TextStyle(
            //                       fontFamily: "Studio Pro", fontSize: 14.sp),
            //                 ),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //     sizedBoxHeight(19.h),

            //   ],
            // ),
           
            // sizedBoxHeight(19.h),
            // Stack(
            //   children: [
            //     Container(
            //       height: 154.h,
            //       width: double.infinity,
            //       decoration: BoxDecoration(
            //           image: DecorationImage(
            //               fit: BoxFit.cover,
            //               image: AssetImage("assets/tiramisu.png"))),
            //     ),
            //     Container(
            //       margin: EdgeInsets.only(top: 8.h, left: 4.w),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(19.sp),
            //         color: const Color.fromRGBO(59, 63, 67, 0.71),
            //       ),
            //       height: 38.h,
            //       width: 142.w,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           sizedBoxWidth(6.w),
            //           const Icon(
            //             Icons.watch_later_outlined,
            //             color: Color(0xffffffff),
            //           ),
            //           Text(
            //             " 15 min read",
            //             style: TextStyle(
            //                 color: Color(0xffffffff),
            //                 fontFamily: "Studio Pro",
            //                 fontSize: 18.sp),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //         bottomRight: Radius.circular(10.sp),
            //         bottomLeft: Radius.circular(10.sp)),
            //     color: Colors.white,
            //   ),
            //   padding: const EdgeInsets.only(left: 15, right: 15, bottom: 17),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       sizedBoxHeight(9.h),
            //       Text(
            //         "Tiramasu cake",
            //         style: TextStyle(fontFamily: "Studio Pro", fontSize: 18.sp),
            //       ),
            //       sizedBoxHeight(5.h),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               const Icon(Icons.calendar_today_outlined),
            //               Text(
            //                 "14 October, 2022",
            //                 style: TextStyle(
            //                     fontFamily: "Roboto", fontSize: 14.sp),
            //               ),
            //             ],
            //           ),
            //           ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: const Color(0xff3B3F43),
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(8.r),
            //                 side: BorderSide.none,
            //               ),
            //               elevation: 0,
            //             ),
            //             onPressed: () {
            //               Get.to(ViewBlogs());
            //             },
            //             child: Text(
            //               "View",
            //               style: TextStyle(
            //                   fontFamily: "Studio Pro", fontSize: 14.sp),
            //             ),
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            // sizedBoxHeight(80.h),
          ],
        ),
      ),
    );
  }

  Widget BreakfastView({
    breakFastData,
}) {

  return SingleChildScrollView(
    child: Container(
      color: Color(0xffF2F2F2),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          sizedBoxHeight(31.h),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: breakFastData!.length,
            itemBuilder: (context, index) {
              final blogData = breakFastData[index];
              String originalDate = blogData.publishDate;
              DateTime parsedDate =
                  DateTime.parse(originalDate);
              String formattedDate =
                  DateFormat('d MMMM y').format(parsedDate);
              // return blogsCard();
              return blogsCard(
                imageUrl: blogData.contentImage, 
                title: blogData.title, 
                date: formattedDate, 
                readTime: blogData.readTime,
                name: blogData.name,
                description: blogData.description

              );
            },
          ),
            

        ],
      ),
    ),
  );
}

  Widget HealthyView({
    healthyData,
  }) {

    return SingleChildScrollView(
      child: Container(
        color: Color(0xffF2F2F2),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(31.h),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: healthyData!.length,
              itemBuilder: (context, index) {
                final blogData = healthyData[index];
                String originalDate = blogData.publishDate;
                DateTime parsedDate =
                    DateTime.parse(originalDate);
                String formattedDate =
                    DateFormat('d MMMM y').format(parsedDate);
                // return blogsCard();
                return blogsCard(
                  imageUrl: blogData.contentImage, 
                  title: blogData.title, 
                  date: formattedDate, 
                  readTime: blogData.readTime,
                  name: blogData.name,
                  description: blogData.description
                );
              },
            ),
              

          ],
        ),
      ),
    );
  }


  Widget blogsCard({
    required String imageUrl,
    required String title,
    required String date,
    required int readTime,
    required String name,
    required String description,


  }){
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 154.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                      NetworkImage(ApiUrls.base + imageUrl)
                          // AssetImage("assets/Chocolate-Chip-Cookies.png")
                          )),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.h, left: 4.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.sp),
                color: const Color.fromRGBO(59, 63, 67, 0.71),
              ),
              height: 38.h,
              width: 135.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  sizedBoxWidth(6.w),
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Color(0xffffffff),
                  ),
                  Text(
                    " $readTime min read",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontFamily: "Studio Pro",
                        fontSize: 18.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.sp),
                bottomLeft: Radius.circular(10.sp)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxHeight(9.h),
              Text(
                "$title",
                style: TextStyle(fontFamily: "Studio Pro", fontSize: 18.sp),
              ),
              sizedBoxHeight(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined),
                      Text(
                        " $date",
                        style: TextStyle(
                            fontFamily: "Roboto", fontSize: 14.sp),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3B3F43),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        side: BorderSide.none,
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Get.to(Dessert());
                      // Get.to(ViewBlogs());
                      Get.toNamed("/ViewBlogs",
                        arguments: {
                          "readTime": readTime,
                          "imageUrl": imageUrl,
                          "name": name,
                          "date": date,
                          "title": title,
                          "description": description
                        }
                      );
                    },
                    child: Text(
                      "View",
                      style: TextStyle(
                          fontFamily: "Studio Pro", fontSize: 14.sp),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        sizedBoxHeight(19.h),

      ],
    );
  }
}
