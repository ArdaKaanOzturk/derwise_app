import 'package:derwise_app/pages/AuthenticationScreen/login_page.dart';
import 'package:derwise_app/pages/AuthenticationScreen/sign_up_page.dart';
import 'package:derwise_app/theme.dart';
import 'package:derwise_app/util/images_path.dart';
import 'package:derwise_app/widget/custom_onboarding_page_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  

  

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            width: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
              Image.asset(ImageConstant.logoImage, 
              width: 250,
              height: 250,
              alignment: Alignment.center,
              ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 50,
                      bottom: 15,
                    ),
                    child: Text(
                      "derwise",
                      style: TextStyle(
                        color: DerwiseTheme.colorBlue,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
              height:
                  60), // Derwise yazısının altında bir boşluk eklendi
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOnboardingButton(
                onPressed: () {
                 Get.to(const SignupScreen());
                },
                text: 'Sign up',
                width: 150,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                  width: 20), // Butonlar arasında bir boşluk eklendi
              CustomOnboardingButton(
                onPressed: () {
                  Get.to(const LoginScreen());
                },
                text: 'Login',
                width: 150,
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ],
      )
    );
  }
    }
