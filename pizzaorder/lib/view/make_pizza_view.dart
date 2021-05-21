import 'package:flutter/material.dart';
import 'package:pizzaorder/view/widgets/pizza_details.dart';
import 'package:pizzaorder/view/widgets/pizza_ingredients.dart';

class MakePizzaView extends StatelessWidget {
  const MakePizzaView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Make your pizza',
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_shopping_cart),
            color: Colors.cyan,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 50,
            left: 10,
            right: 10,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: PizzaDetails(),
                  ),
                  // Expanded(
                  //   flex: 2,
                  //   child: PizzaIngredients(),
                  // ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 25,
          //   height: _pizzaCartSize,
          //   width: _pizzaCartSize,
          //   left: MediaQuery.of(context).size.width / 2 - _pizzaCartSize / 2,
          //   child: PizzaCartButton(
          //     onTap: () {
          //       bloc.startPizzaBoxAnimation();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}