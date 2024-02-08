import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

class derwiseSocialScreen extends StatefulWidget {
  const derwiseSocialScreen({super.key});

  @override
  State<derwiseSocialScreen> createState() => _derwiseSocialScreenState();
}

class _derwiseSocialScreenState extends State<derwiseSocialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        backgroundColor: DerwiseTheme.backgroundApp,
        title: Text(
          'derwisesocial',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // arrow back
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              'Very Soon',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
