import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/screens/gridviewuser_content.dart';

class Gridview extends StatefulWidget {
  const Gridview({
    super.key,
  });

  @override
  State<Gridview> createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  int currentIndex = 0;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (0.4 / 0.5),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10),
                itemCount: contents.length,
                itemBuilder: (_, i) {
                  return Container(
                      height: 225.h,
                      width: 190.w,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 6.0, // soften the shadow
                              spreadRadius: 0.0, //extend the shadow
                              offset: Offset(
                                3.0, // Move to right 5  horizontally
                                3.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            contents[i].recipeimage,
                            height: 140,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 7.0, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contents[i].title,
                                  style: TextStyle(
                                      fontFamily: "Roboto", fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  contents[i].name,
                                  style: TextStyle(
                                      color: Color(0xFF6B6B6B),
                                      fontFamily: "Roboto",
                                      fontSize: 10.sp),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/like-svgrepo-com.svg",
                                          height: 16.h,
                                          width: 19.w,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          "55",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontSize: 12.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/comment.svg",
                                          height: 16.h,
                                          width: 19.w,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          "2",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontSize: 12.sp),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/Bookmark.svg",
                                          height: 16.h,
                                          width: 19.w,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          "35",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontSize: 12.sp),
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
                }),
          ],
        ),
      ),
    );
  }
}
