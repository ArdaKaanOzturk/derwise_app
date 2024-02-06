//Custom text field
import 'dart:ui';

import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';

//* autofillHints eklensin - Arda *

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  final bool isPassword;

  const CustomTextField(
      {super.key, 
      required this.hintText,
      required this.keyboardType,
      required this.controller,
      this.isPassword = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: DerwiseTheme.textColorTertiary),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: const Icon(Icons.visibility_off),
                onPressed: toggleObscureText,
              )
            : null,
        filled: true,
        fillColor: DerwiseTheme.textColorPrimary,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: DerwiseTheme.textColorTertiary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}