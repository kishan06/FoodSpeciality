import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Widgets/CommunityConversationList.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/controller/chat_controller.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

class ChatCommunityPage extends StatefulWidget {
  const ChatCommunityPage({Key? key}) : super(key: key);

  @override
  _ChatCommunityPageState createState() => _ChatCommunityPageState();
}

class _ChatCommunityPageState extends State<ChatCommunityPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  // List<ChatCommunity> chatcommunity = [
  //   ChatCommunity(
  //     name: "WDIPL",
  //     messageText:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
  //     imageURL: "assets/community.png",
  //     members: '4 Members',
  //   ),
  //   ChatCommunity(
  //     name: "Food Specialities",
  //     messageText:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
  //     imageURL: "assets/community.png",
  //     members: '4 Members',
  //   ),
  //   ChatCommunity(
  //     name: "WDIPL",
  //     messageText:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
  //     imageURL: "assets/community.png",
  //     members: '4 Members',
  //   ),
  //   ChatCommunity(
  //     name: "WDIPL",
  //     messageText:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
  //     imageURL: "assets/community.png",
  //     members: '4 Members',
  //   ),
  //   ChatCommunity(
  //     name: "Food Specialities",
  //     messageText:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
  //     imageURL: "assets/community.png",
  //     members: '4 Members',
  //   ),
  //   ChatCommunity(
  //     name: "WDIPL",
  //     messageText:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
  //     imageURL: "assets/community.png",
  //     members: '4 Members',
  //   ),
  //   ChatCommunity(
  //     name: "WDIPL",
  //     messageText:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
  //     imageURL: "assets/community.png",
  //     members: '4 Members',
  //   ),
  //   ChatCommunity(
  //     name: "Food Specialities",
  //     messageText:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
  //     imageURL: "assets/community.png",
  //     members: '4 Members',
  //   ),
  //   ChatCommunity(
  //     name: "WDIPL",
  //     messageText:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
  //     imageURL: "assets/community.png",
  //     members: '4 Members',
  //   ),
  // ];
  final controllerChat = Get.put(ChatController());

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
            child: TextField(
              style: TextStyle(fontSize: 16.sp),
              onChanged: (text) {
                text = text.toLowerCase();
                controllerChat.searchFunctionCom(text);
              },
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle:
                    TextStyle(fontSize: 15.sp, color: Colors.grey.shade600),
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20.sp,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8.sp),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: Color(0xFF707070),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    color: Color(0xFF707070),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 0.h),
              child: SingleChildScrollView(
                  child: GetBuilder<ChatController>(builder: (_) {
                return ListView.builder(
                  itemCount: controllerChat.chatcommunity.length,
                  shrinkWrap: true,
                  // padding: EdgeInsets.only(top: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CommunityConversationList(
                      name: controllerChat.chatcommunity[index].name,
                      member: controllerChat.chatcommunity[index].members,
                      messageText:
                          controllerChat.chatcommunity[index].messageText,
                      imageUrl: controllerChat.chatcommunity[index].imageURL,
                      isMessageRead: (index == 0 || index == 3 || index == 2)
                          ? true
                          : false,
                    );
                  },
                );
              })),
            ),
          ),
          // Container(height: 20.h,
          // color: AppColors.black,),
          // sizedBoxHeight(10.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  // ignore: deprecated_member_use
                  primary: const Color(0xFF3B3F43),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFF707070)),
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_circle_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Text(
                      "New Community",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontFamily: 'StudioProR',
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => addCommunityDailog());
                },
              ),
            ),
          ),

          // sizedBoxHeight(22.h)
        ],
      ),
    );
  }

  Widget addCommunityDailog() {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(16.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.h),
              color: AppColors.white,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 25.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          size: 30.h,
                          color: AppColors.greyM707070,
                        ),
                      ),
                    ],
                  ),
                  sizedBoxHeight(20.h),
                  SizedBox(
                    width: 200.w,
                    // height: 30.h,
                    child: TextFormField(
                      style: TextStyle(
                          color: Color(0xFF979797),
                          fontSize: 20.sp,
                          fontFamily: "StudioProR"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                            color: Color(0xFF979797),
                            fontSize: 20.sp,
                            fontFamily: "StudioProR"),
                        hintText: "Community Name",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  sizedBoxHeight(15.h),
                  TextFormField(
                    style: TextStyle(
                        color: Color(0xFF979797),
                        fontSize: 20.sp,
                        fontFamily: "StudioProR"),
                    cursorColor: const Color(0xFFFFB600),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(14.sp),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                            color: const Color(0xFF979797), width: 0.5.w),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                            color: const Color(0xFF979797), width: 0.5.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                            color: const Color(0xFF979797), width: 0.5.w),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(color: Colors.red, width: 1.w),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide(color: Colors.red, width: 1.w),
                      ),
                      hintStyle: TextStyle(
                          fontFamily: "StudioProR",
                          color: const Color(0x80000000),
                          fontSize: 17.sp),
                      hintText: "Community Description",
                    ),
                    minLines: 4,
                    maxLines: null,
                  ),
                  sizedBoxHeight(15.h),
                  SizedBox(
                    height: 50.h,
                    width: 170.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        // ignore: deprecated_member_use
                        primary: const Color(0xFF3B3F43),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF707070)),
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontFamily: 'StudioProR',
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed("communityaddparticipants");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: -50.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5.w,
                        color: AppColors.greyL979797,
                        spreadRadius: 2.w)
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.h,
                  child: SvgPicture.asset("assets/community.svg"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
