import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
   double width;
  

   CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width = double.infinity,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: DerwiseTheme.lightBlue,
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
