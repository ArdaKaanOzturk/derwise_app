import 'package:flutter/material.dart';
import 'package:derwise_app/theme.dart';

class UserLeaderBoard {
  String name;
  int score;

  UserLeaderBoard(this.name, this.score);
}

class LeaderboardScreen extends StatelessWidget {
  final List<UserLeaderBoard> users = [
    UserLeaderBoard('User1', 100),
    UserLeaderBoard('User2', 150),
    UserLeaderBoard('User3', 120),
    UserLeaderBoard('User4', 80),
    UserLeaderBoard(
      'User5',
      200,
    )
  ];

  @override
  Widget build(BuildContext context) {
    users.sort((a, b) => b.score.compareTo(a.score));

    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: DerwiseTheme.backgroundApp,
        title: Text(
          'Standings',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Column(
                children: List.generate(users.length, (index) {
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(user.name),
                    trailing: Text(
                      '${user.score} puan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LeaderboardScreen(),
    );
  }
}
