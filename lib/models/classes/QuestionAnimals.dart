import 'Question.dart';
class QuestionAnimals extends Question {
  List<String> _options;
  int _correctAnswer;
  int _userAnswerCalculs;
  String _help;
  QuestionAnimals(String content, int complexity, List<String> options,
      int correctAnswer, int userAnswerCalculs, String help)
      : super(content: content,complexity: complexity) {
    this._options = options;
    this._correctAnswer = correctAnswer;
    this._userAnswerCalculs = userAnswerCalculs;
    this._help = help;
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

  int getUserAnswerCalculs() {
    return this._userAnswerCalculs;
  }

  void setUserAnswerCalculs(int userAnswerCalculs) {
    this._userAnswerCalculs = userAnswerCalculs;
  }

  String getHelp() {
    return this._help;
  }

  void setHelp(String help) {
    this._help = help;
  }
}
