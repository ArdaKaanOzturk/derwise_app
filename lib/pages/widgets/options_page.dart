import 'package:derwise_app/pages/notification.dart';
import 'package:derwise_app/pages/widgets/uptade_profile_screens.dart';
import 'package:derwise_app/theme.dart';
import 'package:derwise_app/util/images_path.dart';
import 'package:derwise_app/util/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';

class OptionsPages extends StatefulWidget {
  const OptionsPages({super.key});

  @override
  State<OptionsPages> createState() => _OptionsPagesState();
}

class _OptionsPagesState extends State<OptionsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
        backgroundColor: DerwiseTheme.backgroundApp,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            Image.asset(ImageConstant.userProfileImage)),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: const Icon(LineAwesomeIcons.alternate_pencil,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Text(tProfileHeading,
                  style: Theme.of(context).textTheme.headline4),
              Text(tProfileSubHeading,
                  style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: DerwiseTheme.lightBlue,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    tEditProfile,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              // menu

              ProfileMenuWidget(
                title: "Settings",
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Billing Details",
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),
              ProfileMenuWidget(
                  title: "User Management",
                  icon: LineAwesomeIcons.user_check,
                  onPress: () => (() => const UpdateProfileScreen())),
              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                  title: "Information",
                  icon: LineAwesomeIcons.info,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: " Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.white),
          child: Icon(
            icon,
            color: DerwiseTheme.bottomBarSecondary,
          )),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: DerwiseTheme.bottomBarSecondary,
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.white))
          : null,
    );
  }
}
