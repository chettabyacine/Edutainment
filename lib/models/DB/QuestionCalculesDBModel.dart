import 'package:edutainment/models/classes/AnswerCalculs.dart';
import 'package:edutainment/models/classes/QuestionCalculs.dart';

final String tableQuestionsCalcules = 'tableQuestionsCalcules';

class QuestionCalculesBDFields {
  static final List<String> values = [id, level, numberA, numberB, answer];
  static final String id = "_id";
  static final String level = "level";
  static final String numberA = "numberA";
  static final String numberB = "numberB";
  static final String answer = "answer";
}

class QuestionCalculesDBModel {
  int id;
  int level;
  String numberA;
  String numberB;
  int answer; // 0 for equals ; 1 for greater than ; -1 for less than

  QuestionCalculesDBModel(
      {this.id, this.level, this.numberA, this.numberB, this.answer});
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'level': level,
      'numberA': numberA,
      'numberB': numberB,
      'answer': answer,
    };
  }

  static QuestionCalculesDBModel fromMap(Map<String, dynamic> map) =>
      QuestionCalculesDBModel(
        id: map['_id'],
        level: map['level'],
        numberA: map['numberA'],
        numberB: map['numberB'],
        answer: map['answer'],
      );
  QuestionCalculesDBModel copy({
    int id,
    int level,
    String numberA,
    String numberB,
    int answer,
  }) =>
      QuestionCalculesDBModel(
        id: id ?? this.id,
        level: level ?? this.level,
        numberA: numberA ?? this.numberA,
        numberB: numberB ?? this.numberB,
        answer: answer ?? this.answer,
      );
  QuestionCalculs convertToRealQuestion() {
    return QuestionCalculs(
        content: "content",
        complexity: this.level,
        numberA: this.numberA,
        numberB: this.numberB,
        usedOperators: "+",
        correctAnswer: (this.answer == 0)
            ? AnswerCalculs.equals
            : ((this.answer > 0) ? AnswerCalculs.greater : AnswerCalculs.less));
  }
}
