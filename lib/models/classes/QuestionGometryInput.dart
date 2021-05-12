import 'QuestionGeometry.dart';
class QuestionGeometryInput extends QuestionGeometry {
  String _userInput;
  List<String> _correctAnswers;

  QuestionGeometryInput(String content, int complexity, String helpString,
      String userInput, List<String> correctAnswers)
      : super(content:content, complexity:complexity, helpString:helpString) {
    _userInput = userInput;
    _correctAnswers = correctAnswers;
  }

  String getUserInput() {
    return this._userInput;
  }

  void setUserInput(String userInputString) {
    this._userInput = userInputString;
  }

  List<String> getCorrectAnswers() {
    return this._correctAnswers;
  }

  void setCorrectAnswers(List<String> correctAnswer) {
    this._correctAnswers = correctAnswer;
  }
}