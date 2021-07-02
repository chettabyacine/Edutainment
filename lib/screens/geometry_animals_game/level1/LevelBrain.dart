import 'package:edutainment/models/classes/Level.dart';

import '../../../widgets/WidgetQuestionBoxImage.dart';
import '../../../widgets/WidgetQuestionBoxText.dart';
import '../../../models/classes/QuestionQCM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/classes/QuestionInput.dart';

class LevelBrain extends Level {
  LevelBrain({int numberOfStars}) : super(numberOfStars: numberOfStars) {}
  int questionNumber = 0;
  List<dynamic> questionBank;

  bool nextQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
      return false;
    }
    return true;
  }
}
