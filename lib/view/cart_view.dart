import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getxflutter/constants.dart';
import 'package:getxflutter/core/view_model/cart_view_model.dart';
import 'package:getxflutter/view/widgets/custom_text.dart';
import 'package:getxflutter/view/widgets/default_button.dart';

import 'checkout/checkout_view.dart';

class CartView extends StatelessWidget {
  // List<String> names = <String>[
  //   '7arooney',
  //   '7arooney',
  //   '7arooney',
  //   '7arooney',
  //   '7arooney',
  // ];
  //
  // List<String> images = [
  //   'assets/images/chaire.png',
  //   'assets/images/chaire.png',
  //   'assets/images/chaire.png',
  //   'assets/images/chaire.png',
  //   'assets/images/chaire.png',
  // ];
  //
  // List<int> prices = <int>[
  //   100,
  //   200,
  //   300,
  //   400,
  //   500,
  // ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        body: controller.cartProductModel.length == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/cart_empty.svg',
                    width: MediaQuery.of(context).size.width * .4,
                    height: MediaQuery.of(context).size.height * .4,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Cart Empty',
                    alignment: Alignment.topCenter,
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height * .20,
                            child: Row(
                              children: [
                                Container(
                                  width: 140.0,
                                  child: Image.network(
                                    controller.cartProductModel[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.cover,
                                        child: CustomText(
                                          text: controller
                                              .cartProductModel[index].name,
                                          // fontSize: 24,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      CustomText(
                                        color: primaryColor,
                                        text:
                                            '\$ ${controller.cartProductModel[index].price.toString()}',
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Container(
                                        width: 140,
                                        color: Colors.grey.shade200,
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                bottom: 20,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .decreaseQuantity(index);
                                                },
                                                child: Icon(
                                                  Icons.minimize,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            CustomText(
                                              alignment: Alignment.center,
                                              text: controller
                                                  .cartProductModel[index]
                                                  .quantity
                                                  .toString(),
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: controller.cartProductModel.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 15.0,
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30.0,
                          right: 30,
                        ),
                        child: Column(
                          children: [
                            CustomText(
                              text: 'TOTAL',
                              fontSize: 22,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GetBuilder<CartViewModel>(
                              init: Get.find(),
                              builder: (controller) => CustomText(
                                text: '\$ ${controller.totalPrice}',
                                color: primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: DefaultButton(
                          width: 180.0,
                          onPressed: () {
                            Get.to(() => CheckOutView());
                          },
                          text: 'CHECKOUT',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}