import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Model/ChatMessageModel.dart';
import 'package:get/get.dart';

class ChatPrivateDetail extends StatefulWidget {
  const ChatPrivateDetail({Key? key}) : super(key: key);

  @override
  _ChatPrivateDetailState createState() => _ChatPrivateDetailState();
}

class _ChatPrivateDetailState extends State<ChatPrivateDetail> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "receiver"),
    ChatMessage(messageContent: "...........", messageType: "sender"),
  ];
  ScrollController myController = ScrollController();

  @override
  void initState() {
    // _scrollDown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 50),
        () => myController.jumpTo(myController.position.maxScrollExtent));
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  CircleAvatar(
                    backgroundImage: const AssetImage('assets/chef.png'),
                    maxRadius: 20.r,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Kriss Benwat",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Online",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ),
                  // ignore: prefer_const_constructors
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              controller: myController,
              itemCount: messages.length,
              padding: EdgeInsets.only(top: 10.h, bottom: 60.h),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return messages[index].messageType == "receiver"
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 10.h),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 40.w,
                                height: 40.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Image.asset('assets/chef.png'),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25.r),
                                      topLeft: Radius.circular(25.r),
                                      bottomRight: Radius.circular(25.r),
                                    ),
                                    color: const Color(0xFFF2F2F2)),
                                padding: EdgeInsets.all(16.sp),
                                child: Text(
                                  messages[index].messageContent,
                                  style: TextStyle(
                                      fontFamily: "Roboto", fontSize: 15.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 10.h),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.r),
                                    bottomLeft: Radius.circular(25.r),
                                    topRight: Radius.circular(25.r),
                                  ),
                                  color: const Color(0xFFE1E1E1),
                                ),
                                padding: EdgeInsets.all(16.sp),
                                child: Text(
                                  messages[index].messageContent,
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.sp,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Send Message",
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 14.h),
                              child: Text(
                                "Send",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(10.sp),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
