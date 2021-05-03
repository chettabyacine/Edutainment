import 'Question.dart';

class QuestionGeometry extends Question {
  String _helpString;
  QuestionGeometry({String content, int complexity, String helpString})
      : super(content:content, complexity:complexity) {
    _helpString = helpString;
  }

  String getHelpString() {
    return this._helpString;
  }

  void setHelpString(String helpString) {
    this._helpString = helpString;
  }
}