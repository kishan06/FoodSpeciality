import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../common files/global.dart';
import '../controllers/user_data_controller.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isSwitched = false;
  File? _image;
  UserDataController userDataController = Get.put(UserDataController());
  final tecUserName = TextEditingController();
  final tecFirstName = TextEditingController();
  final tecLastName = TextEditingController();
  final tecBio = TextEditingController();
  final tecCurrentLocation = TextEditingController();
  final tecSocialLink = TextEditingController();
  final tecInstaLink = TextEditingController();
  final tecTwitterLink = TextEditingController();
  final tecPinrestLink = TextEditingController();
  final tecFacebookLink = TextEditingController();

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      // final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    return File(imagePath).copy(imagePath);
  }

  builduploadprofile() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImage(ImageSource.camera);
                        Get.back();
                      },
                      child: Column(
                        children: const [
                          Icon(
                            Icons.camera,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Get.back();
                      },
                      child: Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDataController.getUserProfile();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      "assets/icons/back_arrow.svg",
                      height: 18.h,
                      width: 27.h,
                      color: AppColors.greyD3B3F43,
                    ),
                  ),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                        fontFamily: "StudioProR",
                        fontWeight: FontWeight.bold,
                        fontSize: 22.h,
                        color: const Color(0xFF54595F)),
                  ),
                  InkWell(
                      onTap: () {
                        Get.back();
                        Get.snackbar(
                            "Successful", "Changes saved successfully");
                      },
                      child: InkWell(
                        onTap: (){
                          userDataController.editProfile(
                            body: 
                              {
                                'bio': tecBio.text,
                                'location': tecCurrentLocation.text,
                                'social_links': tecSocialLink.text,
                                'twitter_link': tecTwitterLink.text,
                                'instagram_link': tecInstaLink.text,
                                'pinterest_link': tecPinrestLink.text,
                                'facebook_link': tecFacebookLink.text
                              },
                            profileImage: _image != null ? _image!.path : null
                          );
                        },
                        child: textgreyD16BoldSP("Save")))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: GetBuilder<UserDataController>(builder: (builder){
                    return userDataController.isLoading 
                    ? Center(child: CircularProgressIndicator())
                    : userDataController.userData == null 
                      ? textgrey18BoldSP("Something went wrong")
                      : GetBuilder<UserDataController>(builder: (builder){
                        final profileData = userDataController.userData!.data;
                        tecUserName.text = profileData.username;
                        tecFirstName.text = profileData.firstName;
                        tecLastName.text = profileData.lastName;
                        tecBio.text = profileData.bio ?? "";
                        tecCurrentLocation.text = profileData.location ?? "";
                        tecSocialLink.text = profileData.socialLinks ?? "";
                        tecInstaLink.text = profileData.instagramLink ?? "";
                        tecTwitterLink.text = profileData.twitterLink ?? "";
                        tecPinrestLink.text = profileData.pinterestLink ?? "";
                        tecFacebookLink.text = profileData.facebookLink ?? "";
                      
                        return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedBoxHeight(10.h),
                          
                          Center(
                            child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  ClipOval(
                                    child: SizedBox.fromSize(
                                        size: const Size.fromRadius(50),
                                        child: _image != null
                                            ? Image.file(
                                                _image!,
                                                width: 150.w,
                                                height: 150.h,
                                                fit: BoxFit.cover,
                                              )
                                            : userDataController.userData!.data.profileImage == null
                                            ? Image.asset('assets/default_profile.webp')
                                            : Image.network(ApiUrls.base + userDataController.userData!.data.profileImage)
                                            ),
                                  ),
                                  Positioned(
                                    bottom: 70,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: () {
                                        builduploadprofile();
                                      },
                                      child: Image.asset("assets/Group 57623.png"),
                                    ),
                                  ),
                                ]),
                          ),
                          // Center(
                          //   child: Stack(
                          //     children: [
                          //       SizedBox(
                          //         width: 150.w,
                          //         child: CircleAvatar(
                          //           radius: 51.r,
                          //           backgroundColor: Colors.grey,
                          //           child:  _image != null
                          //                   ? Image.file(
                          //                       _image!,
                          //                       width: 200,
                          //                       height: 200,
                          //                       fit: BoxFit.cover,
                          //                     )
                          //                   : AssetImage("assets/Mask Group 40.png"),
                  
                          //         ),
                          //       ),
                          //       Positioned(
                          //           top: 10.h,
                          //           left: 100.w,
                          //           child: Image(
                          //               height: 22.h,
                          //               width: 22.h,
                          //               image: AssetImage("assets/Group 57623.png")))
                          //     ],
                          //   ),
                          // ),
                  
                          sizedBoxHeight(25.h),
                  
                          // TextFormField(
                          //   maxLength: 100,
                          //   maxLines: 5,
                          //   decoration: InputDecoration(
                          //     hintText: 'Bio',
                          //     hintStyle: TextStyle(
                          //         color: Color(0xFF707070),
                          //         fontSize: 14.h,
                          //         fontWeight: FontWeight.w400,
                          //         fontFamily: "Roboto"),
                          //     border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.only(
                          //             topLeft: Radius.circular(8.r),
                          //             topRight: Radius.circular(8.r)),
                          //         borderSide: BorderSide(
                          //             width: 0.5.w,
                          //             color: const Color.fromRGBO(191, 191, 191, 1))),
                          //   ),
                          // ),
                  
                          // SizedBox(
                          //   height: 20.h,
                          // ),
                          textgreyD16MedSP("Username*"),
                  
                          sizedBoxHeight(4.h),
                  
                          SizedBox(
                            width: 340.w,
                            height: 25.h,
                            child: TextFormField(
                              controller: tecUserName,
                              readOnly: true,
                              // initialValue: ,
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                  fontFamily: "Roboto"),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 12),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle:
                                    // TextStyle(
                                    //     color: Color.fromRGBO(151, 151, 151, 0.48),
                                    //     fontFamily: "Roboto",
                                    //     fontSize: 16.sp),`
                                    TextStyle(
                                        color: AppColors.greyM707070,
                                        fontSize: 14.sp,
                                        fontFamily: "Roboto"),
                                hintText: "",
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                  
                          sizedBoxHeight(20.h),
                          // textgreyM14Robo("@Namrata07"),
                  
                          textgreyD16MedSP("First Name*"),
                  
                          sizedBoxHeight(4.h),
                  
                          SizedBox(
                            width: 340.w,
                            height: 25.h,
                            child: TextFormField(
                              readOnly: true,

                              controller: tecFirstName,
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                  fontFamily: "Roboto"),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 12),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle:
                                    // TextStyle(
                                    //     color: Color.fromRGBO(151, 151, 151, 0.48),
                                    //     fontFamily: "Roboto",
                                    //     fontSize: 16.sp),
                                    TextStyle(
                                        color: AppColors.greyM707070,
                                        fontSize: 14.sp,
                                        fontFamily: "Roboto"),
                                hintText: "Namrata",
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                  
                          sizedBoxHeight(20.h),
                  
                          textgreyD16MedSP("Last Name*"),
                  
                          sizedBoxHeight(4.h),
                  
                          SizedBox(
                            width: 340.w,
                            height: 25.h,
                            child: TextFormField(
                              readOnly: true,

                              controller: tecLastName,
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                  fontFamily: "Roboto"),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 12),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle:
                                    // TextStyle(
                                    //     color: Color.fromRGBO(151, 151, 151, 0.48),
                                    //     fontFamily: "Roboto",
                                    //     fontSize: 16.sp),
                                    TextStyle(
                                        color: AppColors.greyM707070,
                                        fontSize: 14.sp,
                                        fontFamily: "Roboto"),
                                hintText: "Borundkar",
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                  
                          sizedBoxHeight(15.h),
                  
                          textgreyD16MedSP("Bio"),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormField(
                            controller: tecBio,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: 'Bio',
                              hintStyle: TextStyle(
                                  color: const Color(0xFF707070),
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    topRight: Radius.circular(8.r)),
                                borderSide:
                                    const BorderSide(color: Color(0xFF707070), width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    topRight: Radius.circular(8.r)),
                                borderSide:
                                    const BorderSide(color: Color(0xFF707070), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    topRight: Radius.circular(8.r)),
                                borderSide:
                                    const BorderSide(color: Color(0xFF707070), width: 1),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    topRight: Radius.circular(8.r)),
                                borderSide: const BorderSide(color: Colors.red, width: 1),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    topRight: Radius.circular(8.r)),
                                borderSide: const BorderSide(color: Colors.red, width: 1),
                              ),
                            ),
                          ),
                  
                          sizedBoxHeight(22.h),
                  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Current Location",
                                style: TextStyle(
                                    color: const Color(0xFF3B3F43),
                                    fontSize: 18.h,
                                    fontFamily: "StudioProR",
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 17.r,
                                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                                  ),
                                  const Positioned.fill(
                                    child: Image(image: AssetImage("assets/Page-1.png")),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              SizedBox(
                                width: 340.w,
                                height: 25.h,
                                child: TextFormField(
                                  controller: tecCurrentLocation,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 16.sp),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(bottom: 12),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(151, 151, 151, 0.48),
                                        fontFamily: "Roboto",
                                        fontSize: 16.sp),
                                    hintText: "South Africa,Western Cape",
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Social/Website Links",
                                style: TextStyle(
                                    color: const Color(0xFF3B3F43),
                                    fontSize: 18.h,
                                    fontFamily: "StudioProR",
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 17.r,
                                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                                  ),
                                  const Positioned.fill(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/website-ui-web-svgrepo-com.png")),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              SizedBox(
                                width: 340.w,
                                height: 25.h,
                                child: TextFormField(
                                  controller: tecSocialLink,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 16.sp),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(bottom: 12),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(151, 151, 151, 0.48),
                                        fontFamily: "Roboto",
                                        fontSize: 16.sp),
                                    hintText: "https://foodspecialities.com",
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 17.r,
                                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                                  ),
                                  const Positioned.fill(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/instagram-svgrepo-com.png")),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              SizedBox(
                                width: 340.w,
                                height: 25.h,
                                child: TextFormField(
                                  controller: tecInstaLink,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 16.sp),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(bottom: 12),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(151, 151, 151, 0.48),
                                        fontFamily: "Roboto",
                                        fontSize: 16.sp),
                                    hintText: "https://foodspecialitiesInsta.com",
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 17.r,
                                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                                  ),
                                  const Positioned.fill(
                                    child: Image(
                                        image:
                                            AssetImage("assets/twitter-svgrepo-com.png")),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              SizedBox(
                                width: 340.w,
                                height: 25.h,
                                child: TextFormField(
                                  controller: tecTwitterLink,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 16.sp),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(bottom: 12),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(151, 151, 151, 0.48),
                                        fontFamily: "Roboto",
                                        fontSize: 16.sp),
                                    hintText: "https://food_specialities/twitter.com",
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 17.r,
                                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                                  ),
                                  const Positioned.fill(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/pinterest-svgrepo-com.png")),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              SizedBox(
                                width: 340.w,
                                height: 25.h,
                                child: TextFormField(
                                  controller: tecPinrestLink,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 16.sp),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(bottom: 12),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(151, 151, 151, 0.48),
                                        fontFamily: "Roboto",
                                        fontSize: 16.sp),
                                    hintText: "https://foodspecialities/pinterest.com",
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 17.r,
                                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                                  ),
                                  const Positioned.fill(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/facebook-svgrepo-com.png")),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              SizedBox(
                                width: 340.w,
                                height: 25.h,
                                child: TextFormField(
                                  controller: tecFacebookLink,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 16.sp),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(bottom: 12),
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                        color: const Color.fromRGBO(151, 151, 151, 0.48),
                                        fontFamily: "Roboto",
                                        fontSize: 16.sp),
                                    hintText: "https://foodspeciality/facebook.com",
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                  
                          sizedBoxHeight(20.h)
                        ],
                      );
                
                      });
                      
                  })
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
