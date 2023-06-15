import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';

class CommunityGuidelines extends StatelessWidget {
  const CommunityGuidelines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleTxt: "Community Guidelines"),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Food Specialties Community Guidelines',
                  style: TextStyle(
                    fontFamily: 'Studio Pro',
                    color: Colors.black,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            sizedBoxHeight(18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printin and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type an scrambled it to make a type specimen book\n\n'
                    'survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It was popularised in the 1960s with the release ofLetraset sheets containing Lorem Ipsu\n\n'
                    'passages, and more recently with desktop publishing software like Aldus PageMaker including version of Lorem Ipsum\n\n'
                    'survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum \n\npassages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n',
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
