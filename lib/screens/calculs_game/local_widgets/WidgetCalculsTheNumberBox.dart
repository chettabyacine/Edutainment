import 'package:flutter/material.dart';
import 'WidgetCalculsTheNumber.dart';

class WidgetCalculsTheNumberBox extends StatelessWidget {
  const WidgetCalculsTheNumberBox({
    this.number,
  });
  final String number;

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
            child: WidgetCalculsTheNumber(
              number: number,
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
