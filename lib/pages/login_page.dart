import 'package:derwise_app/theme.dart';
import 'package:derwise_app/widget/custom_button.dart';
import 'package:derwise_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF10141F), Color(0xFF081B29)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: DerwiseTheme.lightBlue,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Login to get started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 32),
                    CustomTextField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: 'Password',
                      keyboardType: TextInputType.emailAddress,
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: DerwiseTheme.lightBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                        text: 'Login',
                        onPressed: () {
                          setState(() {});
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
