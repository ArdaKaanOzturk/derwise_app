import 'package:derwise_app/theme.dart';
import 'package:derwise_app/widget/hashtags_carousel.dart';
import 'package:derwise_app/widget/info_carousel.dart';
import 'package:flutter/material.dart';

class Profile {
  final String name;
  final String email;
  final String imageUrl;

  Profile({
    required this.name,
    required this.email,
    required this.imageUrl,
  });
}

final myProfile = Profile(
  name: 'John Doe',
  email: 'john.doe@example.com',
  imageUrl: 'https://example.com/john-doe.jpg',
);

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DerwiseTheme.backgroundApp,
        body: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
//Resim ve altındaki yazılar

              Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(myProfile.imageUrl),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    myProfile.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    myProfile.email,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
// Hashtagler

              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 24, left: 40),
                    child: Text(
                      "Hashtags",
                      textAlign: TextAlign.start,
                      style: TextStyle(),
                    ),
                  ),
                  HashtagsCarousel(
                    children: [
                      Icon(Icons.abc),
                      Icon(Icons.ac_unit),
                    ],
                  ),
                ],
              ),
              const InfoCarousel(
                children: [
                  Icon(Icons.abc),
                  Icon(Icons.ac_unit),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text("Edit Profile Settings")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text("Change Account")),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          child: const Text("Logout")),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
