import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxflutter/helper/local_storage_data.dart';
import 'package:getxflutter/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  final LocalStorageData localStorageData = Get.find();

  UserModel get userModel => _userModel;
  UserModel _userModel;


  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrenUser();
  }

  void getCurrenUser  () async{
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
    });
    _loading.value = false;
    update();
  }
}