import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derwise_app/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController{

  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);
  List<Person> get allUsersProfileList => usersProfileList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    usersProfileList.bindStream(
      FirebaseFirestore.instance.collection("users").where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots().map((QuerySnapshot queryDataSnapshot){
        
        List<Person> profilesList = [];

        for(var eachProfile in queryDataSnapshot.docs){
          profilesList.add(Person.fromDataSnapshot(eachProfile));
        }
        return profilesList;
      })
    );
  }

}
