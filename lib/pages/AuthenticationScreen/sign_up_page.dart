import 'dart:io';

import 'package:derwise_app/pages/home_page.dart';
import 'package:derwise_app/pages/AuthenticationScreen/login_page.dart';
import 'package:derwise_app/theme.dart';
import 'package:derwise_app/util/images_path.dart';
import 'package:derwise_app/widget/custom_button.dart';
import 'package:derwise_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/authentication_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ignore: prefer_function_declarations_over_variables
  final Function loginTextButton = () {
    return TextButton(
      onPressed: () {
        Get.to(const LoginScreen());
      },
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

  var authenticationController = AuthenticationController.authController;

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
        child: SingleChildScrollView(
        
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 100),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
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
                    const SizedBox(height: 50),
                    authenticationController.imageFile == null ?
                    CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage(
                          ImageConstant.emptyProfileImage
                          ),
                          backgroundColor: Colors.black,
                      ) :
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: FileImage(
                              File(
                                authenticationController.imageFile!.path,
                              ),
                            ),
                          )
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: () async{
                            await authenticationController.pickImageFileFromGallery();
                            setState(){
                              authenticationController.imageFile;
                            }
                          },
                           icon: const Icon(
                            Icons.image_outlined,
                            color: Colors.grey,
                            size: 30
                            )),

                          const SizedBox(width: 10),

                            IconButton(onPressed: () async{
                            await authenticationController.captureImageFromPhoneCamera();
                            setState(){
                              authenticationController.imageFile;
                            }
                          },
                           icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey,
                            size: 30
                            ))
                        ]
                      ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      hintText: 'Full Name',
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      hintText: 'Username',
                      keyboardType: TextInputType.text,
                      controller: _userNameController,
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      hintText: 'Password',
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [ 
                          CustomButton(
                            text: 'Sign up',
                            onPressed: () async{
                              if(authenticationController.profileImage != null){
                                if(_nameController.text.trim().isNotEmpty 
                                && _emailController.text.trim().isNotEmpty 
                                && _passwordController.text.trim().isNotEmpty 
                                && _userNameController.text.trim().isNotEmpty) 
                                {
                                  await authenticationController.createNewUserAccount(
                                    authenticationController.profileImage!,
                                    _nameController.text.trim(),
                                    _userNameController.text.trim(),
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                  );
                                }else{
                                  Get.snackbar("A Field is Empty", "Pleae fill out all field in the text fields");
                                }
                              }else{
                                Get.snackbar("Image File is Missing", "Pleae pick image from Gallery or capture with Camera");
                              }
                            }),
                             SizedBox(height: 10),
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
                      ),
                      SizedBox(height: 50)
                        ] 
                      ),
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
        ),

        ),

        
        
      ),
    );
  }
}
