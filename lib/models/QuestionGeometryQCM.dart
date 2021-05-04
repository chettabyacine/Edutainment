import 'QuestionGeometry.dart';
class QuestionGeometryQCM extends QuestionGeometry {
  List<String> _options;
  int _correctAnswer;
  int _userChoice;

  QuestionGeometryQCM({String content, int complexity, String helpString,
      List<String> options, int correctAnswer, int userChoice})
      : super(content:content, complexity:complexity, helpString:helpString) {
    _options = options;
    _correctAnswer = correctAnswer;
    _userChoice = userChoice;
  }

  List<String> getOptions() {
    return this._options;
  }

  void setOptions(List<String> options) {
    this._options = options;
  }

  int getCorrectAnswer() {
    return this._correctAnswer;
  }

  void setCorrectAnswer(int correctAnswer) {
    this._correctAnswer = correctAnswer;
  }

  //-----------------------

  int getUserChoice() {
    return this._userChoice;
  }

  void setUserChoice(int userChoice) {
    this._userChoice = userChoice;
  }
}