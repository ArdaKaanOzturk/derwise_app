import 'package:derwise_app/pages/home_page.dart';
import 'package:derwise_app/theme.dart';
import 'package:derwise_app/widget/custom_button.dart';
import 'package:derwise_app/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  final Function loginTextButton = () {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Login',
        style: TextStyle(
          color: DerwiseTheme.lightBlue,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  };

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
              child: Align(
                //alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 255,
                          margin: const EdgeInsets.only(left: 5),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Create Account',
                                  style: TextStyle(
                                    color: DerwiseTheme.lightBlue,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                WidgetSpan(
                                    child: SizedBox(
                                  width: 1000,
                                )),
                                TextSpan(
                                  text: 'Sign up to get started',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        child: Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: CustomTextField(
                                  hintText: 'First Name',
                                  keyboardType: TextInputType.name,
                                  controller: _nameController,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: CustomTextField(
                                  hintText: 'Last Name',
                                  keyboardType: TextInputType.name,
                                  controller: _lastNameController,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Username',
                        keyboardType: TextInputType.text,
                        controller: _userNameController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Password',
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Confirm Password',
                        keyboardType: TextInputType.text,
                        controller: _confirmPasswordController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 50),
                      CustomButton(
                          text: 'Sign up',
                          onPressed: () {
                            setState(() {});
                          }),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Row(
                            children: [
                              const Text('Already have an account?'),
                              loginTextButton(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
