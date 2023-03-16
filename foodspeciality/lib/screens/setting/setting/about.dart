import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';

class AboutFoodSpeciality extends StatefulWidget {
  const AboutFoodSpeciality({super.key});

  @override
  State<AboutFoodSpeciality> createState() => _AboutFoodSpecialityState();
}

class _AboutFoodSpecialityState extends State<AboutFoodSpeciality> {
  bool more = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: 'About Food Speciality'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // RichText(text: 'text'),
            sizedBoxHeight(20.h),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a",
              maxLines: more ? null : 2,
              // overflow: TextOverflow.fade,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  more = !more;
                });
              },
              child: Text(
                more ? 'Less' : 'More',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
