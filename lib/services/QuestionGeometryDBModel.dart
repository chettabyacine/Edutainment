import 'package:edutainment/widgets/WidgetQuestionBoxImage.dart';
import 'package:edutainment/widgets/WidgetQuestionBoxText.dart';
import 'package:edutainment/models/classes/QuestionQCM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:edutainment/models/classes/QuestionInput.dart';

final String tableQuestionsGeometry = 'tableQuestionsGeometry';

class QuestionGeometryBDFields {
  static final List<String> values = [
    id,
    level,
    type,
    usesInput,
    questionText,
    answers,
    correctIndex,
    imagePath
  ];
  static final String id = "_id";
  static final String level = "level";
  static final String type = "type";
  static final String usesInput = "usesInput";
  static final String questionText = "questionText";
  static final String answers = "answers";
  static final String correctIndex = "correctIndex";
  static final String imagePath = "imagePath";
}

class QuestionGeometryDBModel {
  int id;
  int level;
  int type;
  bool usesInput;
  String questionText;
  String answers;
  int correctIndex;
  String imagePath;

  QuestionGeometryDBModel(
      {this.id,
      this.level,
      this.type,
      this.usesInput,
      this.questionText,
      this.answers,
      this.correctIndex,
      this.imagePath});
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'level': level,
      'type': type,
      'usesInput': usesInput ? 1 : 0,
      'questionText': questionText,
      'answers': answers,
      'correctIndex': correctIndex,
      'imagePath': imagePath,
    };
  }

  static QuestionGeometryDBModel fromMap(Map<String, dynamic> map) =>
      QuestionGeometryDBModel(
        id: map['_id'],
        level: map['level'],
        type: map['type'],
        usesInput: map['usesInput'] == 1,
        questionText: map['questionText'],
        answers: map['answers'],
        correctIndex: map['correctIndex'],
        imagePath: map['imagePath'],
      );
  QuestionGeometryDBModel copy({
    int id,
    int level,
    int type,
    bool usesInput,
    String questionText,
    String answers,
    int correctIndex,
    String imagePath,
  }) =>
      QuestionGeometryDBModel(
        id: id ?? this.id,
        level: level ?? this.level,
        type: type ?? this.level,
        usesInput: usesInput ?? this.usesInput,
        questionText: questionText ?? this.questionText,
        answers: answers ?? this.answers,
        correctIndex: correctIndex ?? this.correctIndex,
        imagePath: imagePath ?? this.imagePath,
      );

  dynamic convertToRealQuestion() {
    if (this.usesInput) {
      return QuestionInput(
        usesInput: this.usesInput,
        correctAnswers: this.answers.split(','),
        questionWidget: WidgetQuestionBoxImage(
            image: SvgPicture.asset('${this.imagePath}')),
      );
    } else {
      final List<String> choices = this.answers.split(',');
      return QuestionQCM(
        usesInput: this.usesInput,
        correctIndex: this.correctIndex,
        questionWidget: (this.type == 1)
            ? WidgetQuestionBoxImage(
                image: SvgPicture.asset('${this.imagePath}'))
            : WidgetQuestionBoxText(questionText: this.questionText),
        choices: (this.type == 1)
            ? [
                Text(
                  choices[0],
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  choices[1],
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  choices[2],
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  choices[3],
                  style: TextStyle(color: Colors.black),
                ),
              ]
            : [
                SvgPicture.asset(
                    'assets/geometric shapes/2D shapes filled/${choices[0].toLowerCase()}.svg'),
                SvgPicture.asset(
                    'assets/geometric shapes/2D shapes filled/${choices[1].toLowerCase()}.svg'),
                SvgPicture.asset(
                    'assets/geometric shapes/2D shapes filled/${choices[2].toLowerCase()}.svg'),
                SvgPicture.asset(
                    'assets/geometric shapes/2D shapes filled/${choices[3].toLowerCase()}.svg'),
              ],
      );
    }
  }
}
