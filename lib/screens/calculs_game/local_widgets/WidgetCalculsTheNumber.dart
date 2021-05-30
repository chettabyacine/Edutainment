import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';

class WidgetCalculsTheNumber extends StatefulWidget {
  const WidgetCalculsTheNumber({
    this.number,
  });
  final String number;

  @override
  _WidgetCalculsTheNumberState createState() => _WidgetCalculsTheNumberState();
}

class _WidgetCalculsTheNumberState extends State<WidgetCalculsTheNumber> {
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
        widget.number,
        style: TextStyle(
          color: kBlueColor,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
