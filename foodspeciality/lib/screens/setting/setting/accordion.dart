import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:getwidget/getwidget.dart';

class Accordion extends StatefulWidget {
  const Accordion({Key? key}) : super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: "Frequently Asked Questions"),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'FAQ',
                style: TextStyle(
                  fontFamily: 'Studio Pro',
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBoxHeight(20.h),
              Text(
                'Account info',
                style: TextStyle(
                  fontFamily: 'Studio Pro',
                  color: const Color(0xff3B3F43),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBoxHeight(16.h),
              GFAccordion(
                margin: const EdgeInsets.all(0),
                titlePadding: EdgeInsets.only(
                    top: 10.h, right: 10.w, left: 10.w, bottom: 10.h),
                contentPadding: EdgeInsets.only(
                    top: 20.h, bottom: 20.h, right: 10.w, left: 10.w),
                expandedTitleBackgroundColor: const Color(0xffF2F2F2),
                collapsedIcon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16.sp,
                ),
                expandedIcon: Icon(
                  Icons.close,
                  size: 16.sp,
                ),
                contentBackgroundColor: const Color(0xffF2F2F2),
                titleChild: Text(
                  'How do I change my username?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                contentChild: Text(
                  'On the website, tap your profile image in the top\nright corner, click view my profile and click edit\nprofile. After that you can edit your username,\nlocation, bio or change your profile picture.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              sizedBoxHeight(16.h),
              GFAccordion(
                margin: const EdgeInsets.all(0),
                titlePadding: EdgeInsets.only(
                    top: 10.h, right: 10.w, left: 10.w, bottom: 10.h),
                contentPadding: EdgeInsets.only(
                    top: 20.h, bottom: 20.h, right: 10.w, left: 10.w),
                expandedTitleBackgroundColor: const Color(0xffF2F2F2),
                collapsedIcon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16.sp,
                ),
                expandedIcon: Icon(
                  Icons.close,
                  size: 16.sp,
                ),
                contentBackgroundColor: const Color(0xffF2F2F2),
                titleChild: Text(
                  'How do I turn off my notifications?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                contentChild: Text(
                  'On the website, tap your profile image in the top\nright corner, click view my profile and click edit\nprofile. After that you can edit your username,\nlocation, bio or change your profile picture.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              sizedBoxHeight(20.h),
              GFAccordion(
                margin: const EdgeInsets.all(0),
                titlePadding: EdgeInsets.only(
                    top: 10.h, right: 10.w, left: 10.w, bottom: 10.h),
                contentPadding: EdgeInsets.only(
                    top: 20.h, bottom: 20.h, right: 10.w, left: 10.w),
                expandedTitleBackgroundColor: const Color(0xffF2F2F2),
                collapsedIcon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16.sp,
                ),
                expandedIcon: Icon(
                  Icons.close,
                  size: 16.sp,
                ),
                contentBackgroundColor: const Color(0xffF2F2F2),
                titleChild: Text(
                  'I can’t log in, help!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                contentChild: Text(
                  'On the website, tap your profile image in the top\nright corner, click view my profile and click edit\nprofile. After that you can edit your username,\nlocation, bio or change your profile picture.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              sizedBoxHeight(20.h),
              GFAccordion(
                margin: const EdgeInsets.all(0),
                titlePadding: EdgeInsets.only(
                    top: 10.h, right: 10.w, left: 10.w, bottom: 10.h),
                contentPadding: EdgeInsets.only(
                    top: 20.h, bottom: 20.h, right: 10.w, left: 10.w),
                expandedTitleBackgroundColor: const Color(0xffF2F2F2),
                collapsedIcon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16.sp,
                ),
                expandedIcon: Icon(
                  Icons.close,
                  size: 16.sp,
                ),
                contentBackgroundColor: const Color(0xffF2F2F2),
                titleChild: Text(
                  'I want to cancel or delete my account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                contentChild: Text(
                  'On the website, tap your profile image in the top\nright corner, click view my profile and click edit\nprofile. After that you can edit your username,\nlocation, bio or change your profile picture.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              sizedBoxHeight(36.h),
              Text(
                'Notification',
                style: TextStyle(
                  fontFamily: 'Studio Pro',
                  color: const Color(0xff3B3F43),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBoxHeight(14.h),
              GFAccordion(
                margin: const EdgeInsets.all(0),
                titlePadding: EdgeInsets.only(
                    top: 10.h, right: 10.w, left: 10.w, bottom: 10.h),
                contentPadding: EdgeInsets.only(
                    top: 20.h, bottom: 20.h, right: 10.w, left: 10.w),
                expandedTitleBackgroundColor: const Color(0xffF2F2F2),
                collapsedIcon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16.sp,
                ),
                expandedIcon: Icon(
                  Icons.close,
                  size: 16.sp,
                ),
                contentBackgroundColor: const Color(0xffF2F2F2),
                titleChild: Text(
                  'How do I get emails?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                contentChild: Text(
                  'On the website, tap your profile image in the top\nright corner, click view my profile and click edit\nprofile. After that you can edit your username,\nlocation, bio or change your profile picture.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              sizedBoxHeight(20.h),
              GFAccordion(
                margin: const EdgeInsets.all(0),
                titlePadding: EdgeInsets.only(
                    top: 10.h, right: 10.w, left: 10.w, bottom: 10.h),
                contentPadding: EdgeInsets.only(
                    top: 20.h, bottom: 20.h, right: 10.w, left: 10.w),
                expandedTitleBackgroundColor: const Color(0xffF2F2F2),
                collapsedIcon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16.sp,
                ),
                expandedIcon: Icon(
                  Icons.close,
                  size: 16.sp,
                ),
                contentBackgroundColor: const Color(0xffF2F2F2),
                titleChild: Text(
                  'How do I unsubscribe from emails?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                contentChild: Text(
                  'On the website, tap your profile image in the top\nright corner, click view my profile and click edit\nprofile. After that you can edit your username,\nlocation, bio or change your profile picture.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              sizedBoxHeight(36.h),
              Text(
                'Contact us',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: const Color(0xff3B3F43),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBoxHeight(14.h),
              GFAccordion(
                margin: const EdgeInsets.all(0),
                titlePadding: EdgeInsets.only(
                    top: 10.h, right: 10.w, left: 10.w, bottom: 10.h),
                contentPadding: EdgeInsets.only(
                    top: 20.h, bottom: 20.h, right: 10.w, left: 10.w),
                expandedTitleBackgroundColor: const Color(0xffF2F2F2),
                collapsedIcon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16.sp,
                ),
                expandedIcon: Icon(
                  Icons.close,
                  size: 16.sp,
                ),
                contentBackgroundColor: const Color(0xffF2F2F2),
                titleChild: Text(
                  'How do I contact food speciality?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                contentChild: Text(
                  'On the website, tap your profile image in the top\nright corner, click view my profile and click edit\nprofile. After that you can edit your username,\nlocation, bio or change your profile picture.',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
