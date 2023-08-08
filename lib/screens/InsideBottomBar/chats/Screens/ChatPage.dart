import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatDetails.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/controller/chat_controller.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  // List<ChatPrivate> chatPrivate = [
  //   ChatPrivate(
  //     name: "Priyanka Joshi",
  //     messageText: "Awesome Setup",
  //     imageURL: "assets/chef.png",
  //     time: "Now",
  //   ),
  //   ChatPrivate(
  //     name: "Mokshada Kesarkar",
  //     messageText: "That's Great",
  //     imageURL: "assets/ladychef.png",
  //     time: "Yesterday",
  //   ),
  //   ChatPrivate(
  //     name: "Sandeep Kanojia",
  //     messageText: "Hey where are you?",
  //     imageURL: "assets/boychef.png",
  //     time: "31 Mar",
  //   ),
  //   ChatPrivate(
  //     name: "Priyanka Joshi",
  //     messageText: "Busy! Call me in 20 mins",
  //     imageURL: "assets/chef.png",
  //     time: "28 Mar",
  //   ),
  //   ChatPrivate(
  //     name: "Mokshada Kesarkar",
  //     messageText: "Thankyou, It's awesome",
  //     imageURL: "assets/ladychef.png",
  //     time: "23 Mar",
  //   ),
  //   ChatPrivate(
  //     name: "Sandeep Kanojia",
  //     messageText: "will update you in evening",
  //     imageURL: "assets/boychef.png",
  //     time: "17 Mar",
  //   ),
  //   ChatPrivate(
  //     name: "Priyanka Joshi",
  //     messageText: "Can you please share the file?",
  //     imageURL: "assets/chef.png",
  //     time: "24 Feb",
  //   ),
  //   ChatPrivate(
  //     name: "Mokshada Kesarkar",
  //     messageText: "How are you?",
  //     imageURL: "assets/ladychef.png",
  //     time: "18 Feb",
  //   ),
  //   ChatPrivate(
  //     name: "Sandeep Kanojia",
  //     messageText: "Where are you?",
  //     imageURL: "assets/boychef.png",
  //     time: "20 Feb",
  //   ),
  // ];

  TextEditingController textcontroller = TextEditingController();
  final controllerChat = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // CustomAppBarWithNotification(titleTxt: "Chats"),
          Padding(
            // height: 50.h,
            padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
            child: TextField(
              style: TextStyle(fontSize: 16.sp),
              controller: textcontroller,
              onChanged: (text) {
                text = text.toLowerCase();
                controllerChat.searchFunction(text);
                // marketTickerList = marketTickerListStore.where((tName) {
                //     var tNameTitle = tName["pair"].toLowerCase();
                //     return tNameTitle.contains(text);
                //   }).toSet().toList();
                // setState(() {

                // });
              },
              decoration: InputDecoration(
                hintText: "search",
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
                child: GetBuilder<ChatController>(
                  builder: (_) {
                    return ListView.builder(
                      itemCount: controllerChat.chatPrivate.length,
                      shrinkWrap: true,
                      // padding: EdgeInsets.only(top: 16.h),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const ChatPrivateDetail();
                              }),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 16.w,
                                right: 16.w,
                                top: 10.h,
                                bottom: 10.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            controllerChat
                                                .chatPrivate[index].imageURL),
                                        maxRadius: 30.r,
                                      ),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.transparent,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                controllerChat
                                                    .chatPrivate[index].name,
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontFamily: "Roboto",
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 7.h,
                                              ),
                                              Text(
                                                controllerChat
                                                    .chatPrivate[index]
                                                    .messageText,
                                                style: TextStyle(
                                                    fontFamily: "Roboto",
                                                    fontSize: 15.sp,
                                                    color: Colors.grey.shade800,
                                                    fontWeight: (index == 0 ||
                                                            index == 3 ||
                                                            index == 2)
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    (index == 0 || index == 1)
                                        ? CircleAvatar(
                                            backgroundColor:
                                                AppColors.greyD3B3F43,
                                            radius: 11.h,
                                            child: Center(
                                                child: textWhite12Robo("2")),
                                          )
                                        : const SizedBox(),
                                    sizedBoxHeight(
                                        (index == 0 || index == 1) ? 5.h : 0),
                                    textgreyD10Robo(
                                        controllerChat.chatPrivate[index].time)
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
