import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxflutter/view/widgets/custom_text.dart';
import 'package:getxflutter/view/widgets/custom_text_form_field.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: 'Billing address is the same as delivery address',
                fontSize: 14,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: 'Street 1',
                hint: '21, Alex Davidson Avenue',
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: 'Street 2',
                hint: 'Opposite Omegatron, Vicent Quarters',
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: 'City',
                hint: 'Victoria Island',
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CustomTextFormField(
                          text: 'State',
                          hint: 'Lagos State',
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: CustomTextFormField(
                          text: 'Country',
                          hint: 'Nigeria',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}