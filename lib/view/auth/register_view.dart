import 'package:getxflutter/core/view_model/auth_view_model.dart';
import 'package:getxflutter/view/auth/login_view.dart';
import 'package:getxflutter/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxflutter/view/widgets/default_button.dart';
import 'package:getxflutter/view/widgets/default_text_form_field.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        // leading: GestureDetector(
        //     onTap: () {
        //       Get.off(LoginView());
        //     },
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: Colors.black,
        //     )),
        leading: IconButton(
          onPressed: () {
            Get.off(() => LoginView());
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder(
        init: AuthViewModel(),
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
                  CustomText(
                    text: "Sign Up,",
                    fontSize: 30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DefaultTextFormField(
                    onSave: (value) {
                      controller.name = value;
                    },
                    // controller: nameController,
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                    label: 'User Name',
                    prefix: Icons.person,
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
                      controller.password = value;
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
                  SizedBox(
                    height: 15,
                  ),
                  DefaultButton(
                    onPressed: () {
                      _formKey.currentState.save();

                      if (_formKey.currentState.validate()) {
                        controller.createAccountWithEmailAndPassword();
                      }
                    },
                    text: 'sign up',
                  ),
                  SizedBox(
                    height: 40,
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