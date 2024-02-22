import 'package:flutter/material.dart';

class VideoChatPage extends StatefulWidget {
  const VideoChatPage({super.key});

  @override
  State<VideoChatPage> createState() => _VideoChatPageState();
}

class _VideoChatPageState extends State<VideoChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/videochat.png',
          fit: BoxFit.cover, // Resmi ekranın tamamına sığdırır.
        ),
      ),
    );
  }
}
