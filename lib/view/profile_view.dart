import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxflutter/core/view_model/profile_view_model.dart';
import 'package:getxflutter/view/auth/login_view.dart';
import 'package:getxflutter/view/widgets/custom_text.dart';
import 'package:getxflutter/view/widgets/default_button.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        body: Container(
          child: Center(
            child: DefaultButton(
                onPressed: () {
                  controller.signOut();
                  Get.offAll(LoginView());
                },
                text: 'SignOut',),
          ),
        ),
      ),
    );
  }
}