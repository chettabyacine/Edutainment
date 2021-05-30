import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/utils/theme_constants.dart';

class WidgetCalculsAnswerButton extends StatefulWidget {
  WidgetCalculsAnswerButton({@required this.text, @required this.levelCalculs});
  final String text;
  final LevelCalculs levelCalculs;

  @override
  _WidgetCalculsAnswerButtonState createState() =>
      _WidgetCalculsAnswerButtonState();
}

class _WidgetCalculsAnswerButtonState extends State<WidgetCalculsAnswerButton> {
  AnswerCalculs userAnswer() {
    if (widget.text.compareTo("=") == 0) return AnswerCalculs.equals;
    if (widget.text.compareTo("<") == 0) return AnswerCalculs.less;
    if (widget.text.compareTo(">") == 0) return AnswerCalculs.greater;
    return AnswerCalculs.none;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          setState(() {
            if (userAnswer().index ==
                widget.levelCalculs
                    .getWaitingQuestions()
                    .first
                    .getCorrectAnswer()
                    .index) {
              widget.levelCalculs.incrementCurrentScore();
            } else {}
          });
        },
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.6,
          style: BorderStyle.solid,
          color: kBlueColor,
        ),
      ),
    );
  }
}
