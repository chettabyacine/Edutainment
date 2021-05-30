import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/models/classes/Level.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/models/classes/LevelCalculs.dart';
import 'WidgetCalculsAnswerButton.dart';

class WidgetCalculsAnswerBox extends StatefulWidget {
  final LevelCalculs levelCalculs;
  WidgetCalculsAnswerBox({@required this.levelCalculs});

  @override
  _WidgetCalculsAnswerBoxState createState() => _WidgetCalculsAnswerBoxState();
}

class _WidgetCalculsAnswerBoxState extends State<WidgetCalculsAnswerBox> {
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
              Container(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (AnswerCalculs.greater ==
                          widget.levelCalculs
                              .getWaitingQuestions()
                              .first
                              .getCorrectAnswer()) {
                        widget.levelCalculs.incrementCurrentScore();
                      } else {}
                    });
                  },
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Text(
                    '<',
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
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (AnswerCalculs.equals ==
                          widget.levelCalculs
                              .getWaitingQuestions()
                              .first
                              .getCorrectAnswer()) {
                        widget.levelCalculs.incrementCurrentScore();
                      } else {}
                    });
                  },
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Text(
                    '=',
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
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (AnswerCalculs.less ==
                          widget.levelCalculs
                              .getWaitingQuestions()
                              .first
                              .getCorrectAnswer()) {
                        widget.levelCalculs.incrementCurrentScore();
                      } else {}
                    });
                  },
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Text(
                    '>',
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
