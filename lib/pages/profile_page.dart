import 'package:derwise_app/controllers/authentication_controller.dart';
import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:derwise_app/models/person.dart';

/*
class ProfilePage extends StatelessWidget {
  final AuthenticationController _authController = Get.find();

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Profile userProfile = _authController.userProfile;

    return SafeArea(
      child: Scaffold(
        backgroundColor: DerwiseTheme.backgroundApp,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Profil bilgilerini gösteren widget'lar
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(userProfile.imageUrl),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      userProfile.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userProfile.email,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),

              // Bağlantı bilgileri
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Connections',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: DerwiseTheme.lightBlue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Bağlantılar listesi buraya eklenebilir
                    // Örneğin: _buildConnectionsList(userProfile.connections),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        // Bağlantı ekleme sayfasına yönlendirme
                        // Örneğin: Navigator.pushNamed(context, '/addConnection');
                      },
                      child: const Text('Add Connection'),
                    ),
                  ],
                ),
              ),

              // Profil bilgileri
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: DerwiseTheme.lightBlue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userProfile.about,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/