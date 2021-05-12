import 'Question.dart';
import 'AnswerCalculs.dart';
class QuestionCalculs extends Question {
  String _numberA;
  String _numberB;
  String _usedOperators;
  AnswerCalculs _correctAnswer;
  AnswerCalculs _userAnswer;

  QuestionCalculs(String content, int complexity, String numberA,
      String numberB, String usedOperators, AnswerCalculs correctAnswer)
      : super(content:content, complexity:complexity) {
    this._numberA = numberA;
    this._numberB = numberB;
    this._usedOperators = usedOperators;
    this._correctAnswer = correctAnswer;
  }

  String getNumberA() {
    return this._numberA;
  }

  void setNumberA(String numberA) {
    this._numberA = numberA;
  }

  String getNumberB() {
    return this._numberB;
  }

  void setNumberB(String numberB) {
    this._numberB = numberB;
  }

  String getUsedOperators() {
    return this._usedOperators;
  }

  void setUsedOperators(String usedOperators) {
    this._usedOperators = usedOperators;
  }

  AnswerCalculs getCorrectAnswer() {
    return this._correctAnswer;
  }

  void setCorrectAnswer(AnswerCalculs correctAnswer) {
    this._correctAnswer = correctAnswer;
  }

  AnswerCalculs getUserAnswerCalculs() {
    return _userAnswer;
  }

  void setUserAnswerCalculs(AnswerCalculs userAnswer) {
    this._userAnswer = userAnswer;
  }
}
