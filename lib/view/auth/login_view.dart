import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getxflutter/core/view_model/auth_view_model.dart';
import 'package:getxflutter/view/auth/register_view.dart';
import 'package:getxflutter/view/widgets/custom_circle_raw_material_btn.dart';
import 'package:getxflutter/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxflutter/view/widgets/default_button.dart';
import 'package:getxflutter/view/widgets/default_text_form_field.dart';

import '../../constants.dart';
import 'default_icon.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: GetBuilder<AuthViewModel>(
        init:AuthViewModel(),
        builder: (value) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
              right: 20,
              left: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Welcome,",
                        fontSize: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(RegisterView());
                        },
                        child: CustomText(
                          text: "Sign Up",
                          color: primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: 'Sign in to Continue',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DefaultTextFormField(
                    onSave: (value) {
                      controller.email = value;
                    },
                    // controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your email address';
                      }
                    },
                    label: 'Email Address',
                    prefix: Icons.email_outlined,
                  ),
                  // CustomTextFormField(
                  //   text: 'Email',
                  //   hint: 'iamdavid@gmail.com',
                  //   onSave: (value) {
                  //     controller.email = value;
                  //   },
                  //   validator: (value) {
                  //     if (value == null) {
                  //       print("ERROR");
                  //     }
                  //   },
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  DefaultTextFormField(
                    // controller: passwordController,
                    type: TextInputType.visiblePassword,
                    suffix: controller.suffix,
                    onSave: (value) {
                      if (_formKey.currentState.validate()) {
                        controller.signInWithEmailAndPassword(
                          // email: emailController.text,
                          // password: passwordController.text,
                        );
                      }
                    },
                    isPassword: controller.isPassword,
                    suffixPressed: () {
                      controller.changePasswordVisibility();
                    },
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'password is too short';
                      }
                    },
                    label: 'Password',
                    prefix: Icons.lock_outline,
                  ),
                  // CustomTextFormField(
                  //   text: 'Password',
                  //   hint: '**********',
                  //   onSave: (value) {
                  //     controller.password = value;
                  //   },
                  //   validator: (value) {
                  //     if (value == null) {
                  //       print('error');
                  //     }
                  //   },
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Forgot Password?',
                    fontSize: 14,
                    alignment: Alignment.topRight,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DefaultButton(
                    function: () {
                      _formKey.currentState.save();

                      if (_formKey.currentState.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                    },
                    text: 'sign in',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomText(
                    text: '-OR-',
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomCircleBtn(
                        onPressed: () {
                          controller.googleSignInMethod();
                        },
                        constraintWidth: 50,
                        constraintHeight: 50,
                        shapeBorder: CircleBorder(),
                        childCard: CustomIcon(
                          ipFontIc: FontAwesomeIcons.google,
                          colour: Colors.white,
                        ),
                        iconColor: Colors.white,
                        fillColor: Colors.red,
                      ),
                      CustomCircleBtn(
                        onPressed: () {
                          controller.facebookSignInMethod();
                        },
                        constraintWidth: 50,
                        constraintHeight: 50,
                        shapeBorder: CircleBorder(),
                        childCard: CustomIcon(
                          ipFontIc: FontAwesomeIcons.facebook,
                          colour: Colors.white,
                        ),
                        iconColor: Colors.white,
                        fillColor: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}