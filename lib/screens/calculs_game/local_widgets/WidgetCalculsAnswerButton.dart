import 'package:flutter/material.dart';
import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/models/data_state_managment/DataCalculsGame.dart';
import 'package:provider/provider.dart';

class WidgetCalculsAnswerButton extends StatelessWidget {
  WidgetCalculsAnswerButton({@required this.text});
  final String text;
  AnswerCalculs userAnswer() {
    if (text.compareTo("=") == 0) return AnswerCalculs.equals;
    if (text.compareTo("<") == 0) return AnswerCalculs.less;
    if (text.compareTo(">") == 0) return AnswerCalculs.greater;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataCalculsGame>(context);
    return Container(
      child: TextButton(
        onPressed: () {
          data.levelCalculs
              .getWaitingQuestions()
              .first
              .setUserAnswerCalculs(userAnswer());
          if (userAnswer() == data.correctAnswer()) {
            data.correctlyAnswered();
          } else {
            data.incorrectlyAnswered();
          }
        },
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Text(
          text,
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
