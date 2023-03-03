import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:get/get.dart';

class Dessert extends StatefulWidget {
  const Dessert({super.key});

  @override
  State<Dessert> createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(titleTxt: "Blogs"),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.asset("assets/Chocolate 2.png"),
                    Container(
                      margin: EdgeInsets.only(top: 14.h, left: 18.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.sp),
                        color: const Color.fromRGBO(59, 63, 67, 0.71),
                      ),
                      height: 38.h,
                      width: 135.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dessert",
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontFamily: "Studio Pro",
                                fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
              ),
              expandedHeight: 220,
              backgroundColor: Colors.white,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => SingleChildScrollView(
                  // physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.sp),
                          topRight: Radius.circular(30.sp)),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    // width: 20,
                    height: 600,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedBoxHeight(27.h),
                          Text(
                            "Kartikey Gautam",
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 16.sp),
                          ),
                          sizedBoxHeight(7.h),
                          Text(
                            "14 October, 2022",
                            style: TextStyle(
                                fontFamily: "Roboto", fontSize: 10.sp),
                          ),
                          sizedBoxHeight(22.h),
                          Text(
                            "Glutten free pumpkin cookies",
                            style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          sizedBoxHeight(10.h),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an \nunknown \nprinter took a galley of type and scrambled it to make a type specimen book. \n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It \nwas popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more \nrecently \nwith desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some \nform, by injected humour, or randomised words which don't\n look even slightly believable. If you are going to use a \npassage of Lorem Ipsum, you need to be sure there isn't \nanything embarrassing hidden in the middle of text.",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 14.sp,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ), //SliverChildBuildDelegate
            ) //SliverList
          ], //<Widget>[]
        ) //CustonScrollView
        ); //Scaffold
  }
}
