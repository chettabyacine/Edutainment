import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';

class WidgetSnackBarText extends StatelessWidget {
  String text;

  WidgetSnackBarText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kSnackBarTextStyle,
    );
  }
}