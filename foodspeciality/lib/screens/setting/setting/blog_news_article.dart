import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/setting/setting/dessert.dart';
import 'package:get/get.dart';

class BlogsNewsArticles extends StatefulWidget {
  const BlogsNewsArticles({super.key});

  @override
  State<BlogsNewsArticles> createState() => _BlogsNewsArticlesState();
}

class _BlogsNewsArticlesState extends State<BlogsNewsArticles> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const CustomAppBar(titleTxt: "Blogs/News/Articles"),
        body: Column(
          children: [
            sizedBoxHeight(2),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  sizedBoxHeight(20.h),
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
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            gapPadding: 0,
                            borderSide:
                                const BorderSide(color: Color(0xff707070)),
                            borderRadius: BorderRadius.circular(8.r),
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
                  sizedBoxHeight(25.h),
                  TabBar(
                      indicator: UnderlineTabIndicator(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 2.5.sp),
                          insets: EdgeInsets.symmetric(horizontal: 90.w)),
                      indicatorSize: TabBarIndicatorSize.label,
                      // indicatorWeight: 4,

                      indicatorColor: const Color(0xFF3B3F43),
                      unselectedLabelStyle:
                          const TextStyle(color: Color(0xFF979797)),
                      labelColor: const Color(0xff3B3F43),
                      labelStyle: TextStyle(
                        fontFamily: "Studio Pro",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                      tabs: [
                        Text(
                          "Dessert",
                          style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Breakfast",
                          style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Healthy",
                          style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ])
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                DataTabBarView(),
                DataTabBarView(),
                DataTabBarView(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget DataTabBarView() {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xffF2F2F2),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            sizedBoxHeight(31.h),
            Stack(
              children: [
                Image.asset("assets/Chocolate-Chip-Cookies.png"),
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
                        " 5 min read",
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
                    "Glutten free pumpkin cookies",
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
                            "14 October, 2022",
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
                          Get.to(Dessert());
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
            Stack(
              children: [
                Image.asset("assets/tiramisu.png"),
                Container(
                  margin: EdgeInsets.only(top: 8.h, left: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19.sp),
                    color: const Color.fromRGBO(59, 63, 67, 0.71),
                  ),
                  height: 38.h,
                  width: 142.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      sizedBoxWidth(6.w),
                      const Icon(
                        Icons.watch_later_outlined,
                        color: Color(0xffffffff),
                      ),
                      Text(
                        " 15 min read",
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
                    "Tiramasu cake",
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
                            "14 October, 2022",
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
                          Get.to(Dessert());
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
        ),
      ),
    );
  }
}
