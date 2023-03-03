import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleTxt: "Privacy Policy"),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Food Specialities Privacy Policy',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Studio Pro",
                    color: Colors.black,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been the \nindustrys standard dummy text ever since the 1500s, \nwhen an unknown printer took a galley of type and\nscrambled it to make a type specimen book.\n \n'
                  'survived not only five centuries, but also the leap into \nelectronic typesetting, remaining essentially \nunchanged.It was popularised in the 1960s with the \nrelease ofLetraset sheets containing Lorem Ipsum\n\n'
                  'passages, and more recently with desktop publishing \nsoftware like Aldus PageMaker including versions\nof Lorem Ipsum.\n\n'
                  'survived not only five centuries, but also the leap into \nelectronic typesetting, remaining essentially \nunchanged. It was popularised in the 1960s with the \nrelease of Letraset sheets containing Lorem Ipsum \n\npassages, and more recently with desktop publishing \nsoftware like Aldus PageMaker including versions \nof Lorem Ipsum.',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.black,
                    fontSize: 14.sp,
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
