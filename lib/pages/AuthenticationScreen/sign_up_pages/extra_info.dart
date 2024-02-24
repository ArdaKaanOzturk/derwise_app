import 'dart:io';

import 'package:derwise_app/controllers/authentication_controller.dart';
import 'package:derwise_app/global/common/toast.dart';
import 'package:derwise_app/pages/AuthenticationScreen/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:derwise_app/pages/home_page.dart';
import 'package:derwise_app/theme.dart';
import 'package:derwise_app/util/images_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtraInfoPage extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  const ExtraInfoPage({super.key, required this.username, required this.email, required this.password});

  @override
  State<ExtraInfoPage> createState() => _ExtraInfoPageState();
}

class _ExtraInfoPageState extends State<ExtraInfoPage> {

  late final String username;
  late final String email;
  late final String password;

  final AuthenticationController _authController = Get.find();
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _favoriteSubjectsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    username = widget.username;
    email = widget.email;
    password = widget.password;
  }

   @override
  void dispose() {
    _universityController.dispose();
    _departmentController.dispose();
    _aboutController.dispose();
    _favoriteSubjectsController.dispose();
    super.dispose();
  }

  final departments = [
    "Architecture",
    "Computer Programming",
    "Dentistry",
    "Electrical-Electronic Engineering",
    "Gastronomy and Kitchen Arts",
    "International Relations",
    "Industrial Design",
    "Nutrition and Dietetics",
    "Physhcology",
    "Software Engineering"
  ];
  String? value;

  List<String> _selectedItems = []; // Updated to store selected subjects
  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamicly fetched from a database/API
    final List<String> items = [
      "Architectural Design",
      "Introduction to Programming",
      "Dental Anatomy",
      "Circuit Theory",
      "Introduction to International Relations",
      "Design Fundamentals",
      "Human Nutrition",
      "Introduction to Psychology",
      "Software Requirements Engineering",
      "Structural Analysis",
      "Data Structures and Algorithms",
      "Oral Health Sciences",
      "Digital Electronics",
      "Food Safety and Sanitation",
      "Global Governance",
      "Product Design",
      "Clinical Nutrition",
      "Cognitive Psychology",
      "Software Testing and Quality Assurance"
    ];

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(items: items);
        });

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

    bool _isCompletingSignUp = false;


 _completeSignUp() async {
  // Perform sign up completion logic here
  setState(() {
    _isCompletingSignUp = true;
  });

   String university = _universityController.text;
    String department = _departmentController.text;
    String about = _aboutController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password, username);
  if (user != null) {
    _authController.completeSignUp(university, department, _selectedItems, about);
    setState(() {
      _isCompletingSignUp = false;
    });
    Get.offAll(const HomePage());
  } else {
    setState(() {
      _isCompletingSignUp = false;
    });
    showToast(message: "Some error happend");
  }
}

  var authenticationController = AuthenticationController.authController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Additional Informations", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: DerwiseTheme.backgroundApp,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),

                //choose profile image
                Column(
                  children: [
                     const Text("Profile Image:",
                        style: TextStyle(color: DerwiseTheme.lightBlue, fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 20),
                    authenticationController.imageFile == null ?
                    CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage(ImageConstant.emptyProfileImage),
                        backgroundColor: Colors.black,
                      ): Container(
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
                              )
                            )
                            )
                        )
                      ),
                     Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () async{
                        await authenticationController.pickImageFileFromGallery();

                        setState(() {
                          authenticationController.imageFile;
                        });

                      }, icon: const Icon(
                        Icons.image_outlined,
                        color: Colors.grey,
                        size: 25
                        )
                       ),

                       const SizedBox(width: 10,),

                       IconButton(onPressed: () async{
                        await authenticationController.captureImageFromPhoneCamera();

                        setState(() {
                          authenticationController.imageFile;
                        });
                        
                      }, icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey,
                        size: 25
                        )
                       )
                    ],
                  ),
                  ],
                ),

                const SizedBox(height: 50),

                Column(
                  children: [
                    const Text("University:",
                        style: TextStyle(color: DerwiseTheme.lightBlue, fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 20),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          controller: _universityController,
                          decoration: const InputDecoration(
                            hintText: "Type Your University Here",
                          ),
                        )
                      ],
                    ))
                  ],
                ),

                const SizedBox(height: 50),

                Column(
                  children: [
                    const Text("Department:",
                        style: TextStyle(color: DerwiseTheme.colorBlue, fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 20),
                    Container(
                      width: 400,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: value,
                          iconSize: 35,
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                          isExpanded: true,
                          items: departments.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(() {
                            this.value = value;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                
                Column(
                  children: [
                    const Text("Favorite Subjects:",
                        style: TextStyle(color: DerwiseTheme.colorBlue, fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 20),
                    ElevatedButton(onPressed: _showMultiSelect, child: const Text("Select subjects you are good at")
                    ),
                  ],
                ),

                const Divider(
                  height: 30,
                ),
                // display selected items
                Wrap(
                  children: _selectedItems.map((e) => Chip(label: Text(e),
                  ))
                  .toList(),
                ),

                const SizedBox(height: 50),

                Column(
                  children: [
                    const Text("About:",
                        style: TextStyle(color: DerwiseTheme.lightBlue, fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 10),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          controller: _aboutController,
                          decoration: const InputDecoration(
                            hintText: "Type Something About Yourself",
                          ),
                        )
                      ],
                    ))
                  ],
                ),

                const SizedBox(height: 100),

                // Continue Button
                GestureDetector(
                  onTap: _completeSignUp,
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50,)

              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String departments) => DropdownMenuItem(
        value: departments,
        child: Text(departments, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      );
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({super.key, required this.items});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

  // This function is triggeered when a chechbox is checked  or unchecked
  void _itemChange(String itemValue, bool isSelected){
    setState(() {
      if(isSelected){
        _selectedItems.add(itemValue);
      }else{
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the cancel button is pressed
  void _cancel(){
    Navigator.pop(context);
  }

  // function is called when the submit button is tapped
  void _submit(){
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Subjects"),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) => CheckboxListTile(value: _selectedItems.contains(item),
          title: Text(item),
          controlAffinity: ListTileControlAffinity.leading,
           onChanged: (isChecked)=>_itemChange(item, isChecked!),
           ))
           .toList(),
        ),
      ),
      actions: [
        TextButton(onPressed: _cancel, child: const Text("Cancel")
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const  Text("Submit"),
        ),
      ],
    );
  }
}
