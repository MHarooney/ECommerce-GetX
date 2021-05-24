import 'package:flutter/material.dart';
import 'package:getxflutter/constants.dart';
import 'package:getxflutter/helper/enum.dart';

class DeliveryTypesRadioListTile extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final Function onChanged;
  final Widget title;
  final Widget subtitle;

  const DeliveryTypesRadioListTile({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Delivery>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: title,
      subtitle: subtitle,
      activeColor: primaryColor,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}