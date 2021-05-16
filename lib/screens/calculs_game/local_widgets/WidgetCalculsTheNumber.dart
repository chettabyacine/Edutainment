import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';

class WidgetCalculsTheNumber extends StatelessWidget {
  const WidgetCalculsTheNumber({
    this.number,
  });

  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xffD0E5F7),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: kBlueColor,
          width: 1.6,
          style: BorderStyle.solid,
        ),
      ),
      child: Text(
        number,
        style: TextStyle(
          color: kBlueColor,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
