import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derwise_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:derwise_app/models/person.dart' as personModel;

class AuthenticationController extends GetxController{

  static AuthenticationController authController = Get.find();

  late Rx<File?> pickedFile;

  File? get profileImage => pickedFile.value;
  XFile? imageFile;

  pickImageFileFromGallery() async{
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(imageFile != null){
      Get.snackbar("Profile Image", "you have successfully picked your profile image from gallery.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  captureImageFromPhoneCamera() async{
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if(imageFile != null){
      Get.snackbar("Profile Image", "you have successfully captured your profile image by using the camera.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> uploadImageToStorage(File imageFile) async{
    Reference referenceStorage = FirebaseStorage.instance.ref().child("Profile Images").child(FirebaseAuth.instance.currentUser!.uid); //uid for user ID

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    String downloadURLofImage = await snapshot.ref.getDownloadURL();

    return downloadURLofImage;
  }

createNewUserAccount(
  File imageProfile, String name, String userName, String email, String password) async{
    try {
      // 1. authenticate user and create user with email and password
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      // 2. upload image to storage
     String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);

     // 3. save user info to firestore database
    personModel.Person personInstance = personModel.Person(
      imageProfile: urlOfDownloadedImage,
      email: email,
      name: name,
      userName: userName,
      password: password
    );

    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(personInstance.toJson());

    Get.snackbar("Account is Created", "Congratulations, your account is created.");
    Get.to(const HomePage());
    }
    catch(errorMsg){
      Get.snackbar("Account Creation is Unsuccessful", "Error occured: $errorMsg");
    }
}
}
