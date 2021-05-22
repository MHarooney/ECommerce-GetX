import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxflutter/core/view_model/profile_view_model.dart';
import 'package:getxflutter/view/auth/login_view.dart';
import 'package:getxflutter/view/widgets/custom_text.dart';
import 'package:getxflutter/view/widgets/default_button.dart';
import 'package:getxflutter/view/widgets/profile_settings/list_item_tile.dart';

import '../constants.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) =>
      controller.loading.value
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Scaffold(
        body: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                image: DecorationImage(
                                  image: controller.userModel == null
                                      ? NetworkImage(
                                      'https://image.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg')
                                      : controller.userModel.pic ==
                                      'default'
                                      ? NetworkImage(
                                      'https://image.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg')
                                      : NetworkImage(
                                      controller.userModel.pic),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: controller.userModel.name,
                                  color: Colors.black,
                                  // fontSize: 32,
                                ),
                                Container(
                                  width:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width *
                                      .6,
                                  child: CustomText(
                                    text: controller.userModel.email,
                                    color: Colors.black,
                                    maxLine: 2,
                                    overflow: TextOverflow.ellipsis,
                                    // fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ProfileSettingsListTileItem(
                  ltText: 'EditProfile',
                  ltLeadingIconImage: 'assets/menu_icon/Icon_Edit-Profile.png',
                  ltTrailingIcon: navigateNext,
                  ltOnPressed: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileSettingsListTileItem(
                  ltText: 'Shipping Address',
                  ltLeadingIconImage: 'assets/menu_icon/Icon_Location.png',
                  ltTrailingIcon: navigateNext,
                  ltOnPressed: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileSettingsListTileItem(
                  ltText: 'Order History',
                  ltLeadingIconImage: 'assets/menu_icon/Icon_Alert.png',
                  ltTrailingIcon: navigateNext,
                  ltOnPressed: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileSettingsListTileItem(
                  ltText: 'Cards',
                  ltLeadingIconImage: 'assets/menu_icon/Icon_Payment.png',
                  ltTrailingIcon: navigateNext,
                  ltOnPressed: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileSettingsListTileItem(
                  ltText: 'Notifications',
                  ltLeadingIconImage: 'assets/menu_icon/Icon_Alert.png',
                  ltTrailingIcon: navigateNext,
                  ltOnPressed: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                ProfileSettingsListTileItem(
                  ltText: 'Log Out',
                  ltLeadingIconImage: 'assets/menu_icon/Icon_Exit.png',
                  ltOnPressed: () {
                    controller.signOut();
                    Get.offAll(LoginView());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}