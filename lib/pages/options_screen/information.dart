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
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text(
            "The founders of this app are Yakup Yavuz & Arda Kaan Ozturk",
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
