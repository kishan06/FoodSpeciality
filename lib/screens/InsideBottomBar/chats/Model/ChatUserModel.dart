class ChatPrivate {
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatPrivate({
    required this.name,
    required this.messageText,
    required this.imageURL,
    required this.time,
  });
}

class ChatCommunity {
  String name;
  String members;
  String messageText;
  String imageURL;

  ChatCommunity({
    required this.name,
    required this.members,
    required this.messageText,
    required this.imageURL,
  });
}
