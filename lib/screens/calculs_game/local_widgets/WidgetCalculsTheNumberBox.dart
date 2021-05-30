import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter/material.dart';
import 'WidgetCalculsTheNumber.dart';

class WidgetCalculsTheNumberBox extends StatefulWidget {
  const WidgetCalculsTheNumberBox({
    this.numbe,
  });
  final String numbe;

  @override
  _WidgetCalculsTheNumberBoxState createState() =>
      _WidgetCalculsTheNumberBoxState();
}

class _WidgetCalculsTheNumberBoxState extends State<WidgetCalculsTheNumberBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 5,
            child: Container(
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
                "khra",
                style: TextStyle(
                  color: kBlueColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
