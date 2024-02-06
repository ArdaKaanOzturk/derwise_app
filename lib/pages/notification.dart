import 'package:derwise_app/theme.dart';
import 'package:derwise_app/util/images_path.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        backgroundColor: DerwiseTheme.backgroundApp,
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // arrow back
          color: Colors.white,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white, //

            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/notification.png",
              width: 370,
              height: 370,
              fit: BoxFit.cover,
            ),
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
