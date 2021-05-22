import 'package:flutter/material.dart';
import 'QuestionAnimalsOrGeometry.dart';
class QuestionQCM extends QuestionAnimalsOrGeometry{
  List<Widget> choices;//list of the possible answers in their suitable format ie : text or image widgets
  int correctIndex;
  QuestionQCM({this.choices,this.correctIndex,bool usesInput,Widget questionWidget}): super(usesInput: usesInput,questionWidget: questionWidget) ;
  bool checkAnswer(int userIndex){
    return (userIndex==correctIndex);
  }
}