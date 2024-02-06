import 'package:derwise_app/pages/Chat_Screen/models/chat_message.dart';
import 'package:derwise_app/pages/Chat_Screen/modules/chat_detail_page.dart';
import 'package:derwise_app/pages/Chat_Screen/models/chat_message.dart';
import 'package:derwise_app/pages/Chat_Screen/modules/chat_detail_page.dart';
import 'package:derwise_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  ChatMessage chatMessage;
  ChatBubble({required this.chatMessage});
  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Align(
        alignment: (widget.chatMessage.type == MessageType.Receiver
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.chatMessage.type == MessageType.Receiver
                ? const Color.fromARGB(46, 60, 195, 195)
                : const Color.fromARGB(255, 60, 76, 195)),
          ),
          padding: EdgeInsets.all(16),
          child: Text(widget.chatMessage.message),
        ),
      ),
    );
  }
}
