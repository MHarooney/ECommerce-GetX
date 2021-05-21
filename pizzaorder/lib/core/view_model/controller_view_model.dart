import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ControllerViewModel extends GetxController with SingleGetTickerProviderMixin {
  AnimationController _controller;
  Animation<double> _pizzaScaleAnimation;
  Animation<double> _pizzaOpacityAnimation;
  Animation<double> _boxEnterScaleAnimation;
  Animation<double> _boxExitScaleAnimation;
  Animation<double> _boxExitToCartAnimation;
  VoidCallback onComplete;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );
    _pizzaScaleAnimation = Tween(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        curve: Interval(0.0, 0.2),
        parent: _controller,
      ),
    );
    _pizzaOpacityAnimation = CurvedAnimation(
      curve: Interval(0.2, 0.4),
      parent: _controller,
    );
    _boxEnterScaleAnimation = CurvedAnimation(
      curve: Interval(0.0, 0.2),
      parent: _controller,
    );
    _boxExitScaleAnimation = Tween(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        curve: Interval(0.5, 0.7),
        parent: _controller,
      ),
    );
    _boxExitToCartAnimation = CurvedAnimation(
      curve: Interval(0.83, 1.0, curve: Curves.easeOutCubic),
      parent: _controller,
    );
    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     widget.onComplete();
    //   }
    // });
    // _controller.forward();
  }
}