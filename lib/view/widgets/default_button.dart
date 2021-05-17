import 'package:flutter/material.dart';

import '../../constants.dart';

class DefaultButton extends StatelessWidget {
  final double width;
  final Color background;
  final bool isUpperCase;
  final double radius;
  final Function function;
  final String text;

  const DefaultButton({
    Key key,
    this.width = double.infinity,
    this.background = primaryColor,
    this.isUpperCase = true,
    this.radius = 8.0,
    @required this.function,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
  }
}