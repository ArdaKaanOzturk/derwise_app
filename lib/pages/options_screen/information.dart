import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

class informationScreen extends StatefulWidget {
  const informationScreen({super.key});

  @override
  State<informationScreen> createState() => _informationScreenState();
}

class _informationScreenState extends State<informationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        backgroundColor: DerwiseTheme.backgroundApp,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          "The father of ideas Yakup Yavuz and Arda kaan Öztürk",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
