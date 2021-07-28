import 'package:edutainment/models/classes/Level.dart';
import 'package:edutainment/services/QuestionAnimalsDBModel.dart';
import 'package:edutainment/services/LocalDB.dart';
import 'package:edutainment/services/QuestionGeometryDBModel.dart';

import 'package:edutainment/widgets/WidgetQuestionBoxImage.dart';
import 'package:edutainment/widgets/WidgetQuestionBoxText.dart';
import '../../models/classes/QuestionQCM.dart';
import 'package:flutter/material.dart';

class LevelGeometryOrAnimals extends Level {
  LevelGeometryOrAnimals({int numberOfStars, int currentScore})
      : super(numberOfStars: numberOfStars, currentScore: currentScore) {}
  int questionNumber = 0;
  List<dynamic> questionBank = [];
  int remainingLives = 3;

  bool nextQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
      return false;
    }
    return true;
  }

  Future fillQuestionBank(
      {@required int level, @required bool isGeometry}) async {
    if (isGeometry) {
      final List<QuestionGeometryDBModel> list =
          await LocalDB.instance.readLevelGeometry(level);
      for (QuestionGeometryDBModel questionGeometry in list) {
        if (questionGeometry.level == level)
          questionBank.add(questionGeometry.convertToRealQuestion());
      }
    } else {
      final List<QuestionAnimalsDBModel> list =
          await LocalDB.instance.readLevelAnimals(level);
      for (QuestionAnimalsDBModel questionAnimals in list) {
        if (questionAnimals.level == level)
          questionBank.add(questionAnimals.convertToRealQuestion());
      }
    }
  }
}
