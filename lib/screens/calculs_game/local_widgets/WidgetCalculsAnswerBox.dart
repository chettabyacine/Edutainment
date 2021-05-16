import 'package:flutter/material.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'WidgetCalculsAnswerButton.dart';

class WidgetCalculsAnswerBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            height: 10,
          ),
        ),
        Expanded(
          flex: 9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WidgetCalculsAnswerButton(
                text: ">",
              ),
              WidgetCalculsAnswerButton(
                text: "=",
              ),
              WidgetCalculsAnswerButton(
                text: "<",
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 10,
          ),
        ),
      ],
    );
  }
}
