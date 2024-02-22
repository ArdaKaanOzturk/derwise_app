import 'package:derwise_app/theme.dart';
import 'package:derwise_app/util/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tEditProfile, style: Theme.of(context).textTheme.headline4),
        backgroundColor: DerwiseTheme.backgroundApp,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Stack(...),
            const SizedBox(height: 50),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}