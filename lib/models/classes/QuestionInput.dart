import 'package:flutter/material.dart';

import 'QuestionAnimalsOrGeometry.dart';

class QuestionInput extends QuestionAnimalsOrGeometry {
  List<String>
      correctAnswers; //the correct answer as a list to adapt to possible typos

  QuestionInput({this.correctAnswers, bool usesInput, Widget questionWidget})
      : super(usesInput: usesInput, questionWidget: questionWidget);

  bool checkAnswer(String userAnswer) {
    return correctAnswers.contains(userAnswer.toLowerCase());
  }
}
