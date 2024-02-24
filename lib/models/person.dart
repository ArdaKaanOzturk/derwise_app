import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Person{
  // Personal info
  String? name;
  String? username;
  String? email;
  String? password;
  // Extra info
    String? imageProfile;
    String? university;
    String? department;
    List<String>? favoriteSubjects; 
    String? about;

  Person({
    this.name,
    this.username,
    this.email,
    this.password,
    this.imageProfile,
    this.university,
    this.department,
    this.favoriteSubjects,
    this.about,
  });

  static Person fromDataSnapshot(DocumentSnapshot snapshot){
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
    return Person(
      // Personal info
      name: dataSnapshot["name"],
      username: dataSnapshot["username"],
      email: dataSnapshot['email'],
      password: dataSnapshot["password"],
      // Extra info
      imageProfile: dataSnapshot["imageProfile"],
      university: dataSnapshot["university"],
      department: dataSnapshot["department"],
      favoriteSubjects: dataSnapshot["favorites"].cast<String>(),
      about: dataSnapshot["about"]
    );
  }

  Map<String, dynamic> toJson()=>{
    // Personal info
    "name": name,
    "username" : username,
    "email" : email,
    "password" : password,
    // Extra info
    "imageProfile": imageProfile,
    "university" : university,
    "department" : department,
    "favorites" : List.from(favoriteSubjects!),
    "about" : about
  };
}