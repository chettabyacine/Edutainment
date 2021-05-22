import 'package:edutainment/widgets/WidgetQuestionBoxImage.dart';
import 'package:edutainment/widgets/WidgetQuestionBoxText.dart';
import '../../../models/classes/QuestionQCM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/classes/QuestionInput.dart';

class LevelBrain {
  int questionNumber = 0;
  List<dynamic> questionBank = [
    QuestionQCM(
      questionWidget: WidgetQuestionBoxImage(image:SvgPicture.asset('assets/rectangle.svg')),
      choices: [
        Text(
          'Rectangle',
          style: TextStyle(color: Colors.black),
        ),
        Text(
          'Triangle',
          style: TextStyle(color: Colors.black),
        ),
        Text(
          'Cercle',
          style: TextStyle(color: Colors.black),
        ),
        Text(
          'Carée',
          style: TextStyle(color: Colors.black),
        ),
      ],
      correctIndex: 0,
      usesInput: false,
    ),
    QuestionQCM(
      questionWidget: WidgetQuestionBoxText(questionText: 'Où est le cercle?'),
      choices: [
        SvgPicture.asset('assets/triangle.svg'),
        SvgPicture.asset('assets/star.svg'),
        SvgPicture.asset('assets/trapezoid.svg'),
        SvgPicture.asset('assets/circle.svg'),
      ],
      correctIndex: 3,
      usesInput: false,
    ),
    QuestionInput(
      questionWidget: WidgetQuestionBoxImage(image:SvgPicture.asset('assets/rectangle.svg')),
      correctAnswers: ['rectangle','rectangles','un rectangle'],
      usesInput: true,
    ),
  ];
  void nextQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
    }
  }
}
