import 'package:edutainment/models/classes/Level.dart';

import 'package:edutainment/widgets/WidgetQuestionBoxImage.dart';
import 'package:edutainment/widgets/WidgetQuestionBoxText.dart';
import '../../../models/classes/QuestionQCM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/classes/QuestionInput.dart';
import 'package:edutainment/models/DB/QuestionGeometryDBModel.dart';
import 'package:edutainment/models/DB/QuestionDB.dart';
class LevelBrain extends Level {
  LevelBrain({int numberOfStars}) : super(numberOfStars: numberOfStars) {}
  int questionNumber = 0;
  List<dynamic> questionBank=[];

  bool nextQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
      return false;
    }
    return true;
  }
  Future fillQuestionBank(int level) async {
    final List<QuestionGeometryDBModel> list = await QuestionDB.instance.readLevelGeometry(level);
    for (QuestionGeometryDBModel questionGeometry in list){
      questionBank.add(questionGeometry.convertToRealQuestion());
    }
  }
}
