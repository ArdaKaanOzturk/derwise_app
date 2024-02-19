import 'package:cloud_firestore/cloud_firestore.dart';

class Person{
  //personal info
  String? imageProfile;
  String? name;
  String? userName;
  String? email;
  String? password;

  Person({
    this.imageProfile,
    this.name,
    this.userName,
    this.email,
    this.password,
  });

  static Person fromdataSnapshot(DocumentSnapshot snapshot){
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
    return Person(
      name: dataSnapshot["name"],
      imageProfile: dataSnapshot["imageProfile"],
      userName: dataSnapshot["username"],
      email: dataSnapshot['email'],
      password: dataSnapshot["password"],
    );
  }

  Map<String, dynamic> toJson()=>{
    "imageProfile": imageProfile,
    "name": name,
    "username" : userName,
    "email" : email,
    "password" : password
  };
}