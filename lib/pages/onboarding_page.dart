import 'package:derwise_app/pages/login_page.dart';
import 'package:derwise_app/pages/sign_up_page.dart';
import 'package:derwise_app/util/images_path.dart';
import 'package:derwise_app/widget/custom_onboarding_page_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    _controller.repeat();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [
                    Color.fromARGB(255, 33, 75, 243),
                    Color(0xFF3594DD),
                    Color(0xFF5036D5),
                    Color(0xFF5B16D0),
                    Color(0xFF4563DB),
                  ],
                  begin: _topAlignmentAnimation.value,
                  end: _bottomAlignmentAnimation.value,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        //  Image.asset(
                        //     "assets/images/derwise.png",
                        //height: 250,
                        //  width: 250,
                        //  alignment: Alignment.center,
                        //   ),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 50,
                              bottom: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      height:
                          20), // Derwise yazısının altında bir boşluk eklendi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomOnboardingButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        text: 'Sign up',
                        width: 150,
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(
                          width: 20), // Butonlar arasında bir boşluk eklendi
                      CustomOnboardingButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        text: 'Login',
                        width: 150,
                        backgroundColor: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
