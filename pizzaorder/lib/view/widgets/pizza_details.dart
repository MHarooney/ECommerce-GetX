import 'package:flutter/material.dart';
import 'package:pizzaorder/core/view_model/pizza_order_bloc.dart';
import 'package:pizzaorder/core/view_model/pizza_order_provider.dart';
import 'package:pizzaorder/view/widgets/pizza_size_button.dart';

import '../../ingredient.dart';

class PizzaDetails extends StatelessWidget {
  const PizzaDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = PizzaOrderProvider.of(context);
    return Column(
      children: [
        Expanded(
          child: DragTarget<Ingredient>(
            onAccept: (ingredient) {
              print('onAccept');
              bloc.notifierFocused.value = false;
              bloc.addIngredient(ingredient);
              // _buildIngredientsAnimation();
              // _animationController.forward(from: 0.0);
            },
            onWillAccept: (ingredient) {
              print('onWillAccept');
              bloc.notifierFocused.value = true;
              return !bloc.containsIngredient(ingredient);
            },
            onLeave: (ingredient) {
              print('onLeave');
              bloc.notifierFocused.value = false;
            },
            builder: (context, list, rejects) {
              return LayoutBuilder(builder: (context, constraints) {
                // _pizzaConstraints = constraints;
                return ValueListenableBuilder<PizzaMetadata>(
                    valueListenable: bloc.notifierImagePizza,
                    builder: (context, data, child) {
                      if (data != null) {
                        // Future.microtask(() => _startPizzaBoxAnimation(data));
                      }

                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 60),
                        opacity: data != null ? 0.0 : 1,
                        child: ValueListenableBuilder<PizzaSizeState>(
                            valueListenable: bloc.notifierPizzaSize,
                            builder: (context, pizzaSize, _) {
                              return RepaintBoundary(
                                // key: _keyPizza,
                                child: RotationTransition(
                                  turns: CurvedAnimation(
                                    curve: Curves.elasticOut,
                                    // parent: _animationRotationController,
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: ValueListenableBuilder<bool>(
                                            valueListenable:
                                            bloc.notifierFocused,
                                            builder: (context, focused, _) {
                                              return AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                curve: Curves.easeInOut,
                                                height: focused
                                                    ? constraints.maxHeight *
                                                    pizzaSize.factor
                                                    : constraints.maxHeight *
                                                    pizzaSize.factor -
                                                    20,
                                                child: Stack(
                                                  children: [
                                                    DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 15.0,
                                                            color:
                                                            Colors.black26,
                                                            offset: Offset(
                                                                0.0, 5.0),
                                                            spreadRadius: 5.0,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Image.asset(
                                                          'assets/images/dish.png'),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          10.0),
                                                      child: Image.asset(
                                                          'assets/images/pizza-1.png'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      ValueListenableBuilder<Ingredient>(
                                          valueListenable:
                                          bloc.notifierDeletedIngredient,
                                          builder:
                                              (context, deletedIngredient, _) {
                                            // _animateDeletedIngredient(
                                            //     deletedIngredient);

                                            return AnimatedBuilder(
                                              // animation: _animationController,
                                              // builder: (context, _) {
                                              //   return _buildIngredientsWidget(
                                              //       deletedIngredient);
                                              // },
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    });
              });
            },
          ),
        ),
        const SizedBox(height: 5),
        ValueListenableBuilder<int>(
            valueListenable: bloc.notifierTotal,
            builder: (context, totalValue, _) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: animation.drive(
                        Tween<Offset>(
                          begin: Offset(0.0, 0.0),
                          end: Offset(
                            0.0,
                            animation.value,
                          ),
                        ),
                      ),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  '\$$totalValue',
                  key: UniqueKey(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
              );
            }),
        const SizedBox(height: 15),
        ValueListenableBuilder<PizzaSizeState>(
            valueListenable: bloc.notifierPizzaSize,
            builder: (context, pizzaSize, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PizzaSizeButton(
                    text: 'S',
                    onTap: () {
                      // _updatePizzaSize(PizzaSizeValue.s);
                    },
                    // selected: pizzaSize.value == PizzaSizeValue.s,
                  ),
                  PizzaSizeButton(
                    text: 'M',
                    onTap: () {
                      // _updatePizzaSize(PizzaSizeValue.m);
                    },
                    // selected: pizzaSize.value == PizzaSizeValue.m,
                  ),
                  PizzaSizeButton(
                    text: 'L',
                    onTap: () {
                      // _updatePizzaSize(PizzaSizeValue.l);
                    },
                    // selected: pizzaSize.value == PizzaSizeValue.l,
                  ),
                ],
              );
            }),
      ],
    );;
  }
}