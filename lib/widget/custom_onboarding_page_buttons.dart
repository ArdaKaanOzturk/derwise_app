import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

class CustomOnboardingButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  double width;
  final Color backgroundColor;
  // derwise

  CustomOnboardingButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.onPressed,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: DerwiseTheme.textColorPrimary,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
