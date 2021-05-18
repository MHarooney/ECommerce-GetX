import 'package:get/get.dart';
import 'package:getxflutter/constants.dart';
import 'package:getxflutter/model/product_model.dart';
import 'package:getxflutter/view/home_view.dart';
import 'package:getxflutter/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:getxflutter/view/widgets/default_button.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .32,
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        CustomText(
                          text: model.name,
                          fontSize: 26,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Size',
                                  ),
                                  CustomText(
                                    text: model.sized,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .44,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: 'Color',
                                  ),
                                  Container(
                                    width: 25,
                                    height: 20,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20),
                                      color: model.color,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: 'Details',
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: model.description,
                          fontSize: 18,
                          height: 2.5,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          text: "PRICE ",
                          fontSize: 22,
                          color: Colors.grey,
                        ),
                        CustomText(
                          text: ' \$' + model.price,
                          color: primaryColor,
                          fontSize: 18,
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 180,
                      height: 100,
                      child: DefaultButton(
                        onPressed: () {},
                        text: 'add',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}