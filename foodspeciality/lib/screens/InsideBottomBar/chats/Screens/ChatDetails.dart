import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    Timer(Duration(milliseconds: 50),
        () => myController.jumpTo(myController.position.maxScrollExtent));
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/chef.png'),
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Kriss Benwat",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Online",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13.sm),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    color: Colors.black87,
                  ),
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
              padding: EdgeInsets.only(top: 10, bottom: 60),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return messages[index].messageType == "receiver"
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 40.w,
                                height: 40.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset('assets/chef.png'),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      topLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                    ),
                                    color: Color(0xFFF2F2F2)),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  messages[index].messageContent,
                                  style: TextStyle(
                                      fontFamily: "Roboto", fontSize: 15.sm),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                  color: Color(0xFFE1E1E1),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  messages[index].messageContent,
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.sm,
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
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Send Message",
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: Text(
                                "Send",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 16.sm,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color(0xFF707070),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
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
